import 'package:get/get.dart';
import 'package:inventorcode_getx/models/product.dart';

class ProductController extends GetxController{
  List<Product> productData=[];

  List<Product> cartItems=List<Product>.empty().obs;

  addToCart(Product item){
    cartItems.add(item);
  }
  double get totalPrice=>cartItems.fold(0, (sum, item) => sum+item.price);
  int get count=>cartItems.length;
  @override
  void onInit(){
    super.onInit();
    fetchProductData();
  }

  fetchProductData() async{
    // await Future.delayed(Duration(seconds: 5));
    List<Product> serverResponse=[
      Product(
          id: 1,
          productName: "T-Shirt",
          productImage: "assets/images/shirt.png",
          productDescription: "This most iconic  T-Shirt",
          price: 499,
          favorite: false
      ),
      Product(
          id: 2,
          productName: "L-Shirt",
          productImage: "assets/images/shirtone.png",
          productDescription: "This most iconic  L-Shirt",
          price: 599,
          favorite: false
      ),
      Product(
          id: 3,
          productName: "M-Shirt",
          productImage: "assets/images/shirttwo.jpg",
          productDescription: "This most iconic  M-Shirt",
          price: 299,
          favorite: false
      ),
      Product(
          id: 4,
          productName: "P-Shirt",
          productImage: "assets/images/shirtthree.jpg",
          productDescription: "This most iconic  P-Shirt",
          price: 399,
          favorite: false
      )
    ];
    productData.assignAll(serverResponse);
    update();
  }
  addToFavorites(id){
    var index=productData.indexWhere((element) => element.id==id);
    productData[index].favorite=!productData[index].favorite;
    update();
  }
}