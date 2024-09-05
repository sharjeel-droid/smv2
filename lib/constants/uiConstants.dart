import 'package:SMV2/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class defaults {
  //colors
  static const colors = const _color();
  //font
  static const font = const _font();
  //dimensions
  static const dimens = const _dimens();
  //ThemeData
  static var themeData = ThemeData(
    primarySwatch: colors.Primary.toMaterialColor(),
    fontFamily: font.roboto,
    /*textTheme: TextTheme(
      bodyText1: GoogleFonts.montserrat(fontSize: fontSize.body, fontWeight: FontWeight.normal)
    )*/
  );
  //layouts
  static const layout = _layouts();
  //widgets
  static const widget = _widgets();
  //images
  static const images = _images();
}

//Color
class _color {
  const _color();

  _argb get argb => _argb();

  _grads get gradients => _grads();

  Color get Primary => Color(0xFFFFD700);
  Color get PrimaryLight => Color(0xFFFFE36E);
  Color get PrimaryDark => Color(argb.yellowDark);
  Color get PrimaryBlue => Color(0xFF003366);
  Color get Accent => Color(argb.yellowLight);
  Color get NavBar => PrimaryDark;
  Color get WindowBg => Color(argb.white);
  Color get PrimaryText => Color(0xFF003366);
  Color get SecondaryText => Color(argb.white);
}

class _argb {
  const _argb();
  int get yellow => 0XFFFFCA28;
  int get yellowXLight => 0XFFFDD835;
  int get yellowLight => 0XFFFFCC80;
  int get yellowDark => 0XFFFFB300;
  int get black => 0XFF333333;
  int get red => 0XFFD32F2F;
  int get red30 => 0X4DD32F2F;
  int get white => 0XFFFFFFFF;
  int get white10 => 0X1AFFFFFF;
  int get white20 => 0X33FFFFFF;
  int get grey => 0XFFBDBDBD;
  int get greyBlueLight => 0XFFECEFF1;
  int get green => 0XFF4CAF50;
  int get greenLight => 0XFF81C784;
}

class _grads {
  const _grads();

  LinearGradient get bottomToTop_blackToOpaque => LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(defaults.colors.argb.black),
            Colors.transparent,
          ]);

  LinearGradient get bottomToTop_whiteToOpaque => LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(defaults.colors.argb.white),
            Colors.transparent,
            Colors.transparent,
          ]);

  // int get yellowXLight => 0XFFFDD835;
  // int get yellowLight => 0XFFFFCC80;
  // int get yellowDark => 0XFFFFB300;
  // int get black => 0XFF333333;
  // int get red => 0XFFD32F2F;
  // int get red30 => 0X4DD32F2F;
  // int get white => 0XFFFFFFFF;
  // int get grey => 0XFFBDBDBD;
  // int get greyBlueLight => 0XFFECEFF1;
  // int get green => 0XFF4CAF50;
  // int get greenLight => 0XFF81C784;
}

//--//
//Fonts
class _font {
  const _font();
  _fontSize get size => _fontSize();

  //fonts
  // get monsterrat => GoogleFonts.montserrat().fontFamily;
  get roboto => GoogleFonts.roboto().fontFamily;
  // static var fontFamily = font.fontFamily;
}

class _fontSize {
  const _fontSize();

  get micro => 10.0;
  get tiny => 12.0;
  get small => 16.0;
  get body => 20.0;
  get head => 26.0;
  get large => 32.0;
}

//--//
//Dimens
class _dimens {
  const _dimens();

  _paddings get padding => _paddings();
  _radius get cornerRadius => _radius();
}

class _paddings {
  const _paddings();

  get none => 0.0;
  get tiny => 4.0;
  get def => 8.0;
  get x2 => 16.0;
  get x3 => 24.0;
  get x4 => 32.0;
}

class _radius {
  const _radius();

  get none => 0.0;
  get tiny => 4.0;
  get def => 12.0;
  get x2 => 16.0;
  get x3 => 24.0;
  get x4 => 32.0;
}

//--//
//Layouts
class _layouts {
  const _layouts();
  get cards => _cards();

