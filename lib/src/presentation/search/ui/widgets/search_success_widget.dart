import 'package:flutter/material.dart';

import '../../../../data/models/preview/art_preview.dart';
import 'art_preview_widget.dart';

class SearchSuccessWidget extends StatelessWidget {
  final List<ArtPreview> artPreviews;

  const SearchSuccessWidget({
    required this.artPreviews,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        //
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          sliver: SliverList.separated(
            separatorBuilder: (_, __) {
              return const SizedBox(height: 10);
            },
            itemBuilder: (_, int index) {
              return ArtPreviewWidget(
                artPreview: artPreviews[index],
              );
            },
            itemCount: artPreviews.length,
          ),
        ),
      ],
    );
  }
}
