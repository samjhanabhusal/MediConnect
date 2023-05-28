import 'package:luveen/common/widgets/loader.dart';
import 'package:luveen/features/account/widgets/single_product.dart';
import 'package:luveen/features/admin/screens/add_product_screen.dart';
import 'package:luveen/features/admin/services/admin_services.dart';
import 'package:luveen/models/product.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products!.removeAt(index);
        setState(() {});
      },
    );
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: GridView.builder(
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final productData = products![index];
                return
                    // Column(
                    //   children: [
                    //     SizedBox(
                    //       height: 140,
                    //       child: SingleProduct(
                    //         image: productData.images[0],
                    //       ),
                    //     ),
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: [
                    //         Expanded(
                    //           child: Text(
                    //             productData.name,
                    //             overflow: TextOverflow.ellipsis,
                    //             maxLines: 2,
                    //           ),
                    //         ),
                    //         IconButton(
                    //           onPressed: () => deleteProduct(productData, index),
                    //           icon: const Icon(
                    //             Icons.delete_outline,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // );
                    Card(
                  child: Hero(
                      // tag: prod_name,
                      tag: productData.name,
                      child: Material(
                        child: InkWell(
                          //   onTap: () => Navigator.of(context).push(
                          //   new MaterialPageRoute(
                          //     //here we are passing the values of the products to the product details page
                          //     builder: (context) => new ProductDetails(
                          //       product_detail_name: prod_name,
                          //       product_detail_new_price: prod_price,

                          //       product_detail_pictures: prod_picture,
                          //     ),
                          //   ),
                          // ),
                          // onTap: () {
                          //   Navigator.pushNamed(
                          //     context,
                          //     // ProductDetailScreen.routeName,
                          //     ProductDetails.routeName,
                          //     arguments: product,
                          //   );
                          // },
                          child: GridTile(
                              footer: Container(
                                color: Colors.white,
                                child: ListTile(
                                  leading: Text(
                                    productData.name,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  title: Text(
                                    // "\Rs.$prod_price",
                                    "\Rs.${productData.price}",

                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ),
                              child: Image.network(
                                productData.images[0],
                                fit: BoxFit.cover,
                              )),
                        ),
                      )),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: navigateToAddProduct,
              tooltip: 'Add a Product',
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
