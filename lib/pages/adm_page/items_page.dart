import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/database/database.dart';

import '../../components/shop_item.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyDatabase>(
      builder: (context, value, child) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
                border: Border.all(color: Colors.grey, width: 0),
              ),
              constraints:
                  const BoxConstraints.tightFor(width: double.infinity),
              alignment: Alignment.center,
              child: Text(
                "Shop Item Preview",
                style: TextStyle(fontSize: 18, color: Colors.grey[900]),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 395,
            child: FutureBuilder(
              future: value.getShopItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data!.isNotEmpty) {
                  print("SNAPSHOT VALUE: ${snapshot.data}");
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      print(
                          "SNAPSHOT LISTBUILDER: ${snapshot.data!.elementAt(index)}");
                      return MyShopItem(
                        item: snapshot.data!.elementAt(index),
                      );
                    },
                  );
                } else {
                  return Container(
                    width: 150,
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(color: Colors.grey[800]),
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25.0, left: 25.0, top: 16.0),
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey, width: 0),
                ),
                constraints:
                const BoxConstraints.tightFor(width: double.infinity),
                alignment: Alignment.center,
                child: Text(
                  "Add new Item",
                  style: TextStyle(fontSize: 18, color: Colors.grey[900], decoration: TextDecoration.underline),
                ),
              ),
              onTap: () {

              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Divider(color: Colors.grey[100]),
          ),
        ],
      ),
    );
  }
}
