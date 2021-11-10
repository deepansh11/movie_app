import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movie_app/Models/movies.dart';
import 'package:movie_app/Models/movies_model.dart';
import 'package:movie_app/Services/db_movies.dart';
import 'package:movie_app/UI/Views/now_playing_view.dart';
import 'package:movie_app/UI/Views/top_rated_view.dart';

import 'Widgets/search_bar.dart';

class HomeView extends ConsumerStatefulWidget {
  HomeView({
    Key? key,
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  String query = '';
  List<MovieModel>? movies;
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = <Widget>[
      const NowPlayingView(),
      const TopRatedView()
    ];
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation), label: 'Now Playing'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Top rated'),
          ],
        ),
        appBar: SearchBar());
  }
}
