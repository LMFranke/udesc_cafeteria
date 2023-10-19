import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/components/snack_bar.dart';
import 'package:udesc_v2/database/database.dart';
import 'package:udesc_v2/provider/cart_provider.dart';
import 'package:udesc_v2/storage/shared_preference.dart';

import '../model/item.dart';

class MyShopItem extends StatefulWidget {
  final Item item;

  const MyShopItem({
    super.key,
    required this.item,
  });

  @override
  State<MyShopItem> createState() => _MyShopItemState();
}

class _MyShopItemState extends State<MyShopItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyDatabase>(
      builder: (context, value, child) => Padding(
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
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey[800],
                      backgroundColor: Colors.grey[100],
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
                          widget.item.price.toString(),
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
                    child: IconButton(
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: EdgeInsets.all(8),
                                  child: const Text(
                                    "Item add",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        );
                        SaveSharedPreference().getUser().then(
                          (valueUser) {
                            value.addItemToPerson(
                              CartsTableCompanion.insert(
                                  userId: valueUser!.id,
                                  itemId: widget.item.id),
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
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
