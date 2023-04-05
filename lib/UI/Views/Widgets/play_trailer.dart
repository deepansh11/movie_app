import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PlayButton extends StatelessWidget {
  const PlayButton(
      {super.key,
      required this.func,
      this.backgroundColor = Colors.red,
      required this.title});

  final VoidCallback func;

  final Color backgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: func,
          label: Text(title),
          icon: const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
