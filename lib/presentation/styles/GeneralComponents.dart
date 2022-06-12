import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

Widget MakeTextFormField({
  required TextEditingController controller,
  required String labelText,
  required FormFieldValidator validator,
  ValueChanged? OnFieldSubmitted,
  ValueChanged? OnChanged,
  required IconData iconData,
  required TextInputType textInputType,
  bool ObscureText = false,
  IconData? Iconsuffix,
  VoidCallback? suffixPressed,
  VoidCallback? onTap,
}) =>
    TextFormField(
      cursorColor: AppColor.Blue,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          iconData,
        ),
        suffixIcon: Iconsuffix != null
            ? IconButton(
                icon: Icon(Iconsuffix),
                onPressed: suffixPressed,
              )
            : null,
      ),
      keyboardType: textInputType,
      onFieldSubmitted: OnFieldSubmitted,
      onChanged: OnChanged,
      validator: validator,
      obscureText: ObscureText,
      onTap: onTap,
    );

Widget MakeDafultButton({
  double width = 150,
  Color color = AppColor.Blue,
  required VoidCallback onPressed,
  bool isuppuer = true,
  double circularRadius = 0.0,
  required String text,
  Color? TextColor,
}) =>
    Container(
        height: 40,
        width: width,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(circularRadius),
            color: color,
          ),
          child: MaterialButton(
            onPressed: onPressed,
            child: Text(
              isuppuer ? text.toUpperCase() : text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color:TextColor==null?Colors.white:TextColor ),
            ),
          ),
        ));
void Toasts({required String Msg,})=>Fluttertoast.showToast(
    msg:Msg,
    toastLength:Toast.LENGTH_LONG ,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: AppColor.Blue,
    textColor: Colors.white,
    fontSize: 16.0
);