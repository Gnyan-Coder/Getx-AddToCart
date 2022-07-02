import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventorcode_getx/controllers/product_controller.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final instance=Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("GetX"),
        centerTitle: true,
        actions: [
          ElevatedButton(
              onPressed: (){},
              child: Icon(Icons.shopping_cart),
          ),
          Center(child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
              child: GetX<ProductController>(builder: ((controller) {
                return Text(instance.count.toString(),style:TextStyle(fontSize: 20),);
              }),)
          )
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<ProductController>(builder: (controller){
              return ListView.builder(
                itemCount: instance.productData.length,
                itemBuilder:(context, index) {
                  return Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).primaryColor,width: 1
                          ),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      elevation: 5,
                      child: Column(
                        children: [
                          Container(
                            height: 180,
                            width: double.infinity,
                            child: Image.asset(instance.productData[index].productImage,fit: BoxFit.cover,),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(instance.productData[index].productName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                IconButton(onPressed: (){
                                  instance.addToFavorites(instance.productData[index].id);
                                },
                                    icon: Icon(instance.productData[index].favorite?Icons.favorite:Icons.favorite_border,color: Colors.red,))
                              ],
                            ),
                          ),
                        Container(
                        padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("price ${instance.productData[index].price}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        ElevatedButton(onPressed: (){
                          instance.addToCart(instance.productData[index]);
                        },
                            child: Text("Add to Cart")
                        )
                      ],
                    ),
                  ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            ),
          ),
          SizedBox(height: 20,),
          Container(
              child:GetX<ProductController>(builder: ((controller) {
                return Text("Total Amount :${instance.totalPrice}",style:TextStyle(fontSize: 20,color: Colors.white),);
              }),)
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
