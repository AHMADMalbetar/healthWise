import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../clientApp/constant/colours.dart';
import '../allCubits/doctorDateCubit/cubit.dart';
import '../allCubits/doctorDateCubit/states.dart';
import '../combonantes/doctorCom.dart';

class DoctorDate extends StatelessWidget {
  const DoctorDate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckBoxcubit, CheckBoxState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CheckBoxcubit.get(context);
        return Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Dr.\'s schedule',
              style: TextStyle(color: maintextcolor, fontSize: 25),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(height: 60, child: Text('Days')),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              focusColor: maincolor,
                              activeColor: maincolor,
                              side: const BorderSide(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              value: cubit.isChecked1,
                              onChanged: (value) {
                                cubit.changeCheckBox1();
                              }),
                          const Text('sunday'),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              focusColor: maincolor,
                              activeColor: maincolor,
                              side: const BorderSide(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              value: cubit.isChecked2,
                              onChanged: (value) {
                                cubit.changeCheckBox2();
                              }),
                          const Text('monday'),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              focusColor: maincolor,
                              activeColor: maincolor,
                              side: const BorderSide(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              value: cubit.isChecked3,
                              onChanged: (value) {
                                cubit.changeCheckBox3();
                              }),
                          const Text('tuesday'),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              focusColor: maincolor,
                              activeColor: maincolor,
                              side: const BorderSide(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              value: cubit.isChecked4,
                              onChanged: (value) {
                                cubit.changeCheckBox4();
                              }),
                          const Text('wednesday'),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              focusColor: maincolor,
                              activeColor: maincolor,
                              side: const BorderSide(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              value: cubit.isChecked5,
                              onChanged: (value) {
                                cubit.changeCheckBox5();
                              }),
                          const Text('Thursday'),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              focusColor: maincolor,
                              activeColor: maincolor,
                              side: const BorderSide(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              value: cubit.isChecked6,
                              onChanged: (value) {
                                cubit.changeCheckBox6();
                              }),
                          const Text('Friday'),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              focusColor: maincolor,
                              activeColor: maincolor,
                              side: const BorderSide(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              value: cubit.isChecked7,
                              onChanged: (value) {
                                cubit.changeCheckBox7();
                              }),
                          const Text('Saturday'),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 60, child: Text('from \n (h)')),
                      DatesTextFormField(IsChecked: cubit.isChecked1),
                      DatesTextFormField(IsChecked: cubit.isChecked2),
                      DatesTextFormField(IsChecked: cubit.isChecked3),
                      DatesTextFormField(IsChecked: cubit.isChecked4),
                      DatesTextFormField(IsChecked: cubit.isChecked5),
                      DatesTextFormField(IsChecked: cubit.isChecked6),
                      DatesTextFormField(IsChecked: cubit.isChecked7),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 60, child: Text('to \n (h)')),
                      DatesTextFormField(
                          IsChecked: cubit.isChecked1),
                      DatesTextFormField(IsChecked: cubit.isChecked2),
                      DatesTextFormField(IsChecked: cubit.isChecked3),
                      DatesTextFormField(IsChecked: cubit.isChecked4),
                      DatesTextFormField(IsChecked: cubit.isChecked5),
                      DatesTextFormField(IsChecked: cubit.isChecked6),
                      DatesTextFormField(IsChecked: cubit.isChecked7),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                          height: 60,
                          child: Text.rich(TextSpan(children: [
                            TextSpan(text: 'avg\n'),
                            TextSpan(text: 'session \n (min)')
                          ]))),
                      DatesTextFormField(IsChecked: cubit.isChecked1),
                      DatesTextFormField(IsChecked: cubit.isChecked2),
                      DatesTextFormField(IsChecked: cubit.isChecked3),
                      DatesTextFormField(IsChecked: cubit.isChecked4),
                      DatesTextFormField(IsChecked: cubit.isChecked5),
                      DatesTextFormField(IsChecked: cubit.isChecked6),
                      DatesTextFormField(IsChecked: cubit.isChecked7),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                          height: 60,
                          child: Text.rich(TextSpan(children: [
                            TextSpan(text: 'no of\n'),
                            TextSpan(text: 'session')
                          ]))),
                      DatesTextFormField(IsChecked: cubit.isChecked1),
                      DatesTextFormField(IsChecked: cubit.isChecked2),
                      DatesTextFormField(IsChecked: cubit.isChecked3),
                      DatesTextFormField(IsChecked: cubit.isChecked4),
                      DatesTextFormField(IsChecked: cubit.isChecked5),
                      DatesTextFormField(IsChecked: cubit.isChecked6),
                      DatesTextFormField(IsChecked: cubit.isChecked7),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
