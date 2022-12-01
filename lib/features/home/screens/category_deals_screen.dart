import 'package:luveen/common/widgets/loader.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/features/home/screens/productdetailscreen.dart';
import 'package:luveen/features/home/services/home_services.dart';
import 'package:luveen/features/home/widgets/Products.dart';
import 'package:luveen/features/product_details/screens/product_details_screen.dart';
// import 'package:luveen/features/product_details/screens/product_details_screen.dart';
import 'package:luveen/models/product.dart';
import 'package:flutter/material.dart';
// import '../../product_details/screens/product_details_screen.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: productList == null
          ? const Loader()
          : Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Keep shopping for ${widget.category}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey.shade100,
                  height: 580,
                  child: GridView.builder(
                    padding: const EdgeInsets.only(left: 15),
                    itemCount: productList!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: 1.4,
                      // mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final product = productList![index];
                      return Card(
                        child: Hero(
                            // tag: prod_name,
                            tag: product.name,
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
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    // ProductDetailScreen.routeName,
                                    ProductDetails.routeName,
                                    arguments: product,
                                  );
                                },
                                child: GridTile(
                                    footer: Container(
                                      color: Colors.white,
                                      child: ListTile(
                                        leading: Text(
                                          product.name,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        title: Text(
                                          // "\Rs.$prod_price",
                                          "\Rs.${product.price}",

                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    child: Image.network(
                                      product.images[0],
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            )),
                      );
                      /////yeha samma
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
