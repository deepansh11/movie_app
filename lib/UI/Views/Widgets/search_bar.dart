import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBar extends ConsumerStatefulWidget with PreferredSizeWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _SearchBarState extends ConsumerState<SearchBar> {
  TextEditingController? _controller;

  Icon customIcon = const Icon(
    Icons.search,
  );
  Widget customSearchBarText = const Text('Brew Apps');

  void searchOperation(String searchText) {}

  void searchState() {
    setState(() {
      if (customIcon.icon == Icons.search) {
        customIcon = const Icon(Icons.cancel);
        customSearchBarText = ListTile(
          leading: const Icon(
            Icons.search,
            color: Colors.white,
            size: 28,
          ),
          title: TextField(
            controller: _controller,
            onChanged: searchOperation,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'Search a movie',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
            style: const TextStyle(
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
