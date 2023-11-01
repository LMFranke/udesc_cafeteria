import 'package:flutter/material.dart';
import 'package:udesc_v2/model/request_item.dart';

class MyRequestItem extends StatefulWidget {
  final RequestItem item;

  const MyRequestItem({super.key, required this.item});

  @override
  State<MyRequestItem> createState() => _MyRequestItemState();
}

class _MyRequestItemState extends State<MyRequestItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        subtitle: Text(widget.item.person.name),
      ),
    );
  }
}
