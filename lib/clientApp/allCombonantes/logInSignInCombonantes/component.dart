
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  // default and when i want to change
  double width =double.infinity ,

  // what the change

  required  Function ()? function,
  required String text,
})=>
    Container(
      // send the valuet
      width:  width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.teal,
      ),
      child:   MaterialButton(
        onPressed: function ,
        child:Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
Widget defaultFormfield({
  // what the change
  required TextEditingController controller,
  required TextInputType type,
  String? Function(dynamic value)? onSubmit ,
  String? Function(dynamic value)? onChanged ,
  bool isPassword = false,
  required String? Function(dynamic value) validator,
  required String label,
  required IconData? prefix,
  IconData?  suffix,
  Function ()? suffixPressed, required isChecked,
  Function ()? prefixPressed
})
=>  TextFormField(


  controller: controller,
  keyboardType:  type,
  obscureText: isPassword,
  onChanged:  onChanged,
  onFieldSubmitted:  onSubmit,
  //  validator: send value donot do until send the key
  validator: validator ,
  decoration: InputDecoration(
    border:const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),

    ),
    labelText:  label,
    prefixIcon: prefix !=null ? IconButton(
      onPressed: prefixPressed,
      icon: Icon(
        prefix,
        color: Colors.teal,
      ),

    ) : null,
    suffixIcon:  suffix != null ? Padding(
      padding: const EdgeInsets.only(right: 7.0),
      child: IconButton
        (
          onPressed:suffixPressed ,
          icon :Icon(
            suffix,
            color: Colors.teal,
          )
      ),
    ) : null,

  ),
);