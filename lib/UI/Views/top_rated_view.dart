import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/Models/movies.dart';
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
                    background: Container(color: Colors.red),
                    direction: DismissDirection.horizontal,
                    key: UniqueKey(),
                    onDismissed: (direction) => setState(() {
                      movies.removeAt(index);
                    }),
                    child: MovieTile(
                      movies: movies,
                      index: index,
                      // function: movies.removeAt(index),
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
