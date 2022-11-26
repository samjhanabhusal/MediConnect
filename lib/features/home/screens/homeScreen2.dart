import 'package:luveen/features/home/widgets/Products.dart';
import 'package:luveen/features/home/widgets/carousel_image.dart';
import 'package:luveen/features/home/widgets/top_categories.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../constants/global_variables.dart';
import '../../search/screens/search_screen.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class Dashboard0 extends StatefulWidget {
  static const String routeName = '/home2';
  const Dashboard0({Key? key}) : super(key: key);

  @override
  State<Dashboard0> createState() => _Dashboard0State();
}

class _Dashboard0State extends State<Dashboard0> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    // Widget image_carousel = new Container(
    //   height: 180,
    //   child: new CarouselImage(
    //   boxFit: BoxFit.cover,
    //   images: [
    //     AssetImage('assets/sale1.png'),
    //     AssetImage('assets/sale2.jpeg'),
    //     AssetImage('assets/sale1.png'),
    //     AssetImage('assets/sale2.jpeg'),
    //     AssetImage('assets/sale1.png'),
    //   ],
    //   autoplay: true,
    //   animationCurve: Curves.fastOutSlowIn,
    //  animationDuration: Duration(milliseconds: 1000),
    //   dotSize: 3.0,
    //   dotColor: Colors.white,
    //   indicatorBgPadding: 4.0,
    // ),

    // );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(left: 15),
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      elevation: 1,
                      child: TextFormField(
                        onFieldSubmitted: navigateToSearchScreen,
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(
                                left: 6,
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                          hintText: 'Search in Luveen',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   color: Colors.transparent,
                //   height: 42,
                //   margin: const EdgeInsets.symmetric(horizontal: 10),
                //   child: const Icon(Icons.mic, color: Colors.black, size: 25),
                // ),
              ],
            ),
          ),

          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                  'Categories',
                  style: new TextStyle(
                      fontSize: 16.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),

              //Horizontal list view begins here
              TopCategories(),
              CarouselImage(),

              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                  'Recent Products',
                  style: new TextStyle(
                      fontSize: 16.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),

              //grid view
              Container(
                height: 460,
                color: Colors.black12,
                child: Productie(),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
