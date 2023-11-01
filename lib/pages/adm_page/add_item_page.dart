import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/components/alert_dialog_preview_item.dart';
import 'package:udesc_v2/database/database.dart';
import 'package:udesc_v2/model/item.dart';
import 'package:udesc_v2/provider/provider.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
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
      builder: (context, provider, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text("Add Item"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Item name"),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: const Icon(
                      Icons.add_card,
                    ),
                  ),
                  controller: nameController,
                  validator: (value) {
                    if (nameController.text.isEmpty ||
                        nameController.text == null) {
                      return "Item name field is empty";
                    }
                    return null;
                  },
                  focusNode: focusNodeName,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Item price"),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: const Icon(
                      Icons.price_change_outlined,
                    ),
                  ),
                  controller: priceController,
                  validator: (value) {
                    if (priceController.text.isEmpty ||
                        priceController.text == null) {
                      return "Item price field is empty";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  focusNode: focusNodePrice,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Item url image"),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: const Icon(
                      Icons.image_outlined,
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
                    if (urlImageController.text.isEmpty ||
                        urlImageController.text == null) {
                      return "Item url image field is empty";
                    }
                    return null;
                  },
                  focusNode: focusNodeUrlImage,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 105,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[600]),
                        child: const Text(
                          "Preview",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialogPreviewItem(
                              item: Item(
                                id: 0,
                                imageUrl: urlImageController.text,
                                name: nameController.text,
                                price: double.parse(priceController.text),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 200,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[600]),
                        child: const Text(
                          "Add Item",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          provider.addItem(
                            ItemShoppingTableCompanion.insert(
                              name: nameController.text,
                              price: double.parse(priceController.text),
                              urlImage: urlImageController.text,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
