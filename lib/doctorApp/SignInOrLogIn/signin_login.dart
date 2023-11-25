import 'package:flutter/material.dart';

import '../homeLayoutSignInScreen.dart';
import '../logInScreen/logInScreen.dart';

class signInLogIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.teal,
            backgroundImage: AssetImage("Images/imm.png"),
          ),
          const SizedBox(
            height: 20,),

          const Text(
            "HEALTH WISE", style: TextStyle(
              color: Colors.teal, fontWeight: FontWeight.w700, fontSize: 47),),
          const SizedBox(
            height: 20,),
          const Text(
              "Let's get started!",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25)),
          const SizedBox(
            height: 20,),
          const Text(
            "login to provide the aide to all people",
            style: TextStyle(
              fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w500),),
          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(30)
              ),

              child:
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => logInScreen(),
                    ),
                  );
                },
                height: 60,
                child: const Text("Login",
                  style: TextStyle(color: Colors.white, fontSize: 20),),

              ),
            ),
          ),
          const SizedBox(
              height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.teal),
                  borderRadius: BorderRadius.circular(30)
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => homeLayoutDoctorScareen(),
                    ),
                  );
                },
                height: 60,
                child:
                const Text(
                  "Sign up",
                  style: TextStyle(color: Colors.teal, fontSize: 20),),

              ),
            ),
          )
        ],
      ),
    );
  }
}

