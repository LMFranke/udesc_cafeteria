import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/provider/provider.dart';

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
                  decoration: const BoxDecoration(),
                  child: Center(
                    child: Image.network(
                      widget.item.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return CircularProgressIndicator(
                          color: Colors.grey[800],
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200]
                ),
                child: Row(
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
                              color: Colors.grey[700],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
