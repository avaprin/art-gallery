import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../di/app_di.dart';
import '../../data/models/preview/art_preview.dart';
import '../search/ui/widgets/art_preview_widget.dart';

@RoutePage()
class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ArtPreviewWidget(
              artPreview: ArtPreview(
                id: 28067,
                title: "The Old Guitarist",
                imageId: "4e7f3081-179a-af18-8abd-7908a7ae8c4e",
                date: "late 1903–early 1904",
                artist: "Pablo Picasso\nSpanish, active France, 1881–1973",
                origin: "Spain",
              ),
              onArtPreviewTap: (ArtPreview p0) {},
            ),
            ArtPreviewWidget(
              artPreview: ArtPreview(
                id: 111060,
                title: "Daniel-Henry Kahnweiler",
                imageId: "aebda29e-16b8-4393-6edc-805cdb6ba459",
                date: "autumn 1910",
                artist: "Pablo Picasso\nSpanish, active France, 1881–1973",
                origin: "Spain",
              ),
              onArtPreviewTap: (_) {},
            ),
          ],
        ),
      ),
    );
  }
}
