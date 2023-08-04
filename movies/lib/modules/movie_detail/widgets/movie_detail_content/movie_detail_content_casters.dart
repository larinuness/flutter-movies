import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/theme_extension.dart';
import '../../../../models/movie_detail_model.dart';
import 'movie_cast.dart';

class MovieDetailContentCasters extends StatelessWidget {
  final MovieDetailModel? movie;
  final showPanel = true.obs;

  MovieDetailContentCasters({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.themeGrey,
        ),
        Obx(() {
          return ExpansionPanelList(
            elevation: 0,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: ((panelIndex, isExpanded) {
              //muda pra true or false(do proprio getx isso)
              showPanel.toggle();
            }),
            children: [
              ExpansionPanel(
                canTapOnHeader: false,
                isExpanded: showPanel.value,
                backgroundColor: Colors.white,
                headerBuilder: (context, isExpanded) {
                  return const Padding(
                    padding: EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Elenco',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
                body: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: movie?.cast
                              .map(
                                (e) => MovieCast(
                                  cast: e,
                                ),
                              )
                              .toList() ??
                          []),
                ),
              )
            ],
          );
        })
      ],
    );
  }
}
