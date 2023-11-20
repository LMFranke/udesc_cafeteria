import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/components/cart_item.dart';
import 'package:udesc_v2/provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) => Padding(
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
              child: SizedBox(
                height: 150,
                child: FutureBuilder(
                  future: provider.getItemsFromPerson(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.data!.isNotEmpty) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return MyCartItem(
                            item: snapshot.data!.elementAt(index),
                            index: index,
                          );
                        },
                      );
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
                        snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text(
                          "You haven't any item on your cart yet",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                              color: Colors.grey[800]),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
