import 'package:flutter/material.dart';

import '../../clientApp/allCombonantes/textFormFieldCombonantes/textFormFiled.dart';
import '../../clientApp/constant/colours.dart';

Widget doctorService({
  required TextEditingController serviceController,
  required TextEditingController priseController,
}) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Service',
                  style: TextStyle(
                    color: mainTitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                defTextFormField(
                    Controller: serviceController,
                    save: false,
                    Label: '',
                  defColor: Colors.teal,
                  pre: Icons.medical_services_outlined,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Prise',
                  style: TextStyle(
                    color: mainTitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                defTextFormField(
                  Controller: priseController,
                  save: false,
                  Label: '',
                  defColor: Colors.teal,
                  pre: Icons.attach_money,
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}