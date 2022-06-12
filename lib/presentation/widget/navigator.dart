
import 'package:flutter/material.dart';

Future navigateAndFinish(context, widget)
{
  return  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (route) => false,
  );
}

Future navigateTo(context, widget)
{
  return  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}