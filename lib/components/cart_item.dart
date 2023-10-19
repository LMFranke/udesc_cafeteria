import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/components/alert_dialog_confirm_item.dart';
import 'package:udesc_v2/provider/cart_provider.dart';

import '../model/item.dart';

class MyCartItem extends StatefulWidget {
  final Item item;
  final int index;

  const MyCartItem({super.key, required this.item, required this.index});

  @override
  State<MyCartItem> createState() => _MyCartItemState();
}

class _MyCartItemState extends State<MyCartItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) => Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Text(widget.item.name.characters.first),
          ),
          title: Text(widget.item.name),
          subtitle: Text(widget.item.price.toString()),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialogConfirmItem(value: value,);
                },
              );
            },
            icon: Icon(
              Icons.check,
              color: Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
