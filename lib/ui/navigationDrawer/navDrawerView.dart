import 'dart:ffi';

import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/ui/admin/dashboard/adminDashboard.dart';
import 'package:SMV2/ui/admin/schools/adminSchoolView.dart';
import 'package:SMV2/ui/admin/supervisors/adminSupervisorsView.dart';
import 'package:SMV2/ui/navigationDrawer/navDrawerViewModel.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

import 'package:get/get.dart';

class NavigationDrawerView extends StatelessWidget {
  NavigationDrawerView(/*{super.key}*/);

  final NavDrawerViewModel _viewModel = Get.find<NavDrawerViewModel>();


  @override
  Widget build(BuildContext context) {
    // _viewModel.init();

    return Obx(() =>

        defaults.layout.withNavDrawer(
            title: "Main Dash",
            navigationDrawerItems: _viewModel.mappedNavTree.value,
            currentSelection: _viewModel.selectedNavItemPos.value,
            bodyContent: _viewModel.mappedNavView.value,
            bgColor: defaults.colors.PrimaryDark,
        )

    );
  }
}

















// class NavigationDrawerView extends StatefulWidget {
//   const NavigationDrawerView(/*{super.key}*/);
//
//   @override
//   State<NavigationDrawerView> createState() => _NavigationDrawerViewState();
// }

