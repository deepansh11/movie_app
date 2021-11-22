import 'package:flutter/material.dart';
import 'package:movie_app/UI/Views/top_rated_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const TopRatedView(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Movie App'),
        ));
  }
}
