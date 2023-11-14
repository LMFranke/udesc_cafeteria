import 'package:flutter/material.dart';
import 'package:udesc_v2/components/shop_item.dart';
import 'package:udesc_v2/components/shop_item_preview.dart';

import '../model/item.dart';

class AlertDialogPreviewItem extends StatefulWidget {
  final Item item;

  const AlertDialogPreviewItem({super.key, required this.item});

  @override
  State<AlertDialogPreviewItem> createState() => _AlertDialogPreviewItemState();
}

class _AlertDialogPreviewItemState extends State<AlertDialogPreviewItem> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.grey[300],
      elevation: 10,
      title: Text(
        "Item Preview",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey[800]),
      ),
      content: Container(
        height: 325,
        child: MyShopItemPreview(item: widget.item),
      ),
      actions: [
        GestureDetector(
          child: Container(
            width: 75,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[600]),
            child: const Text(
              "Ok",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
