import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:piton_assignment/core/const/string_const.dart';
import 'package:piton_assignment/core/style/style.dart';
import 'package:piton_assignment/features/auth/helper/validation_helper.dart';
import 'package:piton_assignment/features/auth/service/login_service.dart';
import 'package:piton_assignment/features/auth/view/signup/sign_up_notifier.dart';
import 'package:piton_assignment/features/auth/widgets/auth_header.dart';
import 'package:piton_assignment/features/auth/widgets/custom_button.dart';

import 'package:piton_assignment/features/auth/widgets/custom_text_form.dart';
import 'package:piton_assignment/features/products/views/products_home/products_home_view.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpNotifier>(
      create: (context) => SignUpNotifier(LoginService()),
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const AuthHeader(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPagePadding),
                    child: SignUpForm(),
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
      )),
    );
  }
}

class SignUpForm extends StatelessWidget {
  SignUpForm({
    Key? key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final ValidationHelper _validationHelper = ValidationHelper();
  final TextEditingController _passwordController = TextEditingController();
  final phoneFormatter = MaskTextInputFormatter(
      mask: '+90(###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            StringConst.signUp,
            style: styleAuthHeaderTxt,
          ),
          const SizedBox(height: 15),
          CustomTextForm(
            hintText: StringConst.name,
            validator: _validationHelper.isEmpty,
            onSaved: (value) {
              context.read<SignUpNotifier>().userName = value!;
            },
          ),
          CustomTextForm(
            hintText: StringConst.surname,
            validator: _validationHelper.isEmpty,
            onSaved: (value) {
              context.read<SignUpNotifier>().userName += " $value";
            },
          ),
          CustomTextForm(
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.mail),
            hintText: StringConst.mail,
            validator: _validationHelper.validateMail,
            onSaved: (value) {
              context.read<SignUpNotifier>().mail = value!;
            },
          ),
          CustomTextForm(
            keyboardType: TextInputType.phone,
            hintText: StringConst.phone,
            prefixIcon: const Icon(Icons.phone),
            inputFormatters: [phoneFormatter],
            validator: (value) {
              return _validationHelper
                  .validatePhone(phoneFormatter.getUnmaskedText());
            },
          ),
          CustomTextForm(
            controller: _passwordController,
            passwordMode: true,
            prefixIcon: const Icon(Icons.lock),
            hintText: StringConst.password,
            validator: _validationHelper.validatePassword,
            onSaved: (value) {
              context.read<SignUpNotifier>().password = value!;
            },
          ),
          CustomTextForm(
            passwordMode: true,
            prefixIcon: const Icon(Icons.lock),
            hintText: StringConst.passwordAgain,
            validator: (confirmPassword) {
              return _validationHelper.conirmPassword(
                  _passwordController.text, confirmPassword);
            },
          ),
          CustomButton(
            label: StringConst.signUp,
            onFuture: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                 bool success = await context.read<SignUpNotifier>().signUp();
              if (success) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductsHomeView()),
                    (route) => false);
              }else{
                Fluttertoast.showToast(msg: StringConst.errMsg);
              }
              }
             
            },
          ),
        ],
      ),
    );
  }
}
