import 'package:flutter/material.dart';

Widget ourCategories({
  required String typeOfDoctorWork,
  required String typeDoctorImage,
  Function()? inWork,
}) =>
    Expanded(
      child: InkWell(
        onTap: inWork,
        child: Container(
          height: 150,
          color: Colors.white,
          child: Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        typeDoctorImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    typeOfDoctorWork,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
