import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'allCubits/stepperCubit/stepper_cubit.dart';
import 'doctorDate/doctorDateScreen.dart';
import 'doctorLikeAperson/doctorInfoLikeSikk.dart';
import 'doctorServices/doctorServices.dart';
import 'signInScreen/signInScreen.dart';

class homeLayoutDoctorScareen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StepperCubit, StepperState>(
      listener: (context, state) {},
      builder: (context, state) {
        var Cubit = StepperCubit.get(context);
        int currentStep = Cubit.selectIndex;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Sign In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.teal,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_sharp),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Stepper(
              steps: steps,
            type: StepperType.vertical,
            currentStep: currentStep,
            onStepTapped: (int index){
                Cubit.changeSelectedIndex(index);
            },
            onStepContinue: (){
                if(currentStep < 3)Cubit.increaseStep();
            },
            onStepCancel: (){
                if(currentStep > 0)Cubit.decreaseStep();
            },
          ),
        );
      },
    );
  }
}

List<Step> steps = [
  Step(
    title: const Text('First Step'),
    content: doctorSignInScreen(),
  ), Step(
    title: const Text('Second Step'),
    content: doctorInfoLikeSikk(),
  ), Step(
    title: const Text('Third Step'),
    content: doctorServices(),
  ), const Step(
    title:  Text('fourth Step'),
    content: DoctorDate(),
  ),
];