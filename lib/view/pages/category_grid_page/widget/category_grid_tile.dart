import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CategoryGridTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;
  final String imageUrl;

  CategoryGridTile(
      {required this.title,
      required this.subtitle,
      required this.onTap,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: GridTile(
        footer: GridTileBar(
          title: Text(title),
          subtitle: Text(subtitle),
          backgroundColor: Colors.black54,
        ),
        child: ExtendedImage.network(
          imageUrl,
          fit: BoxFit.contain,
          mode: ExtendedImageMode.editor,
          initEditorConfigHandler: (state) {
            return EditorConfig(
              maxScale: 8.0,
              cropRectPadding: EdgeInsets.all(20.0),
              hitTestSize: 20.0,
            );
          },
        ),
      ),
    );
  }
}
