import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../movies_controller.dart';

class MoviesHeader extends GetView<MoviesController> {
  const MoviesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //acc a tela inteira
      width: Get.width,
      height: 200,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                  'assets/images/header_2.jpg',
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4),
                  BlendMode.darken,
                ),
              ),
            ),
            width: Get.width,
          ),
          Container(
            width: Get.width * .9,
            padding: const EdgeInsets.only(bottom: 20),
            child: TextField(
              onChanged: (value) => controller.filterByName(value),
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(80),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: 'Procurar filmes',
                labelStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.purple[300],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
