import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/Models/movies_model.dart';
import 'package:movie_app/UI/Views/Widgets/play_trailer.dart';
import 'package:movie_app/repo/movie.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetails extends ConsumerWidget {
  const MovieDetails({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> _launchUrl(url) async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    final _videoKey = ref.watch(getVideoKeyFutureProvider(movie.id ?? 0));

    return Scaffold(
      body: Stack(
        children: [
          ..._buildDetails(
            context,
            movie,
          ),
          _buildMovieDetails(context),
          _videoKey.when(data: (data) {
            print(data?[0].key);
            return PlayButton(
              func: () => _launchUrl(
                  Uri.parse('https://www.youtube.com/watch?v=${data?[0].key}')),
              title: 'Play Trailer',
            );
          }, error: (e, s) {
            return PlayButton(
              func: () {},
              title: 'Error Loading Trailer',
            );
          }, loading: () {
            return PlayButton(
              func: () {},
              title: 'Loading',
            );
          })
        ],
      ),
    );
  }

  Positioned _buildMovieDetails(BuildContext context) {
    return Positioned(
      bottom: 150,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              movie.title.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              movie.releaseDate.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              movie.overview.toString(),
              maxLines: 8,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    height: 1.75,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            RatingBar.builder(
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              },
              onRatingUpdate: (rating) {},
              initialRating: (movie.vote_average ?? 0.0) / 2,
              minRating: 1,
              maxRating: 5,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              ignoreGestures: true,
              unratedColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> _buildDetails(context, movie) {
  return [
    Container(
      height: double.infinity,
      color: const Color(0xFF000B49),
    ),
    Image.network(
      movie.fullPosterPathUrl,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      fit: BoxFit.cover,
    ),
    const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Color(0xFF000B49),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.3,
              0.5,
            ],
          ),
        ),
      ),
    ),
  ];
}