  // fullScreen(
  // {
  //   Widget? bodyContent,
  //   Color? bgColor
  // })
  // {
  //
  //   return
  //     _fullScreen()
  //       .compose(
  //         bgColor??defaults.colors.PrimaryDark,
  //         bodyContent: bodyContent??defaults.widget.label.simple()
  //    );
  // }

  withNavDrawer({
    String? title,
    required Widget bodyContent,
    Color? bgColor,
    List<Widget>? navigationDrawerItems,
    int? currentSelection,
  }) {
    return _layoutWithNavDrawer().compose(
      title: title ?? "",
      bgColor: bgColor ?? defaults.colors.Primary,
      bodyContent: bodyContent,
      navigationDrawerItems: navigationDrawerItems,
      currentSelection: currentSelection,
      // onAboutTap: onAboutTap,
      // onSettingsTap: onSettingsTap,
      // onLogoutTap: onLogoutTap
    );
  }

  basic({required Widget bodyContent, Color? bgColor}) {
    return _basic().compose(
        bgColor: bgColor ?? defaults.colors.Primary, bodyContent: bodyContent);
  }
}

// class _fullScreen{
//   _fullScreen(){
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
//   }
//
//   compose(Color bgColor, {required Widget bodyContent}/*{required Function() body}*/){
//
//     return Scaffold(
//       backgroundColor: bgColor,
//       body: bodyContent
//       // Center(
//       //   child: Column(
//       //     mainAxisSize: MainAxisSize.max,
//       //     mainAxisAlignment: MainAxisAlignment.center,
//       //     crossAxisAlignment: CrossAxisAlignment.center,
//       //     children: [
//       //       bodyContent
//       //       // body()
//       //     ],
//       //   ),
//       // ),
//     );
//
//
//     /*return Text("helloWorld",
//       style: TextStyle(
//           fontSize: fontSize.small,
//           fontWeight: FontWeight.bold
//       ));*/
//   }
//
// }
class _basic {
  _basic();

  compose(
      {required Color bgColor,
      required Widget bodyContent} /*{required Function() body}*/) {
    return Scaffold(backgroundColor: bgColor, body: bodyContent);
  }
}

class _layoutWithNavDrawer {
  _layoutWithNavDrawer();

  compose(
      {required String title,
      required Color bgColor,
      List<Widget>? navigationDrawerItems,
      int? currentSelection,
      required Widget bodyContent} /*{required Function() body}*/) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: _navDrawers().light(
            navTreeList: navigationDrawerItems,
            currentSelection: currentSelection),
        body: bodyContent);

    return Scaffold(backgroundColor: bgColor, body: bodyContent);
  }
}

class _cards {
  const _cards();

  basic({Color? color, required Widget content}) {
    return _cardBasic().compose(color: color ?? Colors.white, content: content);
  }
}

class _cardBasic {
  const _cardBasic();
  compose({required Color color, required Widget content}) {
    return Card(
      color: color,
      margin: EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(defaults.dimens.cornerRadius.def)),
      child: Padding(
          padding: EdgeInsets.all(defaults.dimens.padding.def), child: content
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     content
          //   ],
          // )
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //
          //   content
          //
          // ],),
          ),
    );
  }
}

//--//
//widgets
class _widgets {
  const _widgets();

  circularProgIndicator({Color? color}) {
    return _circularProgressIndicator()
        .compose(color: color ?? _argb().black.toColor());
  }

  emptySpace15dp() {
    double size = 15.0;
    return SizedBox(
      height: size,
      width: size,
    );
  }

  _labels get label => _labels();
  _inputTexts get inputTexts => _inputTexts();
  _clickables get clickables => _clickables();
  // _navDrawers get navigationDrawer => _navDrawers();
  /*labelSimple({String? labelText}){
    return _labelSimple().compose(text: labelText??"Sample Text for SmartVan V2");
  }*/
  imageSVG({String? imagePath, double? width, double? height}) {
    return _imageSvg().compose(imagePath: imagePath ?? "", w: width, h: height);
  }

  //dashboard flassh cards
  flashCard(
      {Color? color, Color? textColor, String? title, required String value}) {
    return _cardFlash().compose(
        color: color ?? Color(defaults.colors.argb.black),
        textColor: textColor ?? Colors.white,
        title: title ?? "",
        value: value);
  }

