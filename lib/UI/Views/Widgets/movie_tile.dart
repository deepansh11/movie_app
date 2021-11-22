import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/Models/movies_model.dart';

import '../details_page.dart';

// ignore: must_be_immutable
class MovieTile extends StatelessWidget {
  List<MovieModel>? movies;

  int index;

  MovieTile({
    Key? key,
    required this.movies,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ListTile(
          enabled: true,
          title: Text(
            movies![index].title!,
          ),
          subtitle: Text(
            movies![index].overview!,
            softWrap: true,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  movies![index],
                ),
              ),
            );
          },
          leading: Image.network(
            movies![index].fullPosterPathUrl,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }
}
