import 'package:flutter/material.dart';

goToScreen({
  required BuildContext context,
  required String routeName,
}){
  Navigator.of(context).pushNamed(routeName);
}

goToScreenAndFinish({
  required BuildContext context,
  required String routeName,
}){
  Navigator.of(context).pushReplacementNamed(routeName);
}