import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/components/shop_item.dart';
import 'package:udesc_v2/database/database.dart';
import 'package:udesc_v2/provider/cart_provider.dart';
import 'package:udesc_v2/storage/shared_preference.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyDatabase>(
      builder: (context, value, child) => Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                constraints:
                    const BoxConstraints.tightFor(width: double.infinity),
                alignment: Alignment.center,
                child: const Text(
                  "Random text to fill",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              )),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Hot Picks",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await SaveSharedPreference().getUser().then((value) {
                      print("CURRENT USER: \n id: ${value?.id}\n name: ${value?.name}\n email: ${value?.email}\n password: ${value?.password}");
                    },);
                  },
                  child: const Text("See all"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: value.getItemShoppingCount(),
              itemBuilder: (context, index) {
                return MyShopItem(
                  item: value.getListItem.elementAt(index),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Divider(color: Colors.grey[100]),
          ),
          // ListView(
          //     scrollDirection: Axis.horizontal,
          //     shrinkWrap: true,
          //     children: [
          //       MyShopItem(item: CartProvider().getListItem.elementAt(0)),
          //       MyShopItem(item: CartProvider().getListItem.elementAt(1)),
          //       MyShopItem(item: CartProvider().getListItem.elementAt(2)),
          //     ]),
        ],
      ),
    );
  }
}
