// // import 'package:flutter/src/foundation/key.dart';
// // import 'package:flutter/src/widgets/framework.dart';
//  import 'package:flutter/material.dart';

// import '../../product_details/screens/product_details_screen.dart';
// import 'ProductDetails.dart';
// import 'package:amazon_clone_tutorial/models/product.dart';

// class SingleP extends StatefulWidget {
//    final String prod_name;
//   final String prod_picture;
  
//   final double prod_price;

//   const SingleP({Key? key,
//    required this.prod_name,
//     required this.prod_picture,
    
//     required this.prod_price,
//   }) : super(key: key);

//   @override
//   State<SingleP> createState() => _SinglePState();
// }

// class _SinglePState extends State<SingleP> {
//   @override
//   Widget build(BuildContext context) {
//      return Card(
//       child: Hero(
//           tag: widget.prod_name,
//           child: Material(
//             child: InkWell(
//               onTap: () => Navigator.of(context).push(
//               new MaterialPageRoute(
//                 //here we are passing the values of the products to the product details page
//                 builder: (context) => new ProductDetails(
//                   product_detail_name: widget.prod_name,
//                   product_detail_new_price: widget.prod_price,
                 
//                   product_detail_pictures: widget.prod_picture,
//                 ),
//               ),
//             ),
//               child: GridTile(
//                   footer: Container(
//                     color: Colors.white70,
//                     child: ListTile(
//                         leading: Text(
//                           widget.prod_name,
//                           style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Colors.black54,),
//                         ),
//                         title: Text(
//                           "\Rs.${widget.prod_price}",
//                           style: TextStyle(
//                               color: Colors.green,fontSize: 13, fontWeight: FontWeight.w500),
//                         ),
                       
//                     ),
//                   ),
//                   child: Image.network(
//                     widget.prod_picture,
//                     fit: BoxFit.cover,
//                   )),
//             ),
//           )),
//     );
 
//   }
// }



// // import 'package:flutter/src/foundation/key.dart';
// // import 'package:flutter/src/widgets/framework.dart';

// // class SingleP extends StatelessWidget {
// //      final String prod_name;
// //   final String prod_picture;
  
// //   final double prod_price;

// //   const SingleP({Key? key,
// //    required this.prod_name,
// //     required this.prod_picture,
    
// //     required this.prod_price,
// //   }) : super(key: key);

// //   // const SingleP({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //      return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 5),
// //       child: DecoratedBox(
// //         decoration: BoxDecoration(
// //           border: Border.all(
// //             color: Colors.black12,
// //             width: 1.5,
// //           ),
// //           borderRadius: BorderRadius.circular(5),
// //           color: Colors.white,
// //         ),
// //         child: Container(
// //           width: 180,
// //           padding: const EdgeInsets.all(10),
// //           child: Image.network(
// //             prod_picture,
// //             fit: BoxFit.fitHeight,
// //             width: 180,
// //           ),
// //         ),
// //       ),
// //     );
    
// //   }
// // }