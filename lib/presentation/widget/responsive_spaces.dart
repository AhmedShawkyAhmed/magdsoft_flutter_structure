import 'package:flutter/cupertino.dart';

double responsiveValue(BuildContext context, double value) =>
    MediaQuery
        .of(context)
        .size
        .width * (value / 375.0);

space2Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 2.0),
    );

space3Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 3.0),
    );

space4Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 4.0),
    );

space5Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 5.0),
    );

space8Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 8.0),
    );

space10Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 10.0),
    );

space16Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 16.0),
    );

space20Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 20.0),
    );

space30Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 30.0),
    );

space40Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 40.0),
    );

space50Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 50.0),
    );

space60Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 60.0),
    );

space70Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 70.0),
    );

space80Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 80.0),
    );

space90Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 90.0),
    );

space100Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 100.0),
    );

space3Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 3.0),
    );

space4Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 4.0),
    );

space5Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 5.0),
    );

space8Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 8.0),
    );

space10Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 10.0),
    );

space12Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 12.0),
    );

space14Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 14.0),
    );

space15Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 15.0),
    );

space16Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 16.0),
    );

space20Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 20.0),
    );

space30Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 30.0),
    );

space40Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 40.0),
    );

space50Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 50.0),
    );

space60Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 60.0),
    );

space70Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 70.0),
    );

space80Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 80.0),
    );

space90Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 90.0),
    );

space100Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 100.0),
    );