  flashCardActionable(
      {Color? color,
      Color? textColor,
      String? title,
      required String value,
      Function()? onButtonPressed,
      String? buttonText,
      Color? buttonColor,
      Widget? content = null}) {
    return _cardFlash().compose(
        color: color ?? Color(defaults.colors.argb.black),
        textColor: textColor ?? Colors.white,
        title: title ?? "",
        value: value,
        onButtonPressed: onButtonPressed,
        buttonText: buttonText,
        buttonColor: buttonColor,
        content: content);
  }
}

class _cardFlash {
  const _cardFlash();
  compose(
      {required Color color,
      required Color textColor,
      required String title,
      required String value,
      Function()? onButtonPressed = null,
      String? buttonText,
      Color? buttonColor,
      Widget? content}) {
    bool showAction = onButtonPressed != null;

    return Card(
      color: color,
      margin: EdgeInsets.all(defaults.dimens.padding.def),
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(defaults.dimens.cornerRadius.def)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (content != null) Center(child: content),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: defaults.dimens.padding.x2,
                  bottom: defaults.dimens.padding.x2),
              child: Text(
                value,
                style: TextStyle(
                    color: textColor,
                    fontSize: defaults.font.size.body,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Card(
            color: Color(defaults.colors.argb.white20),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(defaults.dimens.cornerRadius.def),
            ),
            child: Padding(
              padding: EdgeInsets.all(defaults.dimens.padding.def),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(
                        12), // Adjust the radius as needed
                    color:
                        Color(0xFF8F8F8F), // Background color for the Material
                    child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Text(
                        title.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: defaults.font.size.small,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Spacing between text and button
                  if (showAction)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: onButtonPressed,
                        child: Text(
                          buttonText ?? 'Button',
                          style: TextStyle(
                            color: buttonColor ?? Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: defaults.font.size.small,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          /*Container(
          color: Color(defaults.colors.argb.grey),
          child:
          Row(mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title)
          ],)
        )*/

          // Expanded(child: Text(title, style: TextStyle(color: textColor, backgroundColor: Color(defaults.colors.argb.grey)),)),
          // Row(mainAxisAlignment: MainAxisAlignment.center,
          //   mainAxisSize: MainAxisSize.max,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Flexible(child: Text(title, style: TextStyle(color: textColor, backgroundColor: Color(defaults.colors.argb.grey)),),
          //       flex: 1,),
          // ],)
        ],
      ),
    );
  }
}

class _circularProgressIndicator {
  const _circularProgressIndicator();
  compose({required Color color}) {
    var size = 15.0;
    var strokeWidth = 2.0;
    return SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: strokeWidth,
        ));
  }
}

class _labels {
  const _labels();
  simple({String? labelText, Color? textColor, bool? isBold}) {
    return _labelSimple().compose(
        text: labelText ?? "Sample Text for SmartVan V2",
        textColor: textColor ?? defaults.colors.PrimaryText,
        isBold: isBold ?? false);
  }

  small({String? labelText, bool? isBold, Color? textColor}) {
    return _labelSmall().compose(
        text: labelText ?? "Small Text for SmartVan V2",
        isBold: isBold ?? false,
        textColor: textColor ?? defaults.colors.PrimaryText);
  }
}

class _labelSimple {
  const _labelSimple();
  compose(
      {required String text, required Color textColor, required bool isBold}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: defaults.font.size.small,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: textColor),
    );
  }
}

class _labelSmall {
  const _labelSmall();
  compose(
      {required String text, required bool isBold, required Color textColor}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: defaults.font.size.micro,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: textColor,
      ),
    );
  }
}

class _imageSvg {
  const _imageSvg();
  compose({required String imagePath, double? w, double? h}) {
    return SvgPicture.asset(
      imagePath,
      width: w,
      height: h,
    );
  }
}

class _inputTexts {
  const _inputTexts();

  simple(
      {String? key,
      String? initialValue,
      String? hint,
      bool? isHiddenField,
      String? Function(String?)? onError,
      Function(String?)? onSaved}) {
    return _inputTextSimple().compose(
      key: key ?? "",
      text: initialValue ?? "",
      hint: hint ?? "",
      isHidden: isHiddenField ?? false,
      onError: onError ?? (val) => "",
      onSaved: onSaved ?? (val) => "",
    );
  }

