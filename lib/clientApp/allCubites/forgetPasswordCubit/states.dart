abstract class ResetPasswordState {}

class ResetPasswordInitialstate extends ResetPasswordState {}

class ChangeTextFormFieldState extends ResetPasswordState {}

class PhonebuttonState extends ResetPasswordState {}

class Emailbuttonstate extends ResetPasswordState {}

class Emailvalidatesuccsesstate extends ResetPasswordState {}

class Emailvalidateerrorstate extends ResetPasswordState {
  final String error;

  Emailvalidateerrorstate(this.error);
}

class Phonevalidatesuccsesstate extends ResetPasswordState {}

class Phonevalidateerrorstate extends ResetPasswordState {}
class changeobscurestate extends ResetPasswordState {}