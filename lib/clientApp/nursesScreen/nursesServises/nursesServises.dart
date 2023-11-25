import 'package:flutter/material.dart';

import '../../allCombonantes/doctorCard/doctorCard.dart';
import '../../allCombonantes/textFormFieldCombonantes/textFormFiled.dart';
import '../../classes/doctorsInformation.dart';
import '../../constant/colours.dart';
import '../nurseProfileAndTime.dart';


class nurseServises extends StatelessWidget {

  var searchcon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Find Nurse',
          style: TextStyle(
            color: mainTitleColor,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 40,
                child: defTextFormField(
                  Controller: searchcon,
                  save: false,
                  Label: 'Search about Nurses',
                  pre: Icons.search,
                  defColor: allTealColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Recommended Nurse',
                style: TextStyle(
                  color: mainTitleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Flexible(
                child: ListView.separated(
                  primary: true,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return docInfo[index % 12].doctorWork == 'General' ? recommendedDoctor(
                        docRate: nurseInfo[index % 12].doctorRate,
                        docLocation: nurseInfo[index % 12].doctorLocation,
                        docName: nurseInfo[index % 12].doctorName,
                        docWork: nurseInfo[index % 12].doctorWork,
                        docImage: nurseInfo[index % 12].doctorImage,
                        inwork: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  nurseProfile(
                                    nurseInfo[index % 12].doctorName,
                                    nurseInfo[index % 12].doctorWork,
                                    nurseInfo[index % 12].doctorRate,
                                    nurseInfo[index % 12].doctorLocation,
                                    nurseInfo[index % 12].doctorImage,
                                  ),
                            ),
                          );
                        }
                    ) : const SizedBox(
                      width: 0, height: 0,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(
                        height: 5,
                      ),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}