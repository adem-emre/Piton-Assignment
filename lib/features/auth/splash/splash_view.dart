

import 'package:flutter/material.dart';
import 'package:piton_assignment/core/const/asset_const.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

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