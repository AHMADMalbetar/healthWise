import 'package:flutter/material.dart';

import '../../allCombonantes/doctorCard/doctorCard.dart';
import '../../allCombonantes/textFormFieldCombonantes/textFormFiled.dart';
import '../../classes/doctorsInformation.dart';
import '../../constant/colours.dart';
import '../doctorProfileAndTime/doctorProfileAndTime.dart';


class selectedCategory extends StatelessWidget {
  selectedCategory(
    this.workDoctor,
  );

  final workDoctor;

  var searchController = TextEditingController();

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
          'Cardiologists',
          style: TextStyle(
            color: mainTitleColor,
            fontSize: 18
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: defTextFormField(
                  Controller: searchController,
                  save: false,
                  Label: 'Find a Doctor',
                  pre: Icons.search,
                  defColor: subTitleColor,
              ),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return docInfo[index % 12].doctorWork == workDoctor ? recommendedDoctor(
                      docRate: docInfo[index % 12].doctorRate,
                      docLocation: docInfo[index % 12].doctorLocation,
                      docName: docInfo[index % 12].doctorName,
                      docWork: docInfo[index % 12].doctorWork,
                      docImage: docInfo[index % 12].doctorImage,
                      inwork: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                doctorProfile(
                                  docInfo[index % 12].doctorName,
                                  docInfo[index % 12].doctorWork,
                                  docInfo[index % 12].doctorRate,
                                  docInfo[index % 12].doctorLocation,
                                  docInfo[index % 12].doctorImage,
                                ),
                          ),
                        );
                      }
                  ) : const SizedBox();
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: docInfo.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
