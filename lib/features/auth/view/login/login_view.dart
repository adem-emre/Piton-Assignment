import 'package:flutter/material.dart';

import 'package:piton_assignment/core/const/string_const.dart';
import 'package:piton_assignment/core/style/style.dart';
import 'package:piton_assignment/features/auth/view/signup/sign_up_view.dart';
import 'package:piton_assignment/features/auth/widgets/auth_header.dart';
import 'package:piton_assignment/features/auth/widgets/custom_button.dart';

import 'package:piton_assignment/features/auth/widgets/custom_text_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool rememberMeCheckBox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const AuthHeader(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  StringConst.login,
                  style: styleAuthHeaderTxt,
                ),
                const SizedBox(height: 15),
                const CustomTextForm(
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.mail),
                    hintText: StringConst.mail),
                const CustomTextForm(
                    passwordMode: true,
                    prefixIcon: Icon(Icons.lock),
                    hintText: StringConst.password),
                const CustomButton(label: StringConst.login),
                CheckboxListTile(
                    activeColor: Colors.black,
                    title: const Text(StringConst.rememberMe),
                    value: rememberMeCheckBox,
                    onChanged: (value) {
                      rememberMeCheckBox = value!;
                      setState(() {});
                    }),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: bottomTextButtonPadding),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpView()));
                      },
                      child: const Text(
                        StringConst.signUp,
                        style: styleBottomTextButton,
                      )),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
