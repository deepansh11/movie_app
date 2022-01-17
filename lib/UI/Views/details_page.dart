import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movie_app/Services/movies.dart';
import 'package:movie_app/Models/movies_model.dart';
import 'package:movie_app/UI/Views/Widgets/error_page.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailsPage extends ConsumerWidget {
  final MovieModel movie;
  const DetailsPage(this.movie, {Key? key}) : super(key: key);

  static const routeName = '/details-page';
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details page'),
      ),
      body: ref.watch(topRatedFutureProvider).when(
          data: (movie) {
            return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(this.movie.fullBackDropPathUrl),
                  ),
                ),
                child: SlidingUpPanel(
                    minHeight: 50,
                    margin: const EdgeInsets.all(50),
                    snapPoint: 0.4,
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.black.withOpacity(0.5)
                        : Colors.white.withOpacity(0.5),
                    panel: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(this.movie.title!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            this.movie.releaseDate!,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.6)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                const WidgetSpan(
                                    child: Icon(
                                  Icons.favorite,
                                  size: 18,
                                )),
                                TextSpan(
                                    text: ' ' +
                                        this
                                            .movie
                                            .popularity!
                                            .toStringAsFixed(0))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            this.movie.overview!,
                          ),
                        ],
                      ),
                    )));
          },
          error: (e, s) {
            return ErrorBody(
                futureProvider: topRatedFutureProvider,
                message: 'Error please try again');
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
