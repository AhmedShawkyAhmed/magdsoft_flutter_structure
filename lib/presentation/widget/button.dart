import 'package:flutter/material.dart';

import '../styles/colors.dart';

Widget defaultButton({void Function()? onPreesed, String? text,Color? color}) => Container(
      width: 152,
      height: 61,
      decoration: BoxDecoration(
        color: color ?? AppColor.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: onPreesed,
        child: Text(
          text!,
          style: const TextStyle(fontSize: 20, color: AppColor.white),
        ),
      ),
    );
