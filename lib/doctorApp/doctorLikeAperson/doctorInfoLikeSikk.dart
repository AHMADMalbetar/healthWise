import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../clientApp/allCombonantes/textFormFieldCombonantes/textFormFiled.dart';
import '../../clientApp/constant/colours.dart';
import '../allCubits/signInCubit/sign_in_cubit.dart';

class doctorInfoLikeSikk extends StatelessWidget {

  var doctorBirthController = TextEditingController();
  var doctorHighController = TextEditingController();
  var doctorWightController = TextEditingController();
  var doctorBloodTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {},
      builder: (context, state) {
        var Cubit = SignInCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Birth',
              style: TextStyle(
                color: mainTitleColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            defTextFormField(
              Controller: doctorBirthController,
              save: false,
              Label: 'Birthday',
              defColor: Colors.teal,
              pre: Icons.cake,
              ttfTap: () async {
                DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                );
                if(date != null){
                  doctorBirthController.text = Cubit.selectDate(doctorBirthController, date);
                }
              }
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'High',
                        style: TextStyle(
                          color: mainTitleColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defTextFormField(
                        Controller: doctorHighController,
                        save: false,
                        Label: 'High',
                        defColor: Colors.teal,
                        pre: Icons.accessibility,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wight',
                        style: TextStyle(
                          color: mainTitleColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defTextFormField(
                        Controller: doctorWightController,
                        save: false,
                        Label: 'wight',
                        defColor: Colors.teal,
                        pre: Icons.two_k_outlined,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Gender',
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
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.grey
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DropdownButton(
                      items: Cubit.gender.map((val) {
                        return DropdownMenuItem(
                            value: val,
                            child: Text(
                              val,
                            ),
                        );
                      }).toList(),
                      onChanged: (val){
                        Cubit.selectGenderType(val);
                      },
                    value: Cubit.Gender,
                    style: const TextStyle(
                        color: Colors.teal,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Gender',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Blood Type',
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
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DropdownButton(
                    isExpanded: true,
                    iconSize: 30,
                    hint: const Text(
                      'Blood Type',
                    ),
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                    items: Cubit.bloodList.map((value) {
                      return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                          ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      Cubit.selectBloodType(value);
                    },
                    value: Cubit.bloodType,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
