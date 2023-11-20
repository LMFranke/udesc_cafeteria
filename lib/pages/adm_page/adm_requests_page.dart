import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/components/request_item.dart';
import 'package:udesc_v2/database/database.dart';
import 'package:udesc_v2/provider/provider.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const Text(
              "Requests",
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
                  future: provider.getAllSendItems(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (
                            context,
                            index,
                            ) {
                          return MyRequestItem(
                            item: snapshot.data!.elementAt(index),
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
