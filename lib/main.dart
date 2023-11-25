import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'clientApp/allCubites/calenderCubit/cubit.dart';
import 'clientApp/allCubites/doctorCubits/homeLayoutCubit/home_layout_cubit.dart';
import 'clientApp/allCubites/forgetPasswordCubit/cubit.dart';
import 'clientApp/allCubites/loginCubit/login_cubit.dart';
import 'clientApp/allCubites/nurseCubit/nurseDate_cubit.dart';
import 'clientApp/allCubites/profileCubit/createProfileCubite/create_profile_cubit.dart';
import 'clientApp/allCubites/profileCubit/profileCubit/profile_cubit.dart';
import 'clientApp/allCubites/signinAndVerificationCubit/signinCubit/signin_cubit.dart';
import 'clientApp/allCubites/signinAndVerificationCubit/verificationCubit/verification_cubit.dart';
import 'clientApp/splashScreen/logo.dart';
import 'doctorApp/allCubits/doctorDateCubit/cubit.dart';
import 'doctorApp/allCubits/signInCubit/sign_in_cubit.dart';
import 'doctorApp/allCubits/stepperCubit/stepper_cubit.dart';
import 'doctorApp/homeLayoutSignInScreen.dart';

void main() async {
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
  }
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();

  runApp(homeApp());
}

class homeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeLayoutCubit>(
          create: (context) => HomeLayoutCubit(),
        ),
        BlocProvider<CreateProfileCubit>(
          create: (context) => CreateProfileCubit(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider<calenderLayoutCubit>(
          create: (context) => calenderLayoutCubit(),
        ),
        BlocProvider<nurseDateCubit>(
          create: (context) => nurseDateCubit(),
        ),
        BlocProvider<ResetPasswordcubit>(
          create: (context) => ResetPasswordcubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<VerificationCubit>(
          create: (context) => VerificationCubit(),
        ),
        BlocProvider<SigninCubit>(
          create: (context) => SigninCubit(),
        ),
        BlocProvider<SignInCubit>(
          create: (context) => SignInCubit(),
        ),
        BlocProvider<StepperCubit>(
            create: (context) => StepperCubit(),
        ),
        BlocProvider<CheckBoxcubit>(
            create: (context) => CheckBoxcubit(),
        ),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: Size(360, 690),
        builder: (context, child) => MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          debugShowCheckedModeBanner: false,
          home: child,
        ),
        child: splashScreen(),
      ),
    );
  }
}
