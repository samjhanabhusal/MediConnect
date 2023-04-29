import 'package:flutter/material.dart';
import 'package:luveen/FindBeds/ICU/ICUBeds.dart';
 class ICU extends StatefulWidget {
  const ICU({Key? key}):super(key: key);

  @override
  State<ICU> createState() => _ICUState();
}

class _ICUState extends State<ICU> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 70,
            elevation: 10,
            
            // floating: true,
            // pinned: true,
            // snap: false,
            // centerTitle: false,
            automaticallyImplyLeading: false,
          
           
           
           
              
              title:  Container(
                width: double.infinity,
                height: 40,
                color: Colors.grey.shade300,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search Hospitals, Locations',
                        prefixIcon: Icon(Icons.search),
                        // suffixIcon: Icon(Icons.camera_alt)
                        ),
                  ),
                ),
              ),
        //       bottom: PreferredSize(
        // child: Text("General Ward beds"),
        // preferredSize: Size.zero),
                
              

              
            ),
            
          
          
          // Other Sliver Widgets
          SliverList(
            
            delegate: SliverChildListDelegate([
              
               
            //  new SliverAppBar(
            //   floating: true,
            //   automaticallyImplyLeading: false,
            //   title: Text('General Ward Bed(s)'),
            // ),

             
          AppBar(
              title: Center(child: Text('Intensive Care Unit', )),
               backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                toolbarHeight: 27,
                
                

             ),


           
               
               
  // Hospital display hune ho yeha chai.

          Container(
            // height: 720,
            color: Colors.black12,
            child: 
            ICUBeds(),
          )
              
            ]),
          ),
        ],
      ),
     
    );
  }
}