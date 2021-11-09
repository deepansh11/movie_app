import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movie_app/Models/movies_model.dart';
import 'package:movie_app/UI/Views/Widgets/error_page.dart';
import 'package:movie_app/UI/Views/Widgets/movie_tile.dart';
import '../../Models/movies.dart';
import 'details_page.dart';

class NowPlayingView extends ConsumerStatefulWidget {
  const NowPlayingView({Key? key}) : super(key: key);

  @override
  _NowPlayingViewState createState() => _NowPlayingViewState();
}

class _NowPlayingViewState extends ConsumerState<NowPlayingView> {
  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
    ref.read(moviesFutureProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ref.watch(moviesFutureProvider).when(
          data: (movies) {
            return RefreshIndicator(
              backgroundColor: Colors.white,
              color: Colors.black,
              onRefresh: () async {
                return ref.refresh(moviesFutureProvider);
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
                futureProvider: moviesFutureProvider,
                message: 'Error please try again!');
          },
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
