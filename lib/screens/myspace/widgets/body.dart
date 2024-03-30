import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotstar/screens/myspace/widgets/button.dart';
import 'package:hotstar/utils/colors.dart';
import 'package:hotstar/utils/icons.dart';
import 'package:hotstar/utils/images.dart';
import 'package:hotstar/utils/styles.dart';

class BodyMySpace extends StatelessWidget {
  const BodyMySpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 105, height: 55, child: Image.asset(pIconBg)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.52,
            ),
            Icon(
              Icons.settings,
              color: lwhite,
            ),
            Flexible(
              // flex: 3,
              child: Text(
                " Help & Settings",
                style: TextStyle(color: white),
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.75,
          child: Image.asset(gadgets),
        ),
        Text(
          "Login to Disney + Hotstar",
          style: MyTextStyles.headingStyle,
        ),
        Text(
          "Start watching from where you left off, personalise for kids and more",
          style: MyTextStyles.subheadingStyle,
        ),
        Center(
          child: MyButton(
            text: "Log In",
            color: color1,
            textColor: white,
            onPressed: () {
              // ignore: avoid_print
              print('Login clicked ');
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Having trouble logging in?', style: MyTextStyles.loginStyle1),
            Text(' Get Help', style: TextStyle(color: gethelp))
          ],
        )
      ],
    );
  }
}
