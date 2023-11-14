import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/model/request_item.dart';
import 'package:udesc_v2/provider/provider.dart';

class MyRequestItem extends StatefulWidget {
  final RequestItem item;

  const MyRequestItem({super.key, required this.item});

  @override
  State<MyRequestItem> createState() => _MyRequestItemState();
}

class _MyRequestItemState extends State<MyRequestItem> {
  @override
  Widget build(BuildContext context) {
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                widget.item.item.imageUrl,
                errorBuilder: (context, error, stackTrace) =>
                    CircularProgressIndicator(
                  color: Colors.grey[600],
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              provider.removeItemSent(widget.item.id);
            },
            icon: Icon(
              Icons.close,
              color: Colors.grey[800],
            ),
          ),
          title: Text(widget.item.item.name),
          subtitle: Text(widget.item.person.name),
        ),
      ),
    );
  }
}
