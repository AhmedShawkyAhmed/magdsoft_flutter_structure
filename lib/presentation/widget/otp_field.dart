import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class OtpField extends StatelessWidget {
  final List<String> code;
  const OtpField({Key? key, required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.50),
            offset: Offset(0.4.w, 0.5.h),
            blurRadius: 10),
      ], color: AppColor.white, borderRadius: BorderRadius.circular(1.5.h)),
      width: 16.27.w,
      height: 8.5.h,
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: const InputDecoration(
              focusedBorder: InputBorder.none, border: InputBorder.none),
          onChanged: (value) {
            code.add(value);
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
