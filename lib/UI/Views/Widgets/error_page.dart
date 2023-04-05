import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movie_app/Models/movies_model.dart';
import 'package:movie_app/repo/movie.dart';

// ignore: must_be_immutable
class ErrorBody extends ConsumerWidget {
  const ErrorBody({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          ElevatedButton(
            onPressed: () async {
              ref.refresh(topRatedFutureProvider);
              ref.refresh(upcomingFutureProvider);
              ref.refresh(popularFutureProvider);
            },
            child: const Text("Try again"),
          ),
        ],
      ),
    );
  }
}
