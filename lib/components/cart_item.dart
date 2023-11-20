import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/components/alert_dialog_confirm_item.dart';
import 'package:udesc_v2/database/database.dart';
import 'package:udesc_v2/model/request_item.dart';
import 'package:udesc_v2/model/user_request_item.dart';
import 'package:udesc_v2/provider/provider.dart';

import '../model/item.dart';

class MyCartItem extends StatefulWidget {
  final UserRequestItem item;
  final int index;

  bool isSend = false;

  MyCartItem({super.key, required this.item, required this.index});

  @override
  State<MyCartItem> createState() => _MyCartItemState();
}

class _MyCartItemState extends State<MyCartItem> {
  @override
  Widget build(BuildContext context) {
    String subtitle = widget.isSend ? "Enviado!" : "R\$${widget.item.item.price.toString()}";
    Color? iconColor = widget.isSend ? Colors.green : Colors.grey[600];

    return Consumer<MyProvider>(
      builder: (context, provider, child) => Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Text(widget.item.item.name.characters.first),
          ),
          title: Text(widget.item.item.name),
          subtitle: Text(subtitle),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                widget.isSend = true;
                provider.updateItemSent(widget.item.id);
              });
            },
            icon: Icon(
              Icons.check,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
