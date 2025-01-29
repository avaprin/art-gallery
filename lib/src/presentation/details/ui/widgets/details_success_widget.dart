import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../di/app_di.dart';
import '../../../../core_ui/html_text.dart';
import '../../../../data/models/details/art_details.dart';
import '../../../../navigation/router.dart';

class DetailsSuccessWidget extends StatefulWidget {
  final ArtDetails artDetails;

  const DetailsSuccessWidget({
    required this.artDetails,
    super.key,
  });

  @override
  State<DetailsSuccessWidget> createState() => _DetailsSuccessWidgetState();
}

class _DetailsSuccessWidgetState extends State<DetailsSuccessWidget> {
  void _handleImageTap() {
    appRouter.push(
      ImageRoute(imageUrl: widget.artDetails.imageUrl),
    );
  }

  void _handleLinkTap(String url) {
    final Uri? uri = Uri.tryParse(url);
    if (uri == null) return;

    launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return ListView(
      children: <Widget>[
        //
        GestureDetector(
          onTap: _handleImageTap,
          child: SizedBox(
            height: 300,
            child: CachedNetworkImage(
              imageUrl: widget.artDetails.imageUrl,
              fit: BoxFit.contain,
              errorWidget: (_, __, ___) {
                return const Icon(
                  Icons.image_not_supported_outlined,
                  size: 80,
                );
              },
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //
              Text(
                widget.artDetails.title,
                style: textTheme.headlineMedium,
              ),

              if (widget.artDetails.date != null ||
                  widget.artDetails.origin != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    <String?>[
                      widget.artDetails.origin,
                      widget.artDetails.date,
                    ].whereType<String>().join(', '),
                    style: textTheme.titleMedium,
                  ),
                ),

              if (widget.artDetails.artist != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    widget.artDetails.artist!,
                    style: textTheme.titleMedium,
                  ),
                ),

              if (widget.artDetails.categories?.isNotEmpty == false ||
                  widget.artDetails.techniques?.isNotEmpty == false)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    <String?>[
                      ...?widget.artDetails.categories,
                      ...?widget.artDetails.techniques,
                    ].whereType<String>().join(', '),
                    style: textTheme.titleMedium,
                  ),
                ),

              if (widget.artDetails.medium != null ||
                  widget.artDetails.dimensions != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    <String?>[
                      widget.artDetails.medium,
                      widget.artDetails.dimensions,
                    ].whereType<String>().join(', '),
                    style: textTheme.titleMedium,
                  ),
                ),

              if (widget.artDetails.description != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: HtmlText(
                    widget.artDetails.description!,
                    onLinkTap: _handleLinkTap,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
