import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'doctorOrClient/doctorOrCLientScreen.dart';



class splashScreen extends StatefulWidget {
  @override
  State<splashScreen> createState() => _logoState();
}

class _logoState extends State<splashScreen> with SingleTickerProviderStateMixin {




  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);

    Future.delayed(const Duration(seconds: 2), ()
    {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => doctorOrClient(),
        ),
            (route) => false,
      );
      }
    );
  }


  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 300, width: 350, child: Image.asset("Images/imm.png")),
            const Text(
              "HEALTH WISE",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
