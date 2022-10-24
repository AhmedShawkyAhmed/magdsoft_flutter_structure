import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/my_button.dart';

import '../../../constants/end_points.dart';
import '../../styles/colors.dart';
import '../../widget/responsive_spaces.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: Center(
          child: Text(
              'User Data',
            style: TextStyle(
              fontSize: responsiveValue(context, 20),
              color: AppColor.white,
            ),
          ),
        ),

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveValue(
            context,
            40,
          ),
          vertical: responsiveValue(
            context,
            80,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 11,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name : mohammed',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: responsiveValue(context, 16),
                        color: AppColor.mainColor,
                      ),
                    ),
                    space10Vertical(context),
                    Text('Email : mohammed.gallya39@gmail.com',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: responsiveValue(context, 16),
                        color: AppColor.mainColor,
                      ),
                    ),
                    space10Vertical(context),
                    Text('Phone : 01092479352',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: responsiveValue(context, 16),
                        color: AppColor.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: MyButton(
                    isLoading: false,
                    colorButton: AppColor.red,
                    width: responsiveValue(context, 150),
                    onPressed: ()
                    {

                    },
                    text: 'Logout'
                )
            )

          ],
        ),
      ),
    );
  }
}
