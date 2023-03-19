import 'package:flutter/material.dart';
import '../../../app/ui/filmes_app_ui_config.dart';
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
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        constraints: const BoxConstraints(minWidth: 100, maxHeight: 30),
        decoration: BoxDecoration(
          color: selected ? Colors.purple[300] : Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            model.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selected ? Colors.white : FilmesAppUiConfig.blackPrimary,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
