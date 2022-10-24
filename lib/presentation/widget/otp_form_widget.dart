import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/otp_field.dart';
import 'package:sizer/sizer.dart';

class OtpForm extends StatelessWidget {
 
   final List<String> code;
  const OtpForm({Key? key,required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.end,
      runAlignment: WrapAlignment.end,
      textDirection: TextDirection.ltr,
      spacing: 4.4.w,
      children: List.generate(4, (index) => OtpField(code: code,)),
    );
  }
}
