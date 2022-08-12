import 'package:flutter/material.dart';

import 'package:piton_assignment/core/const/string_const.dart';
import 'package:piton_assignment/core/style/style.dart';
import 'package:piton_assignment/features/auth/widgets/auth_header.dart';
import 'package:piton_assignment/features/auth/widgets/custom_button.dart';

import 'package:piton_assignment/features/auth/widgets/custom_text_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AuthHeader(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: horizontalPagePadding),
                  child: Column(
                    children: const [
                      SizedBox(height: 30),
                      Text(
                        StringConst.signUp,
                        style: styleAuthHeaderTxt,
                      ),
                      SizedBox(height: 15),
                      CustomTextForm(hintText: StringConst.name),
                      CustomTextForm(hintText: StringConst.surname),
                      CustomTextForm(
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icon(Icons.mail),
                          hintText: StringConst.mail),
                      CustomTextForm(
                        hintText: StringConst.phone,
                        prefixIcon: Icon(Icons.phone),
                      ),
                      CustomTextForm(
                          passwordMode: true,
                          prefixIcon: Icon(Icons.lock),
                          hintText: StringConst.password),
                      CustomTextForm(
                          passwordMode: true,
                          prefixIcon: Icon(Icons.lock),
                          hintText: StringConst.passwordAgain),
                      CustomButton(label: StringConst.signUp),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: bottomTextButtonPadding),
          child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                StringConst.backToLogin,
                style: styleBottomTextButton,
              )),
        )
      ],
    ));
  }
}
