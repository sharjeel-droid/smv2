import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/valueConstants.dart';
import 'package:SMV2/utils/AppSession.dart';
import 'package:SMV2/utils/AppSessionRX.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'dart:developer' as dev;

import '../admin/dashboard/adminDashboard.dart';
import '../admin/schools/adminSchoolView.dart';
import '../admin/supervisors/adminSupervisorsView.dart';

class NavDrawerViewModel extends GetxController{

  final appSessO = Get.find<AppSessionRX>();

  RxInt selectedNavItemPos = 0.obs;
  RxBool isProcessingLogout = false.obs;
  Rx<UserRole> userRole = UserRole.UNKNOWN.obs;

  late RxList<Widget> mappedNavTree;// = _getFooterNavTree().obs; //= [].obs;
  late Rx<Widget> mappedNavView;// = _getEmptyView().obs;// = [].obs;

  NavDrawerViewModel(){init();}
  init() {
    // userRole(appSessO.userRoleObs.value);
    // dev.log("userRole init -> ${userRole}");

    mappedNavTree = <Widget>[].obs;//_getFooterNavTree().obs;
    mappedNavView = _getEmptyView().obs;
    // mapNavigationTreeForUserRole();
    // _mapNavigationViewsForUserRole();
  }

  mapNavigationTreeForUserRole()
  async{
    userRole(appSessO.userRoleObs.value);

    dev.log("userRole check -> ${userRole.value}");
    // UserRole userRole = await AppSession.currentUser.userRole();
    List<Widget> tree = [];
    switch(userRole.value)
    {
      case UserRole.SADMIN:{
        // mappedNavTree([]);
        tree = [];
        tree.addAll([]);
        break;
      }

      case UserRole.ADMIN:{
        tree = [];
        tree.addAll(
            _getAdminNavTree(onSelection: (int selectedPosition){
            handleNavselection(selectedPosition);
          })
        );
        // mappedNavTree(_getAdminNavTree(onSelection: (int selectedPosition){
        //   handleNavselection(selectedPosition);
        // }));
        break;
      }

      case UserRole.SUPERVISOR:{
        tree = [];
        tree.addAll(_getSupervisorNavTree());
        // mappedNavTree(_getSupervisorNavTree());
        break;
      }

      case UserRole.DRIVER:{
        tree = [];
        tree.addAll([]);
        // mappedNavTree([]);
        break;
      }


      case UserRole.PARENT:{
        tree = [];
        tree.addAll([]);
        // mappedNavTree([]);
        break;
      }



      case UserRole.UNKNOWN:{
        tree = [];
        tree.addAll([]);
        // mappedNavTree([]);
        break;
      }

      default:{
        tree = [];
        tree.addAll([]);
        // mappedNavTree([]);
        break;
      }


    }


    // attaching footer views
    tree.addAll(_getFooterNavTree());

    //mapping final tree
    mappedNavTree(tree);
    //updating views accordingly
    _mapNavigationViewsForUserRole();


    // if(isAdmin){
    //   return _getAdminNavTree(onSelection: (int selectedPosition) {
    //     _viewModel.handleNavselection(selectedPosition);
    //
    //   });
    // }else{
    //   return _getSupervisorNavTree();
    // }
  }
  _mapNavigationViewsForUserRole()
  async{

    // UserRole userRole = await AppSession.currentUser.userRole();
    dev.log("userRole -> ${userRole.value}");
    switch(userRole.value){
      case UserRole.SADMIN:{
        mappedNavView(_getEmptyView());
        break;
      }

      case UserRole.ADMIN:{
        mappedNavView(_getAdminNavViews(selectedNavItemPos.value));
        break;
      }

      case UserRole.SUPERVISOR:{
        mappedNavView(_getEmptyView());
        break;
      }

      case UserRole.DRIVER:{
        mappedNavView(_getEmptyView());
        break;
      }


      case UserRole.PARENT:{
        mappedNavView(_getEmptyView());
        break;
      }


      case UserRole.UNKNOWN:{
        mappedNavView(_getEmptyView());
        break;
      }

      default:{
        mappedNavView(_getEmptyView());
        break;
      }


    }




    // if(isAdmin){
    //   return _getAdminNavTree(onSelection: (int selectedPosition) {
    //     _viewModel.handleNavselection(selectedPosition);
    //
    //   });
    // }else{
    //   return _getSupervisorNavTree();
    // }
  }

  handleNavselection(int selection){
    selectedNavItemPos(selection);

    // Get.back();
    // setState(() {
    //   selectedNavItemPos = selection;
    //   Navigator.pop(context);
    // });
  }



