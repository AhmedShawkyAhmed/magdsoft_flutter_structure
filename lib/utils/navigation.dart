import 'package:flutter/material.dart';

goToScreen({
  required BuildContext context,
  required String routeName,
}) {
  Navigator.of(context).pushNamed(routeName);
}

goToScreenAndFinish({
  required BuildContext context,
  required String routeName,
  Object? arguments,
}) {
  Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
}
