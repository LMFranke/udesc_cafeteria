import 'package:flutter/material.dart';
import 'package:udesc_v2/provider/provider.dart';

class AlertDialogConfirmItem extends StatefulWidget {

  final MyProvider value;
  const AlertDialogConfirmItem({super.key, required this.value});

  @override
  State<AlertDialogConfirmItem> createState() => _AlertDialogConfirmItemState();
}

class _AlertDialogConfirmItemState extends State<AlertDialogConfirmItem> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      title: const Text(
        "Confirm item",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text(
        "Send to shop the order",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[500],
                foregroundColor: Colors.white,
              ),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[500],
                foregroundColor: Colors.white,
              ),
              child: const Text("Yes"),
            ),
          ],
        )
      ],
    );
  }
}
