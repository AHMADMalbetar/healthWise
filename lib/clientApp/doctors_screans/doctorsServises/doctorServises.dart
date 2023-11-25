
import 'package:flutter/material.dart';

import '../../allCombonantes/categories/category.dart';
import '../../allCombonantes/doctorCard/doctorCard.dart';
import '../../allCombonantes/textFormFieldCombonantes/textFormFiled.dart';
import '../../classes/doctorClass.dart';
import '../../classes/doctorsInformation.dart';
import '../../constant/colours.dart';
import '../doctorProfileAndTime/doctorProfileAndTime.dart';
import '../selectedCategory/selectedCategory.dart';

class doctorServises extends StatelessWidget {

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
          'Find Doctor',
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
                  Label: 'Search about Doctors',
                  pre: Icons.search,
                  defColor: allTealColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Category',
                style: TextStyle(
                  color: mainTitleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 300,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ourCategories(
                            inWork: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      selectedCategory(
                                        doctorCategoryTitle[0],
                                      ),
                                ),
                              );
                            },
                            typeOfDoctorWork: doctorCategoryTitle[0],
                            typeDoctorImage: 'images/im.jpg',
                          ),
                          ourCategories(
                            inWork: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      selectedCategory(
                                        doctorCategoryTitle[1],
                                      ),
                                ),
                              );
                            },
                            typeOfDoctorWork: doctorCategoryTitle[1],
                            typeDoctorImage: 'images/im.jpg',
                          ),
                          ourCategories(
                            inWork: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      selectedCategory(
                                        doctorCategoryTitle[2],
                                      ),
                                ),
                              );
                            },
                            typeOfDoctorWork: doctorCategoryTitle[2],
                            typeDoctorImage: 'images/im.jpg',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ourCategories(
                            inWork: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      selectedCategory(
                                        doctorCategoryTitle[3],
                                      ),
                                ),
                              );
                            },
                            typeOfDoctorWork: doctorCategoryTitle[3],
                            typeDoctorImage: 'images/im.jpg',
                          ),
                          ourCategories(
                            inWork: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      selectedCategory(
                                        doctorCategoryTitle[4],
                                      ),
                                ),
                              );
                            },
                            typeOfDoctorWork: doctorCategoryTitle[4],
                            typeDoctorImage: 'images/im.jpg',
                          ),
                          ourCategories(
                            inWork: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      selectedCategory(
                                        doctorCategoryTitle[5],
                                      ),
                                ),
                              );
                            },
                            typeOfDoctorWork: doctorCategoryTitle[5],
                            typeDoctorImage: 'images/im.jpg',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Recommended Doctor',
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
