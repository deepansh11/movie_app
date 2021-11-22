import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/Services/movies.dart';
import 'package:movie_app/UI/Views/Widgets/error_page.dart';
import 'package:movie_app/UI/Views/Widgets/movie_tile.dart';

class TopRatedView extends ConsumerStatefulWidget {
  const TopRatedView({Key? key}) : super(key: key);

  @override
  _TopRatedViewState createState() => _TopRatedViewState();
}

class _TopRatedViewState extends ConsumerState<TopRatedView> {
  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext context) {
    return Container(
      child: ref.watch(topRatedFutureProvider).when(
          data: (movies) {
            return RefreshIndicator(
              backgroundColor: Colors.white,
              color: Colors.black,
              onRefresh: () async {
                return ref.refresh(topRatedFutureProvider);
              },
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: Container(
                      padding: const EdgeInsets.only(right: 10),
                      color: Colors.red,
                      child: const Icon(
                        Icons.delete,
                        size: 50,
                      ),
                      alignment: Alignment.centerRight,
                    ),
                    direction: DismissDirection.endToStart,
                    key: UniqueKey(),
                    onDismissed: (direction) => setState(() {
                      movies.removeAt(index);
                    }),
                    child: MovieTile(
                      movies: movies,
                      index: index,
                    ),
                  );
                },
                itemCount: movies.length,
              ),
            );
          },
          error: (e, s) {
            return ErrorBody(
                futureProvider: topRatedFutureProvider,
                message: 'Error please try again!');
          },
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
