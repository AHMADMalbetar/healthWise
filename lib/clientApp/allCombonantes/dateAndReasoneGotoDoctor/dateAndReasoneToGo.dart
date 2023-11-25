import 'package:flutter/material.dart';

import '../../classes/doctorClass.dart';
import '../../constant/colours.dart';


Widget dateAndREasoneToGo({
  required String typText,
  required IconData iconKind,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          typText,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Write your pain or select it',
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              prefixIcon: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.edit_note,color: Colors.teal,),
              ),
            ),
          ),
        ),
      ],
    );

Widget prisOfOneThing() => Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      'Consultation',
      style: TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 14),
    ),
    const Row(
      children: [
        Text(
          '25000',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'SYP',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    ),
  ],
);

Widget totalPrise() => const Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      'Total',
      style: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    Row(
      children: [
        Text(
          '25000',
          style: TextStyle(
            color: Colors.teal,
            fontSize: 18,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'SYP',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    ),
  ],
);



var month = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];
List<String> timeWork = [
  '6:00',
  '6:30',
  '7:00',
  '7:30',
  '8:00',
  '8:30',
  '9:00',
  '9:30',
  '10:00',
];

Widget date({
  required String typText,
  required IconData iconKind,
  int index = 0,
  int index1 = 0
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        typText,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.calendar_month,color: Colors.teal,),
          const SizedBox(
            width: 10,
          ),
          Text(
            '${days[index1 % 7]}, ${month[DateTime.now().month - 1]} ${index1 % 30 + 1}, ${DateTime.now().year} | ${doctorTimeWork[index % 9]}  pm',
            style: TextStyle(
              color: mainTitleColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ],
  );
}