// class _NavigationDrawerViewState extends State<NavigationDrawerView> {
//
//   int selectedNavItemPos = 0;
//
//   List<Widget> getNavigationForUser(bool isAdmin){
//
//     if(isAdmin){
//       return _getAdminNavTree();
//     }else{
//       return _getSupervisorNavTree();
//     }
//   }
//
//   _getAdminNavTree(){
//
//     // var listTie = ListTile();
//     //
//     // listTie.performtap
//
//
//     return [
//
//       ListTile(
//         leading: const Icon(Icons.dashboard),
//         title: const Text('Dashboard'),
//         onTap: () {
//           _setNavselection(0);
//           // navigateTo("/home", context);
//           // setState(() {
//           //   selectedNavItemPos = 0;
//           // });
//         },
//       ),
//
//       ListTile(
//         leading: const Icon(Icons.school),
//         title: const Text('Schools'),
//         onTap: (){_setNavselection(1);}/*() {
//           setState(() {
//             selectedNavItemPos = 1;
//           });
//           // navigateTo("/about", context);
//         }*/,
//       ),
//
//       ListTile(
//         leading: const Icon(Icons.supervisor_account),
//         title: const Text('Supervisors'),
//         onTap: (){
//           _setNavselection(2);
//     }/*() {
//           setState(() {
//             selectedNavItemPos = 2;
//           });
//           // navigateTo("/about", context);
//         },*/
//       ),
//
//     ];
//
//
//     //   ListView(
//     //   padding: EdgeInsets.all(defaults.dimens.padding.none),
//     //   children: <Widget>[
//     //
//     //     ListTile(
//     //       leading: const Icon(Icons.dashboard),
//     //       title: const Text('Dashboard'),
//     //       onTap: () {
//     //         // navigateTo("/home", context);
//     //       },
//     //     ),
//     //
//     //     ListTile(
//     //       leading: const Icon(Icons.school),
//     //       title: const Text('Schools'),
//     //       onTap: () {
//     //         // navigateTo("/about", context);
//     //       },
//     //     ),
//     //
//     //     ListTile(
//     //       leading: const Icon(Icons.supervisor_account),
//     //       title: const Text('Supervisors'),
//     //       onTap: () {
//     //         // navigateTo("/about", context);
//     //       },
//     //     ),
//     //
//     //   ],
//     // );
//   }
//   _getAdminNavViews(int selection){
//
//     switch(selection){
//       case 0 : {
//           return AdminDashboard();
//         break;
//       }
//       case 1:{
//         return AdminSchoolView();
//         break;
//       }
//       case 2:{
//         return AdminSupervisorView();
//         break;
//       }
//     }
//
//
//     // return [
//     //
//     //   ListTile(
//     //     leading: const Icon(Icons.dashboard),
//     //     title: const Text('Dashboard'),
//     //     onTap: () {
//     //       // navigateTo("/home", context);
//     //       setState(() {
//     //         selectedNavItemPos = 0;
//     //       });
//     //     },
//     //   ),
//     //
//     //   ListTile(
//     //     leading: const Icon(Icons.school),
//     //     title: const Text('Schools'),
//     //     onTap: () {
//     //       setState(() {
//     //         selectedNavItemPos = 1;
//     //       });
//     //       // navigateTo("/about", context);
//     //     },
//     //   ),
//     //
//     //   ListTile(
//     //     leading: const Icon(Icons.supervisor_account),
//     //     title: const Text('Supervisors'),
//     //     onTap: () {
//     //       setState(() {
//     //         selectedNavItemPos = 2;
//     //       });
//     //       // navigateTo("/about", context);
//     //     },
//     //   ),
//     //
//     // ];
//
//
//     //   ListView(
//     //   padding: EdgeInsets.all(defaults.dimens.padding.none),
//     //   children: <Widget>[
//     //
//     //     ListTile(
//     //       leading: const Icon(Icons.dashboard),
//     //       title: const Text('Dashboard'),
//     //       onTap: () {
//     //         // navigateTo("/home", context);
//     //       },
//     //     ),
//     //
//     //     ListTile(
//     //       leading: const Icon(Icons.school),
//     //       title: const Text('Schools'),
//     //       onTap: () {
//     //         // navigateTo("/about", context);
//     //       },
//     //     ),
//     //
//     //     ListTile(
//     //       leading: const Icon(Icons.supervisor_account),
//     //       title: const Text('Supervisors'),
//     //       onTap: () {
//     //         // navigateTo("/about", context);
//     //       },
//     //     ),
//     //
//     //   ],
//     // );
//   }
//
//   _getSupervisorNavTree(){
//     return [
//
//       ListTile(
//         leading: const Icon(Icons.dashboard),
//         title: const Text('Dashboard'),
//         onTap: () {
//           // navigateTo("/home", context);
//         },
//       ),
//
//       ListTile(
//         leading: const Icon(Icons.supervised_user_circle_sharp),
//         title: const Text('Parents'),
//         onTap: () {
//           // navigateTo("/about", context);
//         },
//       ),
//
//       ListTile(
//         leading: const Icon(Icons.bus_alert_rounded),
//         title: const Text('Drivers'),
//         onTap: () {
//           // navigateTo("/about", context);
//         },
//       ),
//
//       ListTile(
//         leading: const Icon(Icons.route),
//         title: const Text('Routes'),
//         onTap: () {
//           // navigateTo("/about", context);
//         },
//       ),
//
//     ];
//
//
//
//     //   (
//     //   padding: EdgeInsets.all(defaults.dimens.padding.none),
//     //   children: <Widget>[
//     //
//     //     ListTile(
//     //       leading: const Icon(Icons.dashboard),
//     //       title: const Text('Dashboard'),
//     //       onTap: () {
//     //         // navigateTo("/home", context);
//     //       },
//     //     ),
//     //
//     //     ListTile(
//     //       leading: const Icon(Icons.school),
//     //       title: const Text('Schools'),
//     //       onTap: () {
//     //         // navigateTo("/about", context);
//     //       },
//     //     ),
//     //
//     //     ListTile(
//     //       leading: const Icon(Icons.supervisor_account),
//     //       title: const Text('Supervisors'),
//     //       onTap: () {
//     //         // navigateTo("/about", context);
//     //       },
//     //     ),
//     //
//     //   ],
//     // );
//   }
//
//
//   _setNavselection(int selection){
//     setState(() {
//       selectedNavItemPos = selection;
//       Navigator.pop(context);
//     });
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     final NavDrawerViewModel _viewModel = Get.find<NavDrawerViewModel>();
//
//
//     return defaults.layout.withNavDrawer(
//         title: "Main Dash",
//         navigationDrawerItems: getNavigationForUser(true),
//         currentSelection: selectedNavItemPos,
//         // bodyContent: Text("hey body"),
//         bodyContent: _getAdminNavViews(selectedNavItemPos),
//         bgColor: defaults.colors.PrimaryDark,
//       onAboutTap: (){ navigate().toAbout(/*context: context*/); },
//       onSettingsTap: (){ navigate().toSettings(/*context: context*/); },
//       onLogoutTap: (){
//           // navigate().toLogin(/*context: context*/);
//         _viewModel.logout();
//
//         }
//     );
//
//
//     // return Scaffold(
//     //   appBar: AppBar(title: Text("home is home"),),
//     //   drawer: defaults.widget.navigationDrawer.light(),
//     //   body: AdminDashboard()
//     // );
//   }
// }
