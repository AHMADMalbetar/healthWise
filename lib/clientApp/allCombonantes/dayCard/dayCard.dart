import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget dayAndHisDay({
  Color? dayColor = Colors.white,
  Color? numDayColor = Colors.white,
  required String theDay,
  required String numOfDay,
  required int Index,
  Function()? inWork,
}) =>
    InkWell(
      onTap: inWork,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
          ),
          color: dayColor,
        ),
        width: 50.r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              theDay,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              numOfDay,
              style: TextStyle(
                color: numDayColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );

Widget theTimeInThisDay({
  required String eveningOrMorning,
  required String theTime,
  Color? timeColor = Colors.black,
  Color? cardColors = Colors.white,
  Function()? inWork,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
        ),
        color: cardColors,
      ),
      child: InkWell(
        onTap: inWork,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                eveningOrMorning,
                style: TextStyle(
                  color: timeColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                theTime,
                style: TextStyle(
                  color: timeColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
