import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/Models/movies_model.dart';
import 'package:movie_app/UI/Views/Widgets/movie_item.dart';
import 'package:movie_app/UI/Views/Widgets/shimmers.dart';
import 'package:movie_app/UI/Views/moviel_details.dart';

class Movies extends ConsumerStatefulWidget {
  const Movies({
    super.key,
    required this.movieProvider,
    required this.title,
  });

  final FutureProvider<List<MovieModel>> movieProvider;
  final String title;

  @override
  ConsumerState<Movies> createState() => _MoviesState();
}

class _MoviesState extends ConsumerState<Movies> {
  @override
  Widget build(BuildContext context) {
    final _movieProvider = ref.watch(widget.movieProvider);
    return _movieProvider.when(data: (data) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            fit: FlexFit.loose,
            flex: 0,
            child: Text(
              widget.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final movie = data.elementAt(index);
                  return InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MovieDetails(movie: movie))),
                    child: MovieListItem(
                      name: movie.title.toString(),
                      imageUrl: movie.fullPosterPathUrl,
                      desc: 'Release Date: ${movie.releaseDate}',
                    ),
                  );
                },
                shrinkWrap: true,
                itemCount: data.length,
              ),
            ),
          )
        ],
      );
    }, error: (e, s) {
      print('$e,$s');
      return ErrorWidget('Error occurred please try again');
    }, loading: () {
      return const ShimmerWidget();
    });
  }
}
