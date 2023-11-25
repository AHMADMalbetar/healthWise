import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../allCombonantes/doctorCard/doctorCard.dart';
import '../../allCombonantes/servises/servises.dart';
import '../../allCombonantes/textFormFieldCombonantes/textFormFiled.dart';
import '../../classes/doctorsInformation.dart';
import '../../constant/colours.dart';
import '../../nursesScreen/nurseProfileAndTime.dart';
import '../../nursesScreen/nursesServises/nursesServises.dart';
import '../doctorProfileAndTime/doctorProfileAndTime.dart';
import '../doctorsServises/doctorServises.dart';


class homeScrean extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: defTextFormField(
                  Controller: searchController,
                  save: false,
                  Label: 'Search your Doctor, Nurse',
                  defColor: allTealColor,
                  pre: Icons.search,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: whatDoYouWant(
                      serImage: 'Images/doctor.jpg',
                      serType: 'Doctor',
                      inkwellWork: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => doctorServises()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: whatDoYouWant(
                      serImage: 'Images/nurses.jpg',
                      serType: 'Nurse',
                      inkwellWork: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => nurseServises(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: whatDoYouWant(
                      serImage: 'Images/ambulance.jpg',
                      serType: 'Ambulance',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Top Doctor',
                  style: TextStyle(
                    color: mainTitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 200,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return docInfo[index % 12].doctorRate >= 4.5
                      ? topDoctorCard(
                          docRate: docInfo[index % 12].doctorRate,
                          docLocation: docInfo[index % 12].doctorLocation,
                          docName: docInfo[index % 12].doctorName,
                          docWork: docInfo[index % 12].doctorWork,
                          docImage: docInfo[index % 12].doctorImage,
                          inWork: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => doctorProfile(
                                  docInfo[index % 12].doctorName,
                                  docInfo[index % 12].doctorWork,
                                  docInfo[index % 12].doctorRate,
                                  docInfo[index % 12].doctorLocation,
                                  docInfo[index % 12].doctorImage,
                                ),
                              ),
                            );
                          })
                      : const Padding(padding: EdgeInsets.zero,);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 5,
                ),
                itemCount: docInfo.length,
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Top Nurses',
                  style: TextStyle(
                    color: mainTitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 200,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return docInfo[index % 12].doctorRate >= 4.5
                      ? topDoctorCard(
                      docRate: nurseInfo[index % 12].doctorRate,
                      docLocation: nurseInfo[index % 12].doctorLocation,
                      docName: nurseInfo[index % 12].doctorName,
                      docWork: nurseInfo[index % 12].doctorWork,
                      docImage: nurseInfo[index % 12].doctorImage,
                      inWork: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => nurseProfile(
                              nurseInfo[index % 12].doctorName,
                              nurseInfo[index % 12].doctorWork,
                              nurseInfo[index % 12].doctorRate,
                              nurseInfo[index % 12].doctorLocation,
                              nurseInfo[index % 12].doctorImage,
                            ),
                          ),
                        );
                      })
                      : const SizedBox(
                    height: 0,
                    width: 0,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 5,
                ),
                itemCount: nurseInfo.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
