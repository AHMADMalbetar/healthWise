import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../clientApp/allCombonantes/textFormFieldCombonantes/textFormFiled.dart';
import '../../clientApp/constant/colours.dart';
import '../allCubits/signInCubit/sign_in_cubit.dart';
import '../servicesListAndCard/servicesListAndCard.dart';

class doctorServices extends StatelessWidget {


  var doctorAboutHimController = TextEditingController();
  var doctorServiceController = TextEditingController();
  var doctorPriseController = TextEditingController();


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
              'Your Information',
              style: TextStyle(
                color: mainTitleColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            defTextFormFieldMultiLine(
              Controller: doctorAboutHimController,
              save: false,
              Label: 'About You',
              pre: Icons.info,
              defColor: Colors.teal,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Please Select Your Specialization',
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
                    style: const TextStyle(
                        color: Colors.teal,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                    items: Cubit.specialization.map((e) {
                      return DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                          ),
                      );
                    }).toList(),
                    onChanged: (v) {
                      Cubit.selectSpecializationType(v);
                    },
                    value: Cubit.service,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Please Enter Your Services and Its Prise',
              style: TextStyle(
                  color: mainColour,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 250.r,
              width: double.infinity.r,
              child: ListView.builder(
                  itemBuilder: (context, index) => doctorService(
                      serviceController: doctorServiceController,
                      priseController: doctorPriseController,
                  ),
                  itemCount: Cubit.doctorServicesList.length,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.3),
                    )
                  ),
                  child: Center(
                    child: IconButton(
                        onPressed: (){
                          Cubit.increaseServiceList(doctorServiceController, doctorPriseController);
                        },
                        icon: const Icon(Icons.add, color: Colors.teal,size: 30,),
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