  //admin views
  _getAdminNavTree({required Function(int selectedPosition) onSelection}){
dev.log("getting admin nav tree");
    // var listTie = ListTile();
    //
    // listTie.performtap


    return [

      ListTile(
        leading: const Icon(Icons.dashboard),
        title: const Text('Dashboard'),
        onTap: () {
          // _setNavselection(0);
          // navigateTo("/home", context);
          // setState(() {
          //   selectedNavItemPos = 0;
          // });
        },
      ),

      ListTile(
        leading: const Icon(Icons.school),
        title: const Text('Schools'),
        onTap: (){onSelection(1);}
        // onTap: (){_setNavselection(1);}
        /*() {
          setState(() {
            selectedNavItemPos = 1;
          });
          // navigateTo("/about", context);
        }*/,
      ),

      ListTile(
          leading: const Icon(Icons.supervisor_account),
          title: const Text('Supervisors'),
          onTap: (){
            // _setNavselection(2);
          }/*() {
          setState(() {
            selectedNavItemPos = 2;
          });
          // navigateTo("/about", context);
        },*/
      ),

    ];


    //   ListView(
    //   padding: EdgeInsets.all(defaults.dimens.padding.none),
    //   children: <Widget>[
    //
    //     ListTile(
    //       leading: const Icon(Icons.dashboard),
    //       title: const Text('Dashboard'),
    //       onTap: () {
    //         // navigateTo("/home", context);
    //       },
    //     ),
    //
    //     ListTile(
    //       leading: const Icon(Icons.school),
    //       title: const Text('Schools'),
    //       onTap: () {
    //         // navigateTo("/about", context);
    //       },
    //     ),
    //
    //     ListTile(
    //       leading: const Icon(Icons.supervisor_account),
    //       title: const Text('Supervisors'),
    //       onTap: () {
    //         // navigateTo("/about", context);
    //       },
    //     ),
    //
    //   ],
    // );
  }
  Widget _getAdminNavViews(int selection){

    switch(selection){
      case 0 : {
        return AdminDashboard();
        break;
      }
      case 1:{
        return AdminSchoolView();
        break;
      }
      case 2:{
        return AdminSupervisorView();
        break;
      }
      default:{
        return _getEmptyView();
      }
    }


    // return [
    //
    //   ListTile(
    //     leading: const Icon(Icons.dashboard),
    //     title: const Text('Dashboard'),
    //     onTap: () {
    //       // navigateTo("/home", context);
    //       setState(() {
    //         selectedNavItemPos = 0;
    //       });
    //     },
    //   ),
    //
    //   ListTile(
    //     leading: const Icon(Icons.school),
    //     title: const Text('Schools'),
    //     onTap: () {
    //       setState(() {
    //         selectedNavItemPos = 1;
    //       });
    //       // navigateTo("/about", context);
    //     },
    //   ),
    //
    //   ListTile(
    //     leading: const Icon(Icons.supervisor_account),
    //     title: const Text('Supervisors'),
    //     onTap: () {
    //       setState(() {
    //         selectedNavItemPos = 2;
    //       });
    //       // navigateTo("/about", context);
    //     },
    //   ),
    //
    // ];


    //   ListView(
    //   padding: EdgeInsets.all(defaults.dimens.padding.none),
    //   children: <Widget>[
    //
    //     ListTile(
    //       leading: const Icon(Icons.dashboard),
    //       title: const Text('Dashboard'),
    //       onTap: () {
    //         // navigateTo("/home", context);
    //       },
    //     ),
    //
    //     ListTile(
    //       leading: const Icon(Icons.school),
    //       title: const Text('Schools'),
    //       onTap: () {
    //         // navigateTo("/about", context);
    //       },
    //     ),
    //
    //     ListTile(
    //       leading: const Icon(Icons.supervisor_account),
    //       title: const Text('Supervisors'),
    //       onTap: () {
    //         // navigateTo("/about", context);
    //       },
    //     ),
    //
    //   ],
    // );
  }

