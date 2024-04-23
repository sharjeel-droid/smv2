import 'package:flutter/cupertino.dart';

abstract class NavigationMapperInterface{
  // Widget get navigationDrawerTree;
  // Widget get navigationDrawerTree;
  List<Widget> navigationDrawerTree(Function(int selection)? onSelectionChanges);
  Widget selectedNavScreen();
}