





















import 'package:flutter/material.dart';
import 'package:luveen/FindBeds/VIP/VIPBeds.dart';

class VIP extends StatefulWidget {
  const VIP({Key? key}):super(key: key);

  @override
  State<VIP> createState() => _VIPState();
}

class _VIPState extends State<VIP> {
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
            automaticallyImplyLeading: true,
          
           
           
           
              
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
              title: Center(child: Text('VIP Ward', )),
               backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                toolbarHeight: 27,
                

             ),
           
               
               
  // Hospital display hune ho yeha chai.

          Container(
            // height: 720,
            color: Colors.black12,
            child: 
            VIPBeds(),
          )
              
            ]),
          ),
        ],
      ),
     
    );
  }
}