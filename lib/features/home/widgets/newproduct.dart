// import 'package:flutter/material.dart';




// import '../../../common/widgets/loader.dart';
// import '../../account/widgets/single_product.dart';
// import '../services/homeservicessecond.dart';



// class Products extends StatefulWidget {
//   const Products({Key? key}) : super(key: key);

//   @override
//   State<Products> createState() => _ProductsState();
// }

// class _ProductsState extends State<Products> {
//    List<Product>? products;
//   final HomeServicesSecond homeServices = HomeServicesSecond();

//   @override
//   void initState() {
//     super.initState();
//     fetchAllProductss();
//   }

//   // fetchAllProductss() async {
//   //   if (mounted) {
//   //   MediaQuery.of(context).size;
//   //   Navigator.of(context).pop();  
//   //    }   
//   //   products = await homeServices.fetchAllProductss(context);
//   //   setState(() {});
//   // }
//     fetchAllProductss() async {
//     products = await homeServices.fetchAllProductss(context);
//     setState(() {});
//   }
//   @override
//   Widget build(BuildContext context) {
//     return products == null
//         ? const Loader()
//         : Scaffold(
            
//             body: Text("fjdlfjldskj"),
           
//           );
//   }
// }