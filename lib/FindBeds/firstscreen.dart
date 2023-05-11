import 'package:flutter/material.dart';


import 'package:flutter_switch/flutter_switch.dart';
import 'package:luveen/FindBeds/General/general.dart';
import 'package:luveen/FindBeds/ICU/ICU.dart';
import 'package:luveen/FindBeds/VIP/VIP.dart';
import 'package:luveen/FindBeds/Ventilator/Ventilator.dart';



class FirstScreen extends StatefulWidget {
  static const String routeName = '/first_screen';
  const FirstScreen({ Key ? key}):super(key:key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
   bool status= false;
     bool isSwitched = false;
     var textValue = 'Turn on your location to find nearest hospital beds';  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
  appBar:PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          // here the desired height
          child:AppBar(
  
  title: Text('Find Beds', style: TextStyle(fontStyle: FontStyle.normal,fontSize: 25,color: Colors.white
          ),),
  actions: [
    Icon(Icons.more_vert),
  ],
  backgroundColor: Colors.green,
),

  ),
  body: Padding(padding: const EdgeInsets.fromLTRB(20, 50, 15, 25),
  
    child: Column(children: [
          
          
Container(
  child:  
      Row(
        children: [
          
            
              Column(
                children: [
                  Text(
                      "Location",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontStyle: FontStyle.normal,fontSize: 35,color: Colors.black45, fontWeight: FontWeight.w500
                            ),
                  ),

                 
                ],
              ),
              

            
          
          Spacer(),
          
           FlutterSwitch(
              activeColor: Colors.green,
              width: 70.0,
              height: 35.0,
              valueFontSize: 15.0,
              toggleSize: 25.0,
              value: status,
              borderRadius: 30.0,
              padding: 5.0,
              showOnOff: true,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),


    

          
          //button yeta
        ],
      ),
      
    
    
  ),


// ElevatedButton(
  //                   onPressed: () async {
  //                       Location location = new Location();
  //                       bool ison = await location.serviceEnabled(); 
  //                       if (!ison) { //if defvice is off
  //                         bool isturnedon = await location.requestService();
  //                         if (isturnedon) {
  //                            print("GPS device is turned ON");
  //                         }else{
  //                            print("GPS Device is still OFF");
  //                         }
  //                       }
  //                   }, 
  //                   child: Text("Turn On GPS | Location Package")
  //                 ),
          //  AnimatedTextKit(animatedTexts: [FlickerAnimatedText('Turn on your Location!', 
          //  textStyle: TextStyle(fontStyle: FontStyle.normal,fontSize: 18,color: Colors.black54)),
           
           
          //  ],isRepeatingAnimation: true,
          //        totalRepeatCount: 10000,
          //       ),
// Container(
//   height: 30,
//   child:   AnimatedTextKit(
//                     totalRepeatCount: 4000000,
//                     animatedTexts: [
//                       ScaleAnimatedText(
//                         'Turn on your location to find near hospital beds',
//                         // duration: Duration(milliseconds: 3000),
//                         textStyle: const TextStyle(
//                             fontStyle: FontStyle.normal,fontSize: 20,color: Colors.black38),
//                       ),
                    
//                     ],
//                   ),
// ),
                // AnimatedTextKit(
                //   totalRepeatCount: 40,
                //   animatedTexts: [
                   
                //     FlickerAnimatedText(
                //       'Turn on your Location',
                      
                //       textStyle:
                //           const TextStyle(color: Colors.green, fontSize: 20.0),
                //     ),
                //   ],
                // ),
// Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[
//     AnimatedDefaultTextStyle(
//       style: isSelected
//           ? const TextStyle(fontSize: 50, color: Colors.red, fontWeight: FontWeight.bold)
//           : const TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w100),
//       duration: const Duration(milliseconds: 200),
//       child: const Text("Animate me!"),
//     ),
//     TextButton(
//       child: const Text("Click me!"),
//       onPressed: () {
//         setState(() {
//           isSelected = !isSelected;
//         });
//       },
//     ),
//   ],
// ),


           const SizedBox(
                  height: 50
              
                      
                ),
          Row(
            children: [
             Material(
        color: Colors.green,
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
        splashColor: Colors.black26,
        onTap: (){
           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => General()),
  );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Ink.image(image: AssetImage('assets/images/General.jpg'),
            height: 170,
            width: 180,
            fit: BoxFit.cover,),
            SizedBox(height: 6,),
            Text('General Ward',
            style: TextStyle(fontSize: 25,color: Colors.white),),
             SizedBox(height: 6,),
          ],
        ),
        
      )),
        const SizedBox(
                  width: 16
              
                      
                ),
       Material(
        color: Colors.green,
        elevation: 10,
       borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
        splashColor: Colors.black26,
        onTap: (){
           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => VIP()),
  );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Ink.image(image: AssetImage('assets/images/VIP.jpg'),
           height: 170,
            width: 180,
            fit: BoxFit.cover,),
            SizedBox(height: 6,),
            Text('VIP Ward',
            style: TextStyle(fontSize: 25,color: Colors.white),),
             SizedBox(height: 6,),
          ],
        ),
        
      )),
            ],
          ),
           const SizedBox(
                  height: 10
              
                      
                ),
          Row(
            children: [
              Material(
        color: Colors.green,
        elevation: 10,
       borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
        splashColor: Colors.black26,
         onTap: (){
           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ICU()),
  );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Ink.image(image: AssetImage('assets/images/ICU.jpg'),
           height: 170,
            width: 180,
            fit: BoxFit.cover,),
            SizedBox(height: 6,),
            Text('ICU',
            style: TextStyle(fontSize: 25,color: Colors.white),),
             SizedBox(height: 6,),
          ],
        ),
        
      )),
        const SizedBox(
                  width: 16
              
                      
                ),
         Material(
        color: Colors.green,
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
        splashColor: Colors.black26,
          onTap: (){
           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Ventilator()),
  );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Ink.image(image: AssetImage('assets/images/Ventilator.jpg'),
           height: 170,
            width: 180,
            fit: BoxFit.cover,),
            SizedBox(height: 6,),
            Text('Ventilator',
            style: TextStyle(fontSize: 25,color: Colors.white),),
             SizedBox(height: 6,),
          ],
        ),
        
      )),
            ],
          ),
           
    ],),
  ),
     
      //BUTTON LOCATION
      
);

}
}