// import 'dart:ffi';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:luveen/common/widgets/loader.dart';
import 'package:luveen/features/account/widgets/single_product.dart';
import 'package:luveen/features/admin/services/admin_services.dart';
import 'package:luveen/features/order_details/screens/order_details.dart';
import 'package:luveen/models/order.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  // final Order order;
  const OrdersScreen({
    Key? key,
    // required this.order,
  }) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : Container(
            color: Colors.grey.shade100,
            padding: const EdgeInsets.only(
              left: 5,
              top: 5,
              right: 5,
            ),
            child: ListView.builder(
              itemCount: orders!.length,
              itemBuilder: (context, index) {
                final orderData = orders![index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 5.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        OrderDetailScreen.routeName,
                        arguments: orderData,
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius:
                        //     const BorderRadius.all(Radius.circular(10)),
                        // border: Border.all(
                        //     width: 1.0,
                        //     color: Colors.grey,
                        //     style: BorderStyle.solid),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: <Widget>[
                                    // Row(
                                    //   children: <Widget>[
                                    Text(
                                      "Order ID: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 10),
                                    ),

                                    Text(
                                      orderData.id,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 10),
                                    )
                                    // ],
                                    // ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    // Row(
                                    //   children: <Widget>[
                                    Text(
                                      "Ordered Date: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 10),
                                    ),

                                    Text(
                                      // ${orderData.date}
                                      DateFormat().format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            orderData.orderedAt),
                                        // widget.order.orderedAt),
                                      ),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 10),
                                    )
                                    // ],
                                    // ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    // Row(
                                    //   children: <Widget>[
                                    Text(
                                      "Total items: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 10),
                                    ),

                                    Text(
                                      orderData.quantity.toString().toString(),
                                      // orderData.quantity,
                                      //  orderData.totalPrice,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 10),
                                    )
                                    // ],
                                    // ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    // Row(
                                    //   children: <Widget>[
                                    Text(
                                      "Total: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.green,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 14),
                                    ),

                                    Text(
                                      // "",
                                      orderData.totalPrice.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.green,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 14),
                                    )
                                    // ],
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.10,
                              width: MediaQuery.of(context).size.height * 0.12,
                              child: SingleProduct(
                                image: orderData.products[0].images[0],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
