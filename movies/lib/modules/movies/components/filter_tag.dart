import 'package:flutter/material.dart';
import '../../../models/genre_model.dart';

class FilterTag extends StatelessWidget {
  final GenreModel model;
  final bool selected;
  final VoidCallback onPressed;
  const FilterTag(
      {Key? key,
      required this.model,
      this.selected = false,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      constraints: const BoxConstraints(minWidth: 100, maxHeight: 30),
      decoration: BoxDecoration(
        color: Colors.purple[300],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          model.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
