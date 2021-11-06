import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movie_app/Models/movies_model.dart';

class NowPlayingView extends StatelessWidget {
  List? nowPlayingMovies;

  NowPlayingView({
    Key? key,
    this.nowPlayingMovies,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'http://image.tmdb.org/t/p/w342' +
                                              nowPlayingMovies![index]
                                                  ['poster_path']))),
                            ),
                            Container(
                              child: Text(
                                  nowPlayingMovies![index]['title'] != null
                                      ? nowPlayingMovies![index]['title']
                                      : 'Title loading...'),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: nowPlayingMovies!.length)),
        ],
      ),
    );
  }
}
