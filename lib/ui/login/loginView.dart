import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/uiConstants.dart';
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

    return defaults.layout.basic(
        bodyContent: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        defaults.images.logoSmall(),
        defaults.layout.cards.basic(
            color: Color(defaults.colors.argb.greyBlueLight),
            content: Form(
                key: _viewModel.loginFormKey(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Flexible(flex: 1,child: Text("Hey Boys")),
                    // Flexible(flex: 1,child: TextFormField()),

                    // Obx(() =>
                    //
                    //
                    // )
                    defaults.widget.inputTexts.simple(
                        key: "",
                        initialValue: _viewModel.userName.value,
                        hint: "username",
                        onError: (value) => (value == null || value.isEmpty)
                            ? 'username cannot be empty'
                            : null,
                        onSaved: (value) =>
                            {_viewModel.handleUserNameChanges(value)}),

                    Padding(
                      padding:
                          EdgeInsets.only(top: defaults.dimens.padding.def),
                      child: defaults.widget.inputTexts.simple(
                          key: "",
                          initialValue: _viewModel.password.value,
                          hint: "password",
                          isHiddenField: true,
                          onError: (value) => (value == null || value.isEmpty)
                              ? 'password cannot be empty'
                              : null,
                          onSaved: (value) => {
                                // _email=value!
                                _viewModel.handlePasswordChanges(value)
                              }),
                    ),

                    Padding(
                        padding:
                            EdgeInsets.only(top: defaults.dimens.padding.def),
                        child: Obx(() => Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _viewModel.isProcessing.value
                                    ? defaults.widget.circularProgIndicator()
                                    : Spacer(
                                        flex: 1,
                                      ),
                                Spacer(
                                  flex: 1,
                                ),
                                defaults.widget.clickables.text.simple(
                                    labelText: "forgot your password?",
                                    onPressed: () {
                                      dev.log("clicked label text");
                                    })
                              ],
                            ))),

                    Padding(
                        padding:
                            EdgeInsets.only(top: defaults.dimens.padding.def),
                        child: defaults.widget.clickables.buttons.def(
                            labelText: "login",
                            endIcon: Icons.arrow_forward,
                            onPressed: () {
                              _viewModel.checkLogin();
                              // dev.log("clicked");
                              //     navigate().toHome(context: context);
                              //     _viewModel.updateResp("hey all");
                            })),

                    Padding(
                        padding:
                            EdgeInsets.only(top: defaults.dimens.padding.def),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                                flex: 1,
                                child: Divider(
                                  thickness: 1,
                                  color: Color(defaults.colors.argb.grey),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: defaults.dimens.padding.def,
                                  right: defaults.dimens.padding.def),
                              child:
                                  defaults.widget.label.simple(labelText: "OR"),
                            ),
                            Flexible(
                                flex: 1,
                                child: Divider(
                                  thickness: 1,
                                  color: Color(defaults.colors.argb.grey),
                                ))
                          ],
                        )),

                    // Obx(() =>
                    //     Text("observing value => ${_viewModel.resp}")
                    // ),

                    Padding(
                        padding:
                            EdgeInsets.only(top: defaults.dimens.padding.def),
                        child: defaults.widget.clickables.buttons.dark(
                            labelText: "sign up",
                            // endIcon: Icons.arrow_forward,
                            onPressed: () {
                              dev.log("clicked");
                            })),
                  ],
                ))

            // Expanded(child: Text("Hey Boys")),
            // Expanded(child: TextFormField()),
            //
            // Column(
            //   children: [
            //   const Text("Hey Boys"),
            //   // Expanded(flex: 1, child: TextFormField(),)
            //   // ConstrainedBox(constraints: BoxConstraints.expand(width: 100.0, height: 100.0),child: TextFormField(),)
            //     TextFormField()
            // ],)

            // Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min,children: [
            //
            //   const Text("Hey Boys"),
            //
            //   TextFormField(
            //     // initialValue: "123456",
            //     // decoration: InputDecoration(
            //     //     // border: OutlineInputBorder(),
            //     //     hintText: 'password'
            //     //     // hintText: hint_pass
            //     // ),
            //     textInputAction: TextInputAction.done,
            //     onFieldSubmitted: (term){
            //       // checkLogin();
            //     },
            //     obscureText: true,
            //     validator: (value){
            //       if(value == null || value.isEmpty){
            //         return 'value cannot be empty';
            //         // return err_nullVal;
            //       }
            //       return null;
            //     },
            //     onSaved: (value){
            //       // if(value != null)
            //         // _password = generateMd5(value);
            //     },
            //   )
            //
            //   //
            //   // const Text("Hey Boys2")
            // ],)

            // Column(children: [
            //
            //   defaults.widget.inputTexts.simple(labelText:"NIC"),
            //
            // ],)

            )
      ],
    )));

    // return SafeArea(child:
    //   defaults.layout.basic(bodyContent:
    //     Center(child: Text("hey login"))
    //   )
    // );
  }
}
