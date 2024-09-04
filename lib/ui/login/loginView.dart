import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/ui/login/loginViewForMobile.dart';
import 'package:SMV2/ui/login/loginViewForTab.dart';
import 'package:SMV2/ui/login/loginViewModel.dart';
import 'package:SMV2/utils/deviceConfigHandler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;

import 'package:provider/provider.dart';

// class LoginView extends StatefulWidget {
//   // const LoginView({super.key});
//
//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final LoginViewModel _viewModel = Get.find<LoginViewModel>();
  // final _formKey_login = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    deviceConfig.screen.setToNormal();

    // String respo = Provider.of<LoginViewModel>(context).fetchTest();

    var _email = "";

    // var isTab = deviceConfig.screenType.isTablet(context);
    dev.log("type -> ${deviceConfig.screenType.type(context)}");
    dev.log("isTablet -> ${deviceConfig.screenType.isTablet(context)}");
    dev.log("isMobile -> ${deviceConfig.screenType.isMobile(context)}");
    dev.log("isWeb -> ${deviceConfig.screenType.isWeb()}");

    return defaults.layout.basic(
        bodyContent:
        deviceConfig.screenType.isTablet(context)
      ?
        LoginViewForTab(_viewModel)
            :
        LoginViewForMobile(_viewModel)
    );

    // return SafeArea(child:
    //   defaults.layout.basic(bodyContent:
    //     Center(child: Text("hey login"))
    //   )
    // );
  }


}
