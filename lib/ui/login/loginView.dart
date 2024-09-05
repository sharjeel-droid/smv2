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
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                "Login To Your Account",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF003366)),
              ),
              const SizedBox(height: 24),
              Form(
                key: _viewModel.loginFormKey(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Username",
                        prefixIcon: Icon(Icons.person),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) =>
                          {_viewModel.handleUserNameChanges(value)},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      obscureText: _obscureText,
                      onSaved: (value) =>
                          {_viewModel.handlePasswordChanges(value)},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(
                          value: false, // Replace with actual logic
                          onChanged: (bool? value) {
                            // Handle change
                          },
                        ),
                        const Text(
                          "Remember me",
                          style: TextStyle(color: Color(0xFF003366)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Color(0xFFFFD700),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        _viewModel.checkLogin();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign In",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        // Handle "Forgot your password?"
                      },
                      child: const Text(
                        "Forgot your password?",
                        style: TextStyle(color: Color(0xFFFFD700)),
                      ),
                    ),

                    const SizedBox(height: 24),
                    const Center(
                      child: Text(
                        "OR",
                        style: TextStyle(
                            color: Color(0xFF003366),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Continue with",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF003366),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildColorfulSocialIcon(
                          icon: FontAwesomeIcons.google,
                          color: const Color(0xFFDB4437),
                          onPressed: () {
                            // Handle Google login
                          },
                        ),
                        const SizedBox(width: 16),
                        _buildColorfulSocialIcon(
                          icon: FontAwesomeIcons.facebookF,
                          color: const Color(0xFF4267B2),
                          onPressed: () {
                            // Handle Facebook login
                          },
                        ),
                        const SizedBox(width: 16),
                        _buildColorfulSocialIcon(
                          icon: FontAwesomeIcons.apple,
                          color: Colors.black,
                          onPressed: () {
                            // Handle Apple login
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Color(0xff003366)),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle "Sign up"
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(color: Color(0xFFFFD700)),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                        height: 40), // Optional: to adjust the bottom padding
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorfulSocialIcon({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 32,
          color: color,
        ),
      ),
    );
  }

  // deviceConfig.screenType.isWeb()
  // ?
  // viewForMobile()
  //
  //     :
  //       deviceConfig.screenType.isTablet(context)
  // ?
  // viewForTablet()
  //     :
  //       viewForMobile()

  Widget viewForTablet(){
    return Text("tablet");
  }

  Widget viewForMobile(){
    return Column(
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
    );
  }
}
