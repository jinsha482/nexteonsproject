// ignore_for_file: use_build_context_synchronously


import 'package:flutter/material.dart';



class GlobalController with ChangeNotifier {
  //*---------------------------------------------------- Api Loading
  bool _apiLoading = false;
  bool apiCallLoading = false;
  bool get apiLoading => _apiLoading;
  void changeApiLoading(bool loading) {
    _apiLoading = loading;
    notifyListeners();
  }

  //*---------------------------------------------------------------- (Re AUthentication API)

//   callReAuthenticationAPI(requestType, {String? url, body}) async {
//     apiCallLoading = true;
//     notifyListeners();
//     var refreshResponse = await ReAuthenticationService().reAuthenticateAPI();
//     if (refreshResponse.statusCode == 200) {
//       userInfo.delete(DbKey().tokenKey);
//       log("message");
//       var urlList = (url ?? "").split('/');
//       String urlType = urlList.last;
//       log(urlType);
//       log(url ?? "".toString());
//       final dataLayerCtrl =
//           Provider.of<DataLayerController>(globalContext, listen: false);
//       await dataLayerCtrl.assignToAuthModel(refreshResponse);
//       if (url != null) {
//         final response =
//             await GlobalService().globalServiceAPI(url, requestType, body);
//         dataLayerCtrl.assignModelDynamically(urlList, urlType, response);
//       }
//     } else if (refreshResponse.statusCode == 401) {
//       logout();
//     }
//     apiCallLoading = false;
//     notifyListeners();
//   }

//   //*---------------------------------------------------- Date Picker controller
//   TextEditingController selectedCtrl = TextEditingController();

//   selectedDateCtrl(TextEditingController controller) {
//     selectedCtrl = controller;
//   }

//   DateTime selectedDate = DateTime.now();
//   String fromDate = "";
//   String toDate = "";
//   selectDate(BuildContext context, String val,
//       {required TextEditingController controller}) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       lastDate: DateTime(2101),
//       initialDate: selectedDate,
//       firstDate: DateTime(2015, 8),
//     );
//     selectedDateCtrl(controller);
//     if (picked != null) {
//       selectedDate = picked;
//       if (val == "From") {
//         fromDate = selectedDate.toString();
//       } else {
//         toDate = selectedDate.add(Duration(hours: 23, minutes: 59)).toString();
//         log("${DateFormat("hh:mm:a").format(DateTime.parse(toDate))}");
//       }
//       selectedCtrl.text = DateFormat("dd-MM-yyyy").format(selectedDate);
//     }
//     notifyListeners();
//   }
//   //*---------------------------------------------------- Date Picker controller

//   //*---------------------------------------------------- Logout Function
//   logout() async {
//     final response = await GlobalService().logoutApi();
//     if (response.statusCode == 200) {
//       log('User Logged out');
//       await userInfo.clear();
//       await userInfo.delete(DbKey().tokenKey);
//       await userInfo.delete(DbKey().refreshTokenKey);
//       cleareToken();
//       header.clear();
//       headerWithContentType.clear();
//       refreshTokenHeader.clear();
//       deleteFcmToken();
//       dataCtrl.clearModelClasses();
//       Navigator.pushNamedAndRemoveUntil(
//           globalContext, SignUpScreen.route, (route) => false);
//       notifyListeners();
//     } else {
//       log('User Logged out');
//       await userInfo.clear();
//       await userInfo.delete(DbKey().tokenKey);
//       await userInfo.delete(DbKey().refreshTokenKey);
//       cleareToken();
//       header.clear();
//       headerWithContentType.clear();
//       refreshTokenHeader.clear();
//       deleteFcmToken();
//       dataCtrl.clearModelClasses();
//       Navigator.pushNamedAndRemoveUntil(
//           globalContext, SignUpScreen.route, (route) => false);
//       notifyListeners();
//       log('try again later');
//     }
//   }

//   //*---------------------------------------------------- Get Contact List
//   String contactLength = "";

//   Future<String> getContactsService() async {
//     if (await FlutterContacts.requestPermission()) {
//       List<Contact> contacts =
//           await FlutterContacts.getContacts(withProperties: true);
//       contactLength = contacts.length.toString();
//       notifyListeners();
//     }
//     return contactLength;
//   }

//   String? fcmToken;
//   getFcmToken() async {
//     fcmToken = await FirebaseMessaging.instance.getToken();
//     notifyListeners();
//     log('FCM TOKEN: ${fcmToken!}');
//     userInfo.put('fcmToken', fcmToken!);
//     notifyListeners();
//   }

//   cleareToken() {
//     fcmToken = '';
//     notifyListeners();
//   }

//   deleteFcmToken() async {
//     await FirebaseMessaging.instance.deleteToken();
//     userInfo.delete('fcmToken');
//     notifyListeners();
//   }

//   onScreenVisit(screenName, screenClass, userName, userId) async {
//     await FirebaseAnalytics.instance.logEvent(
//       name: 'screen_view',
//       parameters: {
//         'firebase_screen': screenName,
//         'firebase_screen_class': screenClass,
//         // 'view_date': DateFormat('dd-MM-yyyy').format(DateTime.now()),
//         // 'view_time': DateFormat('hh:mm a').format(DateTime.now()),
//         // 'user_name': userName,
//         // 'user_Id': userId,
//       },
//     ).then((value) {
//       log('***** $screenName viewed *****');
//     });
//   }

//   onNavigation(String? route) {
//     final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
//     FirebaseAnalyticsObserver(
//       analytics: analytics,
//       routeFilter: (route) {
//         return true;
//       },
//       nameExtractor: (settings) {
//         return route ?? "";
//       },
//     );
//   }
// }
}