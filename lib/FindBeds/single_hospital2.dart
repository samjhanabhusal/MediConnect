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
  List<Bed>? beds;
  List<Hospital>? hospitals;
  final HospitalService hospitalService = HospitalService();

  @override
  void initState() {
    super.initState();
    fetchHospitals();
  }

  void fetchHospitals() async {
    hospitals = await hospitalService.fetchAllHospitals(context);
    if (hospitals != null && hospitals!.isNotEmpty) {
      for (final hospital in hospitals!) {
        final fetchedBeds = await hospitalService.fetchAllBedsByHospitalId(
          context: context,
          hospitalId: hospital.id,
        );
        if (fetchedBeds != null) {
          beds ??= [];
          beds!.addAll(fetchedBeds);
        }
      }
    }
    setState(() {});
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
            itemCount: beds?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              if (beds == null || hospitals == null) {
                return SizedBox.shrink();
              }

              if (index >= beds!.length) {
                return SizedBox.shrink();
              }

              final bedData = beds![index];
              // final hospitalData = hospitals![index ~/ 2]; // Divide by 2 to get the corresponding hospital index
              final hospitalData = hospitals![index]; // Divide by 2 to get the corresponding hospital index

              return GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HospitalDetails(
                      hospital: hospitalData,
                      bed: bedData,
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
                          decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.green),
                            image: DecorationImage(
                              image: NetworkImage(bedData.hospital_picture[0]),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  hospitals![index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                // "${beds![index].beds_available} Beds(s) available",
                                "${beds![index].beds_available} Beds(s) total",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                // hospitalData.name,
                                hospitals![index].name,
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
