import 'package:flutter/material.dart';
class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}):super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Container(
                height: 720,
                color: Colors.grey.shade100,
                padding: const EdgeInsets.only(
                  left: 5,
                  top: 5,
                  right: 5,
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                  
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                      child: GestureDetector(
                        onTap: () {
                       
                       },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          decoration: BoxDecoration(
                            color: Colors.white,
                           
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child:

                                
                               
                                    Row(
                                      children: [
                                        Container(
                                                height: 85,
                                                width: 85,
                                                color: Colors.green,
                                              ),
                                              SizedBox(width: 10,),
                                        Stack(
                                          
                                          
                                              children: <Widget>[
                                                  
                                                  Align(
                                             alignment: Alignment.topLeft,
                                               child:
                                                Text(
                                                  "Grande International Hospital",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.black54,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 18),
                                                ),),

                                                
                                              
                                            SizedBox(height: 5,),
                                           Align(
        alignment: Alignment.centerLeft,
        child: Row(

                                              children: <Widget>[
                                                
                                                Text(
                                                  " 48 Bed(s) available",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.green,
                                                      fontStyle: FontStyle.italic,
                                                      fontSize: 15),
                                                ),

                                               
                                              ],
                                            ),),
                                          
                                            SizedBox(height: 5,),
                                            Align(
        alignment: Alignment.bottomRight,
        
                                              
                                              
                                             

                                               child: Text(
                                                  "                                                               Kathmandu",
                                                  // orderData.totalPrice.toString(),
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.green,
                                                      fontStyle: FontStyle.italic,
                                                      fontSize: 15),
                                                )
                                                // ],
                                                // ),
                                              
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  
                                
                               
                              
                            
                          
                        ),
                      ),
                    ));
                  },
                  
                ),
              ),
            ],
          );
          
  }
}



