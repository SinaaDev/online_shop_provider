import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_shop_provider/provider/product_provider.dart';

import '../config/custom_snackbar.dart';
import '../model/product_model.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {

  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final nameController = TextEditingController();

  final priceController = TextEditingController();

  final descController = TextEditingController();

  ProductModel newProduct() => ProductModel(
    image: pickedImage?.path ?? '',
    name: nameController.text.isNotEmpty?nameController.text:'unknown',
    price: priceController.text.isNotEmpty?priceController.text:'unknown',
    description: descController.text.isNotEmpty?descController.text:'no description',
  );

  XFile? pickedImage;

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image!= null) {
      setState(() {
        pickedImage = image;
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product',style: TextStyle(fontWeight: FontWeight.bold),)),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(children: [
          Row(
            children: [
              // Photo Container
              GestureDetector(
                onTap: () async{
                  await pickImageFromGallery();
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 24),
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.black54,width: 2)
                  ),
                  child:pickedImage == null?
                  const Center(child: Icon(Icons.camera,size: 32,),)
                      : ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(File(pickedImage!.path),fit: BoxFit.cover,)),
                ),
              ),

              // name and price
              Expanded(
                child: Column(
                  children: [
                  // name
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                    ),
                    onTapOutside: (_){FocusManager.instance.primaryFocus?.unfocus();},
                  ),
                  const Gap(24),
                  // price
                  TextField(
                    controller: priceController,
                    decoration: const InputDecoration(
                      hintText: 'Price',
                    ),
                    keyboardType: TextInputType.number,
                    onTapOutside: (_){FocusManager.instance.primaryFocus?.unfocus();},
                  )

                ],),
              )
            ],
          ),

          // description
          const Gap(24),
          TextField(
            controller: descController,
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
            maxLines: 5,
            onTapOutside: (_){FocusManager.instance.primaryFocus?.unfocus();},
          ),

          // add button
          const Spacer(),
          SizedBox(
            width: double.infinity,
              child: Consumer<Product>(
                builder: (context, product, child) => CupertinoButton(color: Colors.black54,child: const Text('Add',), onPressed: (){
                  product.addProduct(newProduct());
                  CustomSnackBar(context: context, message: 'Product Added',backgroundColor: Colors.green).show();
                  Navigator.pop(context);
                }),
              )),
        ],),
      ),),
    );
  }
}
