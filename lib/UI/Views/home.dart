import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movie_app/UI/Views/movie.dart';
import 'package:movie_app/repo/movie.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Movies(
      movieProvider: popularFutureProvider,
      title: 'Popular Movies',
    ),
    Movies(movieProvider: topRatedFutureProvider, title: 'Top Rated'),
    Movies(
      movieProvider: upcomingFutureProvider,
      title: 'Upcoming Movies',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: _CustomClipper(),
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFF000B49),
            child: Center(
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
        child: _pages.elementAt(_currentIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: Colors.white,
          strokeColor: Colors.white,
          unSelectedColor: Colors.grey[600],
          backgroundColor: const Color(0xFF000B49),
          borderRadius: const Radius.circular(20.0),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          isFloating: true,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(
                Icons.star,
              ),
            ),
            CustomNavigationBarItem(
              icon: const Icon(
                Icons.favorite,
              ),
            ),
            CustomNavigationBarItem(
              icon: const Icon(
                Icons.list,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;

    double width = size.width;

    var path = Path();

    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
