
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../constants/ui/ui.constants.dart';
import '../controllers/data_layer.controller.dart';
import '../controllers/global_controller.dart';


class Config {
  //*--- Base url

  //!-- Development Url
  // var baseUrl = 'https://api.dev.piggybank.reontel.com/api/v1/';

  //!-- Test Url
  // var baseUrl = 'https://api.test.piggybank.reontel.com/api/v1/';

  //!-- Production Url
  var baseUrl = 'https://api.uat.piggybank.reontel.com/api/v1/';

  //*--- Base url

  //*--- Hive Database Name
  static const String dbName = 'piggyBank';
}

//*---------------------------------------------------- (Global Context)
BuildContext globalContext = navigationKey.currentState!.context;

//*---------------------------------------------------- (Media_Query)
Size size = MediaQuery.sizeOf(globalContext);

//*---------------------------------------------------- (Functional constant object)
// FunctionalConstants flCon = FunctionalConstants();

//*---------------------------------------------------- (UI constant object)
UIConstants uiCon = UIConstants();

//*---------------------------------------------------- (Font Family object)


//*---------------------------------------------------- (Data Layer object)
// var dataCtrl = Provider.of<DataLayerController>(globalContext, listen: false);
//*---------------------------------------------------- (Global Controller object)
var globalCtrl = Provider.of<GlobalController>(globalContext, listen: false);