  floatingLabeled(
      {String? key,
      String? initialValue,
      String? hint,
      bool? isHiddenField,
      String? Function(String?)? onError,
      Function(String?)? onSaved}) {
    return _inputTextFloatingLabeled().compose(
      key: key ?? "",
      text: initialValue ?? "",
      hint: hint ?? "",
      isHidden: isHiddenField ?? false,
      onError: onError ?? (val) => "",
      onSaved: onSaved ?? (val) => "",
    );
  }
}

class _inputTextSimple {
  const _inputTextSimple();
  compose({
    required String key,
    required String text,
    required String hint,
    required bool isHidden,
    required String? Function(String?) onError,
    required Function(String?) onSaved,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 1,
          child: TextFormField(
            // textInputAction: TextInputAction.next,
            initialValue: text,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              border: OutlineInputBorder(),
              // hintText: 'username'

              hintText: hint,
              // errorStyle: TextStyle(color: Color(defaults.colors.argb.red))
              // hintText: AppLocalizations.of(context)!.user_name,
            ),
            obscureText: isHidden,
            key: Key(key),
            autofocus: true,
            validator: (value) {
              return onError(value);

              // if(value==null || value.isEmpty){
              //   // return 'value cannot be empty';
              //   return err_nullVal;
              // }
              // // else {return true;}
              // return null;
            },
            onSaved: (value) {
              onSaved(value);
              // if(value != null)
              // {
              //   _email = value;
              // }
            },
          ),
        ),
      ],
    );
  }
}

class _inputTextFloatingLabeled {
  const _inputTextFloatingLabeled();
  compose({
    required String key,
    required String text,
    required String hint,
    required bool isHidden,
    required String? Function(String?) onError,
    required Function(String?) onSaved,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 1,
          child: TextFormField(
            // textInputAction: TextInputAction.next,
            initialValue: text,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              // border: OutlineInputBorder(),
              // hintText: 'username'

              hintText: hint,
              // errorStyle: TextStyle(color: Color(defaults.colors.argb.red))
              // hintText: AppLocalizations.of(context)!.user_name,
            ),
            obscureText: isHidden,
            key: Key(key),
            autofocus: true,
            validator: (value) {
              return onError(value);

              // if(value==null || value.isEmpty){
              //   // return 'value cannot be empty';
              //   return err_nullVal;
              // }
              // // else {return true;}
              // return null;
            },
            onSaved: (value) {
              onSaved(value);
              // if(value != null)
              // {
              //   _email = value;
              // }
            },
          ),
        ),
      ],
    );
  }
}

//CLICKABLES
class _clickables {
  const _clickables();

  _buttons get buttons => _buttons();
  _clickableText get text => _clickableText();

  // Widget simple({String? key,
  //   String? labelText, String? hint,
  //   String? Function(String?)? onError,
  //   Function(String?)? onSaved}){
  //   return _inputTextSimple().compose(key: key??"",
  //     text: labelText??"Sample Text for SmartVan V2",
  //     hint: hint??"",
  //     onError: onError ?? (val)=>"",
  //     onSaved: onSaved ?? (val)=>"",
  //   );
  // }
}

class _buttons {
  const _buttons();

  def(
      {String? labelText,
      Color? buttonColor,
      Color? textColor,
      Color? iconColor,
      Function()? onPressed,
      IconData? startIcon,
      IconData? endIcon}) {
    return _buttonDef().compose(
        labelText: labelText ?? "click me",
        buttonColor: buttonColor ?? defaults.colors.PrimaryDark,
        textColor: textColor ?? Colors.black,
        iconColor: iconColor ?? Colors.black,
        iconStart: startIcon,
        iconEnd: endIcon,
        onPressed: onPressed ?? () {});
  }

  dark(
      {String? labelText,
      Function()? onPressed,
      IconData? startIcon,
      IconData? endIcon}) {
    return def(
        labelText: labelText,
        buttonColor: Color(defaults.colors.argb.black),
        textColor: Color(defaults.colors.argb.white),
        iconColor: Color(defaults.colors.argb.white),
        startIcon: startIcon,
        endIcon: endIcon,
        onPressed: onPressed);
  }
}

