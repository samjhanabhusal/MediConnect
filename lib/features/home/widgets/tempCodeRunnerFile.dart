// import 'package:luveen/common/widgets/loader.dart';
// import 'package:luveen/features/home/services/home_services.dart';
// import 'package:luveen/features/home/widgets/ProductDetails.dart';
// import 'package:luveen/features/product_details/screens/product_details_screen.dart';
// import 'package:luveen/models/product.dart';
// import 'package:flutter/material.dart';




// import '../../../common/widgets/loader.dart';



// class Products extends StatefulWidget {
//   const Products({Key? key}) : super(key: key);

//   @override
//   State<Products> createState() => _ProductsState();
// }

// class _ProductsState extends State<Products> {
//    List<Product>? products;
//   final HomeServices homeServices = HomeServices();

//   @override
//   void initState() {
//     super.initState();
//     fetchAllProducts();
//   }

//   fetchAllProducts() async {
//     products = await homeServices.fetchAllProducts(context);
//     setState(() {});
//   }
//    @override
//   Widget build(BuildContext context) {
//    return products == null
//         ? const Loader()
//         : Scaffold(
//             body: GridView.builder(
//               itemCount: products!.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2),
//               itemBuilder: (BuildContext context, int index) {
//                 final productData = products![index];
//           return SingleP(
//             prod_name: productData.name,
//             prod_picture: productData.images,
//             prod_price: productData.price,
//           );
//         }));
//   }
// }

// class SingleP extends StatelessWidget {
//   final prod_name;
//   final prod_picture;
  
//   final prod_price;

//   SingleP({
//     this.prod_name,
//     this.prod_picture,
    
//     this.prod_price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Hero(
//           tag: prod_name,
//           child: Material(
//             child: InkWell(
//               onTap: () => Navigator.of(context).push(
//               new MaterialPageRoute(
//                 //here we are passing the values of the products to the product details page
//                 builder: (context) => new ProductDetails(
//                   product_detail_name: prod_name,
//                   product_detail_new_price: prod_price,
                 
//                   product_detail_pictures: prod_picture,
//                 ),
//               ),
//             ),
//               child: GridTile(
//                   footer: Container(
//                     color: Colors.white70,
//                     child: ListTile(
//                         leading: Text(
//                           prod_name,
//                           style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Colors.black54,),
//                         ),
//                         title: Text(
//                           "\Rs.$prod_price",
//                           style: TextStyle(
//                               color: Colors.green,fontSize: 13, fontWeight: FontWeight.w500),
//                         ),
                       
//                     ),
//                   ),
//                   child: Image.asset(
//                     prod_picture,
//                     fit: BoxFit.cover,
//                   )),
//             ),
//           )),
//     );
//   }
// }