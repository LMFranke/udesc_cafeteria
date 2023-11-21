import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/components/shop_item.dart';
import 'package:udesc_v2/provider/provider.dart';
import 'package:udesc_v2/storage/shared_preference.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) => Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Shop",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
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
                            "\n password: ${value?.password}",
                        );
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
                future: provider.getShopItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (
                        context,
                        index,
                      ) {
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
                            CircularProgressIndicator(color: Colors.grey[800],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Divider(color: Colors.grey[100],
            ),
          ),
        ],
      ),
    );
  }
}
