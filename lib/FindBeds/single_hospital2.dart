import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:luveen/FindBeds/General/HospitalDetails.dart';
import 'package:luveen/common/widgets/loader.dart';
import 'package:luveen/features/Hospital/services/hospital_services.dart';
import 'package:luveen/models/bed.dart';
import 'package:luveen/models/Hospital.dart';
class Single_hospital extends StatefulWidget {
  final Hospital hospital;
  Single_hospital({
    Key?key,
    required this.hospital,

  }):super(key: key);

  @override
  State<Single_hospital> createState() => _Single_hospitalState();
}

class _Single_hospitalState extends State<Single_hospital> {
   List<Bed> ? beds;
  //  late Bed bedd;
     final HospitalService hospitalService = HospitalService();
      @override
  void initState() {
    super.initState();
    // fetchHospitals();
    // fetchBeds();
    fetchbedybydId();
  }
  void fetchbedybydId () async{
  print(widget.hospital.id);

 beds = await hospitalService.fetchAllBedsByHospitalId(context: context, hospitalId: widget.hospital.id);
//  bedd = await hospitalService.fetchOnlyaBedsByHospitalId(context: context, hospitalId: widget.hospital.id) ;
 print(beds);
 
  setState((){});
}
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
          itemCount: beds!.length,
          itemBuilder: (BuildContext context, int index) {
            final bedData = beds![index];
            return GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HospitalDetails(
                    hospital_name: widget.hospital.name,
                     bed: bedData

//          
                  ),
                ),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.12,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: new BoxDecoration(
                          border: Border.all(width: 3, color: Colors.green),
                          image: new DecorationImage(
                            image: NetworkImage(beds![index].hospital_picture[0]),
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.hospital.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${beds![index].beds_available} Beds(s) available",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              widget.hospital.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontStyle: FontStyle.italic,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
}