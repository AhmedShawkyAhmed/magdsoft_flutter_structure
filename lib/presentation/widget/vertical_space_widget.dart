import 'package:flutter/material.dart';

class VerticalSpaceWidget extends StatelessWidget {
  final double height;
  const VerticalSpaceWidget(this.height,{Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}