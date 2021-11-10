import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/Services/db_movies.dart';

class SearchBar extends ConsumerStatefulWidget with PreferredSizeWidget {
  SearchBar();

  @override
  _SearchBarState createState() => _SearchBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _SearchBarState extends ConsumerState<SearchBar> {
  final controller = TextEditingController();
  Icon customIcon = const Icon(
    Icons.search,
  );
  Widget customSearchBarText = const Text('Brew Apps');

  void searchState() {
    setState(() {
      if (customIcon.icon == Icons.search) {
        customIcon = const Icon(Icons.cancel);
        customSearchBarText = ListTile(
          title: TextField(
            controller: controller,
            onChanged: (text) async {
              DBmovies.db.findObjects(text);
            },
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'Search a movie',
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              border: InputBorder.none,
            ),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        );
      } else {
        customIcon = const Icon(Icons.search);
        customSearchBarText = const Text('Brew Apps');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: customSearchBarText,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: searchState,
          icon: customIcon,
        )
      ],
      centerTitle: true,
    );
  }
}
