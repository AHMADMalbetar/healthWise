part of 'stepper_cubit.dart';

@immutable
abstract class StepperState {}

class StepperInitial extends StepperState {}

class changeselectIndexState extends StepperState{}

class increaseSteps extends StepperState{}

class decreaseSteps extends StepperState{}
