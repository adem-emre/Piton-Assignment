import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:piton_assignment/core/const/string_const.dart';
import 'package:piton_assignment/core/style/style.dart';
import 'package:piton_assignment/features/auth/helper/shared_helper.dart';
import 'package:piton_assignment/features/auth/helper/validation_helper.dart';
import 'package:piton_assignment/features/auth/service/login_service.dart';
import 'package:piton_assignment/features/auth/view/login/login_notifier.dart';
import 'package:piton_assignment/features/auth/view/signup/sign_up_view.dart';
import 'package:piton_assignment/features/auth/widgets/auth_header.dart';
import 'package:piton_assignment/features/auth/widgets/custom_button.dart';

import 'package:piton_assignment/features/auth/widgets/custom_text_form.dart';
import 'package:piton_assignment/features/products/views/products_home/products_home_view.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _validationHelper = ValidationHelper();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginNotifier(LoginService(), SharedHelper()),
      child: Builder(builder: (context) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                const AuthHeader(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPagePadding),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          const Text(
                            StringConst.login,
                            style: styleAuthHeaderTxt,
                          ),
                          const SizedBox(height: 15),
                          CustomTextForm(
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: const Icon(Icons.mail),
                            hintText: StringConst.mail,
                            validator: _validationHelper.validateMail,
                            onSaved: (value) {
                              context.read<LoginNotifier>().mail = value!;
                            },
                          ),
                          CustomTextForm(
                            passwordMode: true,
                            prefixIcon: const Icon(Icons.lock),
                            hintText: StringConst.password,
                            validator: _validationHelper.validatePassword,
                            onSaved: (value) {
                              context.read<LoginNotifier>().password = value!;
                            },
                          ),
                          CustomButton(
                            label: StringConst.login,
                            onFuture: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                bool success =
                                    await context.read<LoginNotifier>().login();
                                if (success) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ProductsHomeView()));
                                } else {
                                  Fluttertoast.showToast(
                                      msg: StringConst.errMsg);
                                }
                              }
                            },
                          ),
                          CheckboxListTile(
                              activeColor: Colors.black,
                              title: const Text(StringConst.rememberMe),
                              value: context
                                  .read<LoginNotifier>()
                                  .rememberMeCheckBox,
                              onChanged: (value) {
                                context
                                    .read<LoginNotifier>()
                                    .rememberMeCheckBox = value!;
                                setState(() {});
                              }),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: bottomTextButtonPadding),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpView()));
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
                ),
              ],
            ));
      }),
    );
  }
}
