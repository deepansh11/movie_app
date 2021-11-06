import 'package:flutter/material.dart';
import 'package:movie_app/Models/movies_model.dart';
import 'package:provider/provider.dart';

class TopRatedView extends StatefulWidget {
  const TopRatedView({Key? key}) : super(key: key);

  @override
  State<TopRatedView> createState() => _TopRatedViewState();
}

class _TopRatedViewState extends State<TopRatedView> {
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Top Rated'),
    );
  }
}