  //supervisor views
  _getSupervisorNavTree(){
    return [

      ListTile(
        leading: const Icon(Icons.dashboard),
        title: const Text('Dashboard'),
        onTap: () {
          // navigateTo("/home", context);
        },
      ),

      ListTile(
        leading: const Icon(Icons.supervised_user_circle_sharp),
        title: const Text('Parents'),
        onTap: () {
          // navigateTo("/about", context);
        },
      ),

      ListTile(
        leading: const Icon(Icons.bus_alert_rounded),
        title: const Text('Drivers'),
        onTap: () {
          // navigateTo("/about", context);
        },
      ),

      ListTile(
        leading: const Icon(Icons.route),
        title: const Text('Routes'),
        onTap: () {
          // navigateTo("/about", context);
        },
      ),

    ];



    //   (
    //   padding: EdgeInsets.all(defaults.dimens.padding.none),
    //   children: <Widget>[
    //
    //     ListTile(
    //       leading: const Icon(Icons.dashboard),
    //       title: const Text('Dashboard'),
    //       onTap: () {
    //         // navigateTo("/home", context);
    //       },
    //     ),
    //
    //     ListTile(
    //       leading: const Icon(Icons.school),
    //       title: const Text('Schools'),
    //       onTap: () {
    //         // navigateTo("/about", context);
    //       },
    //     ),
    //
    //     ListTile(
    //       leading: const Icon(Icons.supervisor_account),
    //       title: const Text('Supervisors'),
    //       onTap: () {
    //         // navigateTo("/about", context);
    //       },
    //     ),
    //
    //   ],
    // );
  }

  //General Footer Views
  _getFooterNavTree(){

    return [
      // Divider(),
      ListTile(
        title: const Text('Others'),
      ),
      ListTile(
        leading: const Icon(Icons.info_sharp),
        title: const Text('About'),
        onTap: (){
            _onAboutTap();
          },
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Settings'),
        onTap: (){_onSettingsTap();},
      ),
      ListTile(
        leading: const Icon(Icons.logout),
        title: const Text('Logout'),
        onTap: (){_onLogoutTap();},
      ),
    ];
  }
  // _getFooterNavViews(){
  //
  //   switch(selection){
  //     case 0 : {
  //       return AdminDashboard();
  //       break;
  //     }
  //     case 1:{
  //       return AdminSchoolView();
  //       break;
  //     }
  //     case 2:{
  //       return AdminSupervisorView();
  //       break;
  //     }
  //   }
  //
  //
  //   // return [
  //   //
  //   //   ListTile(
  //   //     leading: const Icon(Icons.dashboard),
  //   //     title: const Text('Dashboard'),
  //   //     onTap: () {
  //   //       // navigateTo("/home", context);
  //   //       setState(() {
  //   //         selectedNavItemPos = 0;
  //   //       });
  //   //     },
  //   //   ),
  //   //
  //   //   ListTile(
  //   //     leading: const Icon(Icons.school),
  //   //     title: const Text('Schools'),
  //   //     onTap: () {
  //   //       setState(() {
  //   //         selectedNavItemPos = 1;
  //   //       });
  //   //       // navigateTo("/about", context);
  //   //     },
  //   //   ),
  //   //
  //   //   ListTile(
  //   //     leading: const Icon(Icons.supervisor_account),
  //   //     title: const Text('Supervisors'),
  //   //     onTap: () {
  //   //       setState(() {
  //   //         selectedNavItemPos = 2;
  //   //       });
  //   //       // navigateTo("/about", context);
  //   //     },
  //   //   ),
  //   //
  //   // ];
  //
  //
  //   //   ListView(
  //   //   padding: EdgeInsets.all(defaults.dimens.padding.none),
  //   //   children: <Widget>[
  //   //
  //   //     ListTile(
  //   //       leading: const Icon(Icons.dashboard),
  //   //       title: const Text('Dashboard'),
  //   //       onTap: () {
  //   //         // navigateTo("/home", context);
  //   //       },
  //   //     ),
  //   //
  //   //     ListTile(
  //   //       leading: const Icon(Icons.school),
  //   //       title: const Text('Schools'),
  //   //       onTap: () {
  //   //         // navigateTo("/about", context);
  //   //       },
  //   //     ),
  //   //
  //   //     ListTile(
  //   //       leading: const Icon(Icons.supervisor_account),
  //   //       title: const Text('Supervisors'),
  //   //       onTap: () {
  //   //         // navigateTo("/about", context);
  //   //       },
  //   //     ),
  //   //
  //   //   ],
  //   // );
  // }
  _onAboutTap(){navigate().toAbout();}
  _onSettingsTap(){navigate().toSettings();}
  _onLogoutTap()
  async
  {
    isProcessingLogout(true);
    var isCleared = await AppSession.currentUser.clear();
    dev.log('session cleared -> ${isCleared}');
    isProcessingLogout(false);
    navigate().toLogin();

    // logout();
  }

  //general empty
  Widget _getEmptyView(){

    return Text("No Data Found");
  }

}