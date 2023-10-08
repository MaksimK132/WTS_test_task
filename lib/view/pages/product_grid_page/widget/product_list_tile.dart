import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ProductListTile extends StatelessWidget {
  final String title;
  final int price;
  final String imageUrl;

  ProductListTile({
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        subtitle: Text('Price: ${price}'),
        trailing: SizedBox(
          width: 100,
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
        ));
  }
}
