import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/components/cart_item.dart';
import 'package:udesc_v2/model/item.dart';

import '../provider/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const Text(
              "Cart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserListItem.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      value.removeUserItem(value.getUserListItem.elementAt(index));
                    },
                    direction: DismissDirection.endToStart,
                    child: MyCartItem(
                      item: value.getUserListItem.elementAt(index),
                      index: index,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
