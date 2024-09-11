import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/ui/splash/splashViewModel.dart';
import 'package:SMV2/utils/deviceConfigHandler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView(/*{super.key}*/);

  @override
  Widget build(BuildContext context) {
    deviceConfig.screen.setToFull();

    final SplashViewModel _viewModel = Get.find<SplashViewModel>();
    _viewModel.checkSessionAndNavigate();

    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // colors: [Colors.purple, Colors.red],
            colors: [defaults.colors.Primary, defaults.colors.PrimaryLight],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(children: [
          Center(
            child: defaults.images.logoMain(),
          ),
          Positioned(
            bottom: 30.0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => _viewModel.isProcessing.value
                    ? defaults.widget
                        .circularProgIndicator(color: Color(0xff003366))
                    : defaults.widget
                        .circularProgIndicator(color: Color(0xff003366))),
                const SizedBox(height: 10), // Spacing between loader and text
                defaults.widget.label.small(
                  labelText: "PROCESSING. PLEASE WAIT",
                  isBold: true,
                  textColor: Color(0xFF003366),
                ),
              ],
            ),
          )
        ]));

    // return const layouts().fullScreen();
  }
}






/*class SplashView extends StatefulWidget {
  const SplashView({Key? key, required this.title}) : super(key: key);
  // const SplashView({super.key});

  final String title;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>*//* with WidgetsBindingObserver*//*
{
  // String _appLifeCycleState = "Resumed";

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this);
    navigateToLogin();
  }



  navigateToLogin() async{
    // deviceConfig.screen.setToNormal();
    await Future.delayed(Duration(milliseconds: 3000), (){});
    navigate().toLogin(*//*context: context*//*);
  }


  @override
  Widget build(BuildContext context) {

    deviceConfig.screen.setToFull();

    return
      defaults
          .layout
          .basic
        (
        bgColor: defaults.colors.Primary,
        bodyContent:
            Stack(
              children: [

                Center(
                  child: defaults.images.logoMain(),
                ),
                Positioned(
                  // top: 10.0,
                  // right: 10.0,
                  bottom: 10.0,
                  left: 10.0,
                  child: Row(children: [
                    defaults.widget.circularProgIndicator(),
                    Padding(padding: EdgeInsets.only(left: 10),
                    child: defaults.widget.label.small(labelText: "processing data. plz wait!", isBold:true),)

                  ],)
                )

              ],
            )

    );

    // return const layouts().fullScreen();
  }

  *//*@override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    dev.log("state -> ${state.name}");
    setState(() {
      switch(state){
        case AppLifecycleState.resumed:
          _appLifeCycleState = 'Resumed';
          break;
        case AppLifecycleState.inactive:
          _appLifeCycleState = 'Inactive';
          break;
        case AppLifecycleState.paused:
          _appLifeCycleState = 'Paused';
          deviceConfig.screen.setToNormal();
          break;
        case AppLifecycleState.detached:
          _appLifeCycleState = 'Detached';
          break;
      }
    });

    super.didChangeAppLifecycleState(state);
  }*//*
}*/
