import 'package:flutter/material.dart';
import 'package:movie_app/UI/Views/top_rated_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key, required this.data}) : super(key: key);
  String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const TopRatedView(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(data),
        ));
  }
}
