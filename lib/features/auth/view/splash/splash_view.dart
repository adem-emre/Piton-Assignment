import 'package:flutter/material.dart';
import 'package:piton_assignment/core/auth/auth_manager.dart';
import 'package:piton_assignment/core/const/asset_const.dart';
import 'package:piton_assignment/features/auth/helper/shared_helper.dart';
import 'package:piton_assignment/features/auth/view/login/login_view.dart';
import 'package:piton_assignment/features/products/views/products_home/products_home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future navigateUser() async {
    final sharedHelper = SharedHelper();
    final token = await sharedHelper.getToken();
    if (token != null) {
      AuthManager.token = token;
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const ProductsHomeView()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginView()));
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () async {
      await navigateUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(AssetConst.imgAppLogo),
      ),
    );
  }
}