class _buttonDef {
  const _buttonDef();
  compose(
      {required String labelText,
      required Function() onPressed,
      required Color buttonColor,
      required Color textColor,
      Color? iconColor,
      IconData? iconStart,
      IconData? iconEnd}) {
    return
        // Expanded(
        //   flex: 1,
        //     child:
        //   ElevatedButton(
        //       onPressed: onPressed,
        //       child: Text("click me")
        //   )
        // )
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
            onPressed: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Stack(
                  children: [
                    Center(
                      child: Text(
                        labelText.toUpperCase(),
                        style: TextStyle(
                            fontSize: defaults.font.size.tiny,
                            fontWeight: FontWeight.bold,
                            color: textColor //Color(defaults.colors.argb.white)
                            ),
                      ),
                    ),
                    Positioned(
                      right: 10.0,
                      child: Icon(
                        iconEnd,
                        size: 16,
                        color: iconColor /*Color(defaults.colors.argb.white)*/,
                      ),
                    ),
                    Positioned(
                      left: 10.0,
                      child: Icon(
                        iconStart,
                        size: 16,
                        color: iconColor /*Color(defaults.colors.argb.white)*/,
                      ),
                    )
                  ],
                ))
              ],
            ));
  }
}

//Navigation Drawers
class _navDrawers {
  const _navDrawers();

  light(
      {List? navTreeList,
      int? currentSelection,
      Function()? onAboutTap,
      Function()? onSettingsTap,
      Function()? onLogoutTap}) {
    return _navDrawerComposer().compose(
      navigationTreeList: navTreeList ?? [],
      currentSelection: currentSelection ??
          0, /*onAboutTap: onAboutTap??(){}, onSettingsTap: onSettingsTap??(){}, onLogoutTap: onLogoutTap??(){}*/
    );
  }
}

class _navDrawerComposer {
  const _navDrawerComposer();
  //header
  _drawerHeader() {
    return DrawerHeader(
      child: Stack(
        fit: StackFit.expand,
        children: [
          defaults.images.navDrawerHeaderBg(),
          Container(
            decoration: BoxDecoration(
                gradient: defaults.colors.gradients.bottomToTop_whiteToOpaque),
          ),
          Positioned(
              left: 0.0,
              bottom: 0.0,
              child: Padding(
                  padding: EdgeInsets.all(defaults.dimens.padding.x3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaults.images.avatars.def,
                      defaults.widget.label.simple(
                          labelText: "Name Name",
                          textColor: Color(defaults.colors.argb.white),
                          isBold: true),
                      defaults.widget.label.small(
                        labelText: "name@gmail.com",
                        textColor: Color(defaults.colors.argb.white),
                        isBold: true,
                      ),
                    ],
                  )))
        ],
      ),
      padding: EdgeInsets.zero,
      /*decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/images/navDrawerBg.jpg'), fit: BoxFit.fill),

    ),*/
    );
  }

  //footer
  /*List<Widget> _drawerFooter({required Function() onAboutTap,required Function() onSettingsTap,required Function() onLogoutTap}){
    return [
      Divider(),
      ListTile(
        title: const Text('Others'),
      ),
      ListTile(
        leading: const Icon(Icons.info_sharp),
        title: const Text('About'),
        onTap: onAboutTap,
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Settings'),
        onTap: onSettingsTap,
      ),
      ListTile(
        leading: const Icon(Icons.logout),
        title: const Text('Logout'),
        onTap: onLogoutTap,
      ),
    ];
  }*/
  //body
  compose(
      {required List navigationTreeList,
      required int
          currentSelection /*, required Function() onAboutTap,required Function() onSettingsTap,required Function() onLogoutTap*/}) {
    List<Widget> treeItems = [
      _drawerHeader(),
    ];
    //adding nav items params
    for (var i = 0; i < navigationTreeList.length; i++) {
      if (i == currentSelection) {
        treeItems
            .add(_highlightedNavListTile(navigationTreeList[i] as ListTile));
      } else {
        treeItems.add(navigationTreeList[i]);
      }
    }

    //adding footer widgets
    // var footer = _drawerFooter(onAboutTap: onAboutTap, onSettingsTap: onSettingsTap, onLogoutTap: onLogoutTap);
    // for(var i = 0; i < footer.length; i++){
    //   treeItems.add(footer[i]);
    // }

    return SafeArea(
      child: Drawer(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: treeItems.length,
              itemBuilder: (context, index) => treeItems[index])

          /*ListView(
          padding: EdgeInsets.all(defaults.dimens.padding.none),
          children: <Widget>[
            _drawerHeader(),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // navigateTo("/home", context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                // navigateTo("/about", context);
              },
            ),
            Divider(),
            ListTile(
              // leading: const Icon(Icons.info_sharp),
              title: const Text('Others'),
              // onTap: () {
              //   // navigateTo("/about", context);
              // },
            ),
            ListTile(
              leading: const Icon(Icons.info_sharp),
              title: const Text('About'),
              onTap: () {
                // navigateTo("/about", context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // navigateTo("/about", context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // navigateTo("/about", context);
              },
            ),
            // Spacer(),
            // _drawerFooter()
          ],
        ),*/
          ),
    );
  }

  _highlightedNavListTile(ListTile listTile) {
    var selectionColor = Color(defaults.colors.argb.black);

    // var leadIcon = Icon((listTile.leading as Icon).icon, color: selectionColor);
    var title = Text((listTile.title as Text).data ?? "",
        style: TextStyle(color: selectionColor, fontWeight: FontWeight.bold));

    return ListTile(
      leading: Icon(Icons.arrow_forward_ios),
      // leading: leadIcon,
      title: title,
      onTap: listTile.onTap,
      selected: true,
      enabled: false,
    );
  }
}

