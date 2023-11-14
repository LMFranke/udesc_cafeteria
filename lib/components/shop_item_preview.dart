import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/components/snack_bar.dart';
import 'package:udesc_v2/database/database.dart';
import 'package:udesc_v2/provider/provider.dart';
import 'package:udesc_v2/storage/shared_preference.dart';

import '../model/item.dart';

class MyShopItemPreview extends StatefulWidget {
  final Item item;

  const MyShopItemPreview({
    super.key,
    required this.item,
  });

  @override
  State<MyShopItemPreview> createState() => _MyShopItemPreviewState();
}

class _MyShopItemPreviewState extends State<MyShopItemPreview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          width: 250,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  decoration: BoxDecoration(),
                  child: Center(
                    child: Image.network(
                      widget.item.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        print(widget.item.imageUrl);
                        print(error);
                        print(stackTrace);
                        return CircularProgressIndicator(
                          color: Colors.grey[800],
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.name,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[900],
                          ),
                        ),
                        Text(
                          "R\$${widget.item.price.toString()}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
