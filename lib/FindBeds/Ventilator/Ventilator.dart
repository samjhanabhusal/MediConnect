import 'package:flutter/material.dart';
import 'package:luveen/FindBeds/Ventilator/VentilatorBeds.dart';
class Ventilator extends StatefulWidget {
  const Ventilator({Key? key}):super(key: key);

  @override
  State<Ventilator> createState() => _VentilatorState();
}

class _VentilatorState extends State<Ventilator> {
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
        // preferredSize: Size.fromHeight(5)),
                
            

              
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
              title: Center(child: Text('Ventilators')),
               backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                toolbarHeight: 27,
                

             ),
         


          //  const SliverAppBar(
          //     title: Text('pinned'),
          //     pinned: true,
          //     centerTitle: true,
          //   ),
               
               
  // Hospital display hune ho yeha chai.

          Container(
            // height: 720,
            color: Colors.black12,
            child: 
            VentilatorBeds(),
          )
              
            ]),
          ),
        ],
      ),
     
    );
  }
}