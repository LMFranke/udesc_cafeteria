import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/database/database.dart';
import 'package:udesc_v2/model/item.dart';
import 'package:udesc_v2/provider/provider.dart';

class AlertDialogEditItem extends StatefulWidget {
  final Item item;

  const AlertDialogEditItem({super.key, required this.item});

  @override
  State<AlertDialogEditItem> createState() => _AlertDialogEditItemState();
}

class _AlertDialogEditItemState extends State<AlertDialogEditItem> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController urlImageController = TextEditingController();

  final FocusNode focusNodeName = FocusNode();
  final FocusNode focusNodePrice = FocusNode();
  final FocusNode focusNodeUrlImage = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) => Form(
        key: _formKey,
        child: AlertDialog(
          backgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            "Edit Item",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[800]),
          ),
          content: SingleChildScrollView(

            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Item name"),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  controller: nameController,
                  validator: (value) {
                    if (nameController.text.isEmpty) {
                      return "Item name field is empty";
                    }
                    return null;
                  },
                  focusNode: focusNodeName,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Item price"),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  controller: priceController,
                  validator: (value) {
                    if (priceController.text.isEmpty) {
                      return "Item price field is empty";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  focusNode: focusNodePrice,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Item url image"),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey[100]),
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Put the URL of an image in this field",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey[800], fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        );
                      },
                      icon: const Icon(Icons.info_outline),
                    ),
                  ),
                  controller: urlImageController,
                  validator: (value) {
                    if (urlImageController.text.isEmpty) {
                      return "Item url image field is empty";
                    }
                    return null;
                  },
                  focusNode: focusNodeUrlImage,
                ),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              child: Container(
                width: 75,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.red),
                child: const Text(
                  "Delete",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                provider.removeItem(widget.item.id);
                Navigator.of(context).pop();
              },
            ),
            GestureDetector(
              child: Container(
                width: 75,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.green),
                child: const Text(
                  "Save",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  provider.updateItem(ItemShoppingTableData(
                    id: widget.item.id,
                    name: widget.item.name,
                    price: widget.item.price,
                    urlImage: widget.item.imageUrl,
                  ));
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
