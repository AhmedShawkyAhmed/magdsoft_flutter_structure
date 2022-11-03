import 'package:flutter/material.dart';

class HorizontalSpaceWidget extends StatelessWidget {
  final double width;
  const HorizontalSpaceWidget(this.width,{Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}