/////////////////clickabletext
class _clickableText {
  const _clickableText();

  simple({String? labelText, Function()? onPressed}) {
    return _clickableTextSimple().compose(
        labelText: labelText ?? "clickable text",
        onPressed: onPressed ?? () {});
  }
}

class _clickableTextSimple {
  const _clickableTextSimple();
  compose({required String labelText, required Function() onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        labelText,
        style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: defaults.font.size.tiny,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
//--//

//Images
class _images {
  const _images();
  _imagePaths get path => _imagePaths();
  _avatarImages get avatars => _avatarImages();

  logoMain() {
    return _logoMain().compose();
  }

  logoSmall() {
    return _logoSmall().compose();
  }

  navDrawerHeaderBg() {
    return _navigationDrawerHeaderBackground().compose();
  }
}

class _imagePaths {
  const _imagePaths();
  get logo => 'assets/vectors/logo_main.svg';
  // get avtMale => 'assets/vectors/ic_avt_male.svg';
  get navDrawerHeaderBg => 'assets/images/navDrawerBg.jpg';
  get avtMaleDef => 'assets/images/ic_avt_male_def.jpg';
}

class _avatarImages {
  const _avatarImages();
  // get def => CircleAvatar(backgroundImage: AssetImage(defaults.images.path.avtMale),);
  get def => CircleAvatar(
        backgroundImage: AssetImage(defaults.images.path.avtMaleDef),
      );
}

class _logoMain {
  const _logoMain();

  Widget compose() {
    double w = 180;
    return Image.asset(
      'assets/images/smartVanLogo.png', // Path to your PNG image
      width: w,
      height: w,
    );
  }
}

// class _logoMain {
//   const _logoMain();
//   compose() {
//     double w = 180;
//     return defaults.widget
//         .imageSVG(imagePath: defaults.images.path.logo, width: w, height: w);

//     // const h = 100.0;
//     // return SizedBox(
//     //   width: w,
//     // child: defaults.widget.imageSVG(imagePath: defaults.images.path.logo, /*width : w, height : w*/),
//     // );
//   }
// }

class _logoSmall {
  const _logoSmall();
  compose() {
    double w = 60;
    return defaults.widget
        .imageSVG(imagePath: defaults.images.path.logo, width: w, height: w);

    // const h = 100.0;
    // return SizedBox(
    //   width: w,
    // child: defaults.widget.imageSVG(imagePath: defaults.images.path.logo, /*width : w, height : w*/),
    // );
  }
}

class _navigationDrawerHeaderBackground {
  const _navigationDrawerHeaderBackground();
  compose() {
    return Image.asset(
      defaults.images.path.navDrawerHeaderBg,
      fit: BoxFit.fill,
    );
  }
}
//--//