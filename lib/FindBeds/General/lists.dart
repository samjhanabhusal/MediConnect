
import 'package:flutter/material.dart';
import 'package:luveen/FindBeds/General/HospitalDetails.dart';

class lists extends StatefulWidget {
  @override
  _listsState createState() => _listsState();
}

class _listsState extends State<lists> {
  var hospital_list = [
    {
      "name": "Himalayan Baby Soap",
      "picture": "assets/images/products/blazer1.jpeg",
      "beds_available": 25,
      "location": "banepa",
    },
    {      
      "name": "Himalayan Baby Soap",
      "picture": "assets/images/products/blazer1.jpeg",
      "beds_available": 25,
      "location": "banepa",
    },
    {
            "name": "Himalayan Baby Soap",
      "picture": "assets/images/products/blazer1.jpeg",
      "beds_available": 25,
      "location": "banepa",
    },
    {
            "name": "Himalayan Baby Soap",
      "picture": "assets/images/products/blazer1.jpeg",
      "beds_available": 25,
      "location": "banepa",
    },
    {
            "name": "Himalayan Baby Soap",
      "picture": "assets/images/products/blazer1.jpeg",
      "beds_available": 25,
      "location": "banepa",
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,// set padding to zero
        itemCount: hospital_list.length,
    
        itemBuilder: (BuildContext context, int index) {
          return Single_hospital(
            hospital_name: hospital_list[index]['name'],
            hospital_picture: hospital_list[index]['picture'],
            beds_available: hospital_list[index]['beds_available'],
            hospital_location: hospital_list[index]['location'],
          );
        });
  }
}

class Single_hospital extends StatelessWidget {
  final hospital_name;
  final hospital_picture;
  final beds_available;
  final hospital_location;

  Single_hospital({
    this.hospital_name,
    this.hospital_picture,
    this.beds_available,
    this.hospital_location,
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Hero(
          tag: hospital_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                //here we are passing the values of the products to the product details page
                builder: (context) => new HospitalDetails(
                 hospital_name: hospital_name,
                  hospital_picture: hospital_picture,
                  beds_available:beds_available,
                 hospital_location: hospital_location,
                ),
              ),
            ),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                        leading: Text(
                          hospital_name,
                          style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Colors.black54,),
                        ),
                        title: Text(
                          "\Rs.$beds_available",
                          style: TextStyle(
                              color: Colors.green,fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "\Rs.$beds_available",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              decoration
                                  :TextDecoration.lineThrough),
                        ),
                    ),
                  ),
                  child: Image.asset(
                    hospital_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}

