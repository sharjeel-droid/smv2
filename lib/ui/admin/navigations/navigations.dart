import 'dart:collection';

import 'package:SMV2/ui/admin/schools/adminSchoolView.dart';
import 'package:SMV2/utils/navigationMapperInterface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dashboard/adminDashboard.dart';

class NavMapAdmin implements NavigationMapperInterface{
  var _selectionPosition = 0;
  final Map<String, Widget> _navigationMap = HashMap();
  NavMapAdmin(){
    _navigationMap.addAll(
        {"Dashboard":AdminDashboard(),
          "Schools":AdminSchoolView()
        }
    );
  }


  @override
  Widget selectedNavScreen() {
    return _navigationMap[_selectionPosition]!!;
  }

  @override
  List<Widget> navigationDrawerTree(Function(int selection)? onSelectionChanges) {

    List<Widget> lt = [];

    for(var map in _navigationMap.entries){
      lt.add(
          ListTile(
            leading: const Icon(Icons.star),
            title: Text(map.key),
            onTap: (){
              _selectionPosition++;
              onSelectionChanges!(_selectionPosition);
            },
          )
      ) ;

    }

    return lt;

  }

  int selectedPosition(){return _selectionPosition;}



  // @override
  // navigationDrawerTree() {
  //   // TODO: implement navigationDrawerTree
  //   throw UnimplementedError();
  // }

  // navigationDrawerTree(){
  //
  // }
  //
  // selectedNavScreen(int selection){
  //
  //
  // }


}