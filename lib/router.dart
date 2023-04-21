// import 'dart:ffi';

import 'package:luveen/common/widgets/bottom_bar.dart';
import 'package:luveen/features/address/screens/address_screen.dart';
import 'package:luveen/features/admin/screens/add_product_screen.dart';
import 'package:luveen/features/auth/screens/auth_screen.dart';
import 'package:luveen/features/cart/screens/cart_screen.dart';
import 'package:luveen/features/home/screens/category_deals_screen.dart';
import 'package:luveen/features/home/screens/homeScreen2.dart';
import 'package:luveen/features/home/screens/home_screen.dart';
import 'package:luveen/features/home/screens/prescriptionView.dart';
import 'package:luveen/features/order_details/screens/order_details.dart';
import 'package:luveen/features/product_details/screens/product_details_screen.dart';
import 'package:luveen/features/search/screens/search_screen.dart';
import 'package:luveen/models/Pres.dart';
import 'package:luveen/models/order.dart';
import 'package:luveen/models/product.dart';
import 'package:flutter/material.dart';

import 'features/home/screens/prescriptionscreen.dart';
import 'features/home/screens/productdetailscreen.dart';
import 'features/home/widgets/pickImage.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    case Dashboard0.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Dashboard0(),
      );
    case CartScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Dashboard0(),
      );
    case BottomBar.routeName:
      // var updatePage = routeSettings.arguments as int;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    //   case BottomBar.routeName:
    // var updatePage = routeSettings.arguments as Array;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const BottomBar(
    //       //  page:page,
    //     ),
    //   );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );

    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    // case ProductDetailScreen.routeName:
    //   var product = routeSettings.arguments as Product;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => ProductDetailScreen(
    //       product: product,
    //     ),
    //   );

    case ProductDetails.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetails(
          product: product,
        ),
      );
    case PrescriptionScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PrescriptionScreen(),
      );
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );

    case PickImage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PickImage(),
      );
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );
       case PrescriptionView.routeName:
      var prescription = routeSettings.arguments as Pres;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PrescriptionView(
          prescription: prescription,
        ),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
