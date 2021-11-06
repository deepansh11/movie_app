import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget with PreferredSizeWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _SearchBarState extends State<SearchBar> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBarText = const Text('Brew Apps');

  void searchState() {
    setState(() {
      if (customIcon.icon == Icons.search) {
        customIcon = const Icon(Icons.cancel);
        customSearchBarText = const ListTile(
          leading: Icon(
            Icons.search,
            color: Colors.white,
            size: 28,
          ),
          title: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Search a movie',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.grey,
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
