import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/components/shop_item.dart';
import 'package:udesc_v2/database/database.dart';
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
                border: Border.all(color: Colors.grey, width: 0),
              ),
              constraints:
                  const BoxConstraints.tightFor(width: double.infinity),
              alignment: Alignment.center,
              child: Text(
                "Random text to fill",
                style: TextStyle(fontSize: 18, color: Colors.grey[900]),
              ),
            ),
          ),
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
                    await SaveSharedPreference().getUser().then(
                      (value) {
                        print("CURRENT USER: "
                            "\n id: ${value?.id}"
                            "\n name: ${value?.name}"
                            "\n email: ${value?.email}"
                            "\n password: ${value?.password}");
                      },
                    );
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
            child: SizedBox(
              height: 150,
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
                        child:
                            CircularProgressIndicator(color: Colors.grey[800]),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Divider(color: Colors.grey[100]),
          ),
        ],
      ),
    );
  }
}
