
import 'package:flutter/material.dart';
import 'package:nexteons/modules/homescreen/view/homescreen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (BuildContext context) => const HomeScreen(),
};