import 'package:luveen/features/cart/screens/cart_screen.dart';
import 'package:luveen/features/home/services/productDetailServices.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../models/product.dart';

class ProductDetails extends StatefulWidget {
  // static const String routeName = '/prduct-details-details';

  static const String routeName = '/product-details-details';

  // final product_detail_name;
  // final product_detail_new_price;

  // final product_detail_pictures;
  final Product product;

  ProductDetails({
    // required this.product_detail_name,
    // this.product_detail_new_price,

    // this.product_detail_pictures,
    required this.product,
  });
  //const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  // void addToCart() {
  //   ProductDetailsServices.addToCart(
  //     context: context,
  //     product: widget.product,
  //   );
  // }
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();
  void addToCart() {
    productDetailsServices.addToCart(
      context: context,
      product: widget.product,
    );
  }

  void navigateToCart() {
    Navigator.pushNamed(context, CartScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            "Details",
            style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        // actions: <Widget>[
        // new IconButton(
        //     icon: Icon(
        //       Icons.search,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {}),
        // new IconButton(
        //     icon: Icon(
        //       Icons.shopping_cart,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {}),
        // ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                // child: Image.network(widget.product_detail_pictures),
                child: Image.network(widget.product.images[0]),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    // widget.product_detail_name,
                    widget.product.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          // "\Rs.${widget.product_detail_new_price}",
                          "\Rs.${widget.product.price}",

                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Row(
          //   children: <Widget>[
          //     Expanded(
          //       child: Container(
          //         margin: EdgeInsets.only(right: 15, top: 15),
          //         child: Image.asset(widget.product_detail_pictures),
          //       ),
          //     ),
          //     Expanded(
          //       child: Container(
          //         margin: EdgeInsets.only(right: 15, top: 15),
          //         child: Image.asset(widget.product_detail_pictures),
          //       ),
          //     ),
          //     Expanded(
          //       child: Container(
          //         margin: EdgeInsets.only(right: 15, top: 15),
          //         child: Image.asset(widget.product_detail_pictures),
          //       ),
          //     ),
          //   ],
          // ),
          // Row(
          //   children: <Widget>[
          //     Expanded(
          //       child: MaterialButton(
          //         onPressed: () {},
          //         color: Colors.white,
          //         textColor: Colors.green,
          //         elevation: 0.2,
          //         child: Row(
          //           children: <Widget>[
          //             Expanded(child: new Text("Size")),
          //             Expanded(child: Icon(Icons.arrow_drop_down)),
          //           ],
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: MaterialButton(
          //         onPressed: () {},
          //         color: Colors.white,
          //         textColor: Colors.green,
          //         elevation: 0.2,
          //         child: Row(
          //           children: <Widget>[
          //             Expanded(child: new Text("Color")),
          //             Expanded(child: Icon(Icons.arrow_drop_down)),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          Row(
            children: <Widget>[
              Expanded(
                //   child: MaterialButton(
                //     onPressed: (addToCart) {},
                //     color: Colors.green,
                //     textColor: Colors.white,
                //     elevation: 0.2,
                //     child: new Text("Buy now"),
                //   ),
                // ),

                child: CustomButton(
                  text: 'Add to Cart',
                  // onTap: addToCart,
                  onTap: addToCart,
                  // color: const Color.fromRGBO(254, 216, 19, 1),
                  color: Colors.green,
                ),
                // CartCheck(
              ),
              // MyFavCheckBox(),
            ],
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product Brand:",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("Brand X"),
              ),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text(
              "Description",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            ),
            subtitle: new Text(widget.product.description),
          ),
          // ExpansionTile(
          //   title: Text(
          //     "Description",
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.green,
          //     ),
          //   ),
          //   children: <Widget>[
          //     ListTile(
          //       title: Wrap(
          //         children: [
          //           Text(
          //               "Wishper Sanitary Pads-Ultra Clean XL-Upto 100% Stain Protection-Whisper brings to you the widest range of sanitary pads for all your period needs. Discover all options designed for the utmost comfort and dryness.Pack of 8\(Each Pack Contains 8 Pads)."),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          // Divider(),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: new Text(
          //     "Similar Products",
          //     style: TextStyle(
          //         fontSize: 16,
          //         fontWeight: FontWeight.bold,
          //         fontStyle: FontStyle.italic,
          //         color: Colors.green),
          //   ),
          // ),
          // Container(
          //   height: 340,
          //   child: Similar_Products(),
          // ),
        ],
      ),
    );
  }
}

// class Similar_Products extends StatefulWidget {
//   @override
//   _Similar_productsState createState() => _Similar_productsState();
// }

// class _Similar_productsState extends State<Similar_Products> {
//   var product_list = [
//     {
//       "name": "Fish Oil-1000 Mg",
//       "picture": "assets/products/fish oil.jpg",
//       "old_price": 1000,
//       "price": 600,
//     },
//     {
//       "name": "Wishper Sanitary Pad",
//       "picture": "assets/products/wishper.jpg",
//       "old_price": 130,
//       "price": 120,
//     },
//     {
//       "name": "Himalaya Baby Mini Pack",
//       "picture": "assets/products/himalaya.jpg",
//       "old_price": 700,
//       "price": 550,
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         itemCount: product_list.length,
//         gridDelegate:
//             new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemBuilder: (BuildContext context, int index) {
//           return Similar_single_prod(
//             prod_name: product_list[index]['name'],
//             prod_picture: product_list[index]['picture'],
//             prod_old_price: product_list[index]['old_price'],
//             prod_price: product_list[index]['price'],
//           );
//         });
//   }
// }

// class Similar_single_prod extends StatelessWidget {
//   final prod_name;
//   final prod_picture;
//   final prod_old_price;
//   final prod_price;

//   // const Single_prod({Key? key}) : super(key: key);
//   Similar_single_prod({
//     this.prod_name,
//     this.prod_picture,
//     this.prod_old_price,
//     this.prod_price,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Hero(
//         tag: prod_name,
//         child: Material(
//           child: InkWell(
//             onTap: () => Navigator.of(context).push(
//               new MaterialPageRoute(
//                 //here we are passing the values of the products to the product details page
//                 builder: (context) => new ProductDetails(
//                   product_detail_name: prod_name,
//                   product_detail_new_price: prod_price,
//                   product_detail_old_Price: prod_old_price,
//                   product_detail_pictures: prod_picture,
//                 ),
//               ),
//             ),
//             child: GridTile(
//               footer: Container(
//                 color: Colors.white70,
//                 child: new Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: Text(
//                         prod_name,
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     new Text(
//                       "\Rs.$prod_price",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               child: Image.asset(
//                 prod_picture,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }