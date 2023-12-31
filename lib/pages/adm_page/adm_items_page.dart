import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/components/alert_dialog_edit_item.dart';
import 'package:udesc_v2/components/shop_item_preview.dart';
import 'package:udesc_v2/database/database.dart';
import 'package:udesc_v2/provider/provider.dart';

import '../../components/shop_item.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) => Column(
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
                style: TextStyle(fontSize: 18, color: Colors.grey[900],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: FutureBuilder(
              future: provider.getShopItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      return GestureDetector(
                        child: MyShopItemPreview(
                          item: snapshot.data!.elementAt(index),
                        ),
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialogEditItem(
                              item: snapshot.data!.elementAt(index),
                            ),
                          );
                        },
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
                      child: CircularProgressIndicator(color: Colors.grey[800],
                      ),
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
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[900],
                      decoration: TextDecoration.underline),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/add_item_page");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Divider(color: Colors.grey[100],
            ),
          ),
        ],
      ),
    );
  }
}
