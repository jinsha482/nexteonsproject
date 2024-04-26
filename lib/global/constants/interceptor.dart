import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as https;
import 'package:nexteons/global/config/api_url_config.dart';
import 'package:provider/provider.dart';
import '../../main.dart';

import '../config/config.dart';
import '../controllers/global_controller.dart';
import 'db_key.dart';
import 'error_handler.dart';

Box<String> userInfo = Hive.box<String>(Config.dbName);

// var userType = userInfo.get(DbKey().userType);

String baseUrl = Config().baseUrl;

//!---------------------------------------------------------------- ( New API call methods )

enum HttpMethods { post, get, delete, patch, multipart }

// final https = SecureHttpClient.build(Config().fingerPrint);
final Connectivity _connectivity =
    Connectivity(); //?--------------- (network connectivity)

Future<Response> httpApiCall({
  /// This [API] method will call the API and give back the response
  /// THis will check the network connectivity and return the network error screen if network not available

  required HttpMethods tHttp,
  Object? body,
  Map<String, String>? headers,
  required Uri url,
}) async {
  var connectionResult = await _connectivity.checkConnectivity();
  if (connectionResult == ConnectivityResult.mobile ||
      connectionResult == ConnectivityResult.wifi) {
    try {
      switch (tHttp) {
        case HttpMethods.post:
          return await https.post(url, body: body, headers: headers);
        case HttpMethods.get:
          return await https.get(url, headers: headers);
        case HttpMethods.delete:
          return await https.delete(url, headers: headers);
        case HttpMethods.patch:
          return await https.patch(url, body: body, headers: headers);
        default:
          return await https.post(url, body: body, headers: headers);
      }
    } on FormatException catch (e) {
      log(e.toString(), name: "FormatException");

      return Response('{"code":"120001"}', 120);
    } on SocketException catch (e) {
      log(e.toString(), name: "Socket Exception");
      // navigationKey.currentState!.push(MaterialPageRoute(
      //     builder: (context) => NetworkErrorScreen(
      //           statusCode: 303,
      //         )));
      return Response('{"code":"303021"}', 303);
    } on PlatformException catch (e) {
      log(e.toString(), name: "PlatformException");

      return Response('{"code":"140001"}', 140);
    } catch (e) {
      log(e.toString(), name: "API Error");
      return Response('{"code":"150001"}', 150);
    }
  } else {
    navigationKey.currentState!.pushNamed('/networkError');
    return Response('{"code":"303021"}', 303);
  }
}

//?---------------------------------------------------- ( Api call status checking )
Map<String, String> header = {
  'Authorization': 'Bearer ${userInfo.get(DbKey().tokenKey).toString()}',
};

Map<String, String> headerWithContentType = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer ${userInfo.get(DbKey().tokenKey).toString()}',
};

Map<String, String> refreshTokenHeader = {
  'Authorization': 'Bearer ${userInfo.get(DbKey().refreshTokenKey).toString()}',
};

Future<Response> httpRequests(
    {required String url,
    required HttpMethods httpType,
    Object? body,
    Map<String, String>? headers,
    int timeout = 30,
    dynamic model,
    bool setAppLoading = true}) async {
  //?---------------------------------------------------------------- ( global loading  )

  final globalCnt = Provider.of<GlobalController>(globalContext, listen: false);
  globalCnt.changeApiLoading(setAppLoading);

  log("---------------------------------------------------------------- ( API request data logs)\n");
  log("${headers.toString()} ", name: "TOKEN");
  log(url, name: "API URL");
  log(body.toString(), name: "Request body");
  log("---------------------------------------------------------------- ( API request data logs)");

  final response = await httpApiCall(
    tHttp: httpType,
    url: Uri.parse(url),
    body: body,
    headers: headers,
  ).timeout(Duration(seconds: timeout), onTimeout: () {
    return Response('{"code":"408000"}', 408);
  });

  if (response.statusCode.toString()[0] == "5") {
    // navigationKey.currentState!.push(MaterialPageRoute(
    //     builder: (context) => NetworkErrorScreen(
    //           statusCode: 5,
    //         )));
    globalCnt.changeApiLoading(false);

    //Todo:-------------------------------------------- ( Internal server error handling )

    apiLogs("5", response);

    return response;
  } else if (response.statusCode.toString()[0] == "4") {
    globalCnt.changeApiLoading(false);
    log("**************************************************");
    log(url);

    // unAuthMethod(response, httpType, url, body);

    //Todo:-------------------------------------------- ( UnAuthorized user handling )
    apiLogs("4", response);

    return response;
  } else if (response.statusCode == 404) {
    // navigationKey.currentState!.push(MaterialPageRoute(
    //     builder: (context) => NetworkErrorScreen(
    //           statusCode: 404,
    //         )));
    return response;
  } else {
    globalCnt.changeApiLoading(false);

    //Todo:-------------------------------------------- ( Other responses )
    log("---------------------------------------------------------------- ( API Response data logs )\n");
    log(response.body.toString(), name: "API  Response body");
    log(response.statusCode.toString(), name: "API status code");
    log("---------------------------------------------------------------- ( API Response data logs )");
    // log("-------------------------------------------");
    return response;
  }
}

//?----------------------------------------------------------------- ( unAuthorized methods )

// unAuthMethod(Response response, requestType, url, body) {
//   if (json.decode(response.body)['statusCode'].toString() == '401') {
//     log("Hii AMAL");
//     var globalCtrl =
//         Provider.of<GlobalController>(globalContext, listen: false);
//     log(url);
//     log(body.toString());
//     if (!url.toString().contains('refresh'))
//       globalCtrl.callReAuthenticationAPI(requestType, url: url, body: body);
//   }
// }

//? ---------------------------------------------------------------- ( API resource logs )
apiLogs(String errorCode, Response response) {
  try {
    log("------------------------------------------- ( $errorCode )");
    log(response.statusCode.toString(), name: "API status code");
    String statusCode = json.decode(response.body)["code"].toString();
    log(statusCode, name: "API status code");

    if (statusCode.isNotEmpty) {
      log(statusChecker(statusCode), name: "API response");
    }
    log(json.decode(response.body).toString(), name: "Error body");

    log("------------------------------------------- ( $errorCode )");
  } catch (e) {
    log(e.toString());
  }
}

// //?---------------------------------------------------------------- ( Profile update request )

// Future<int> profileUpdate(
//     String token,
//     String pincodeId,
//     String userDob,
//     String genderId,
//     String dialCode,
//     String phoneNumber,
//     String ward,
//     String localBodyType,
//     String localBodyName,
//     String profession,
//     String education,
//     String contactCount,
//     String address,
//     String primaryPhoneNumber,
//     String primarydialCode,
//     String userFName,
//     String userLName,
//     {File? profilePic}) async {
//   final request = MultipartRequest('patch', Uri.parse(updateBasicInfoApi));
//   request.fields["user_first_name"] = userFName;
//   request.fields["user_last_name"] = userLName;
//   request.fields['user_dob'] = userDob;
//   request.fields['user_gender_id'] = genderId;
//   request.fields['user_additional_number_cn_code'] = dialCode;
//   request.fields['user_additional_number'] = phoneNumber;
//   request.fields['user_pincode_id'] = pincodeId;
//   request.fields['user_ward_id'] = ward;
//   request.fields['user_local_body_type_id'] = localBodyType;
//   request.fields['user_local_body_name'] = localBodyName;
//   request.fields['user_highest_education_id'] = education;
//   request.fields['user_profession_id'] = profession;
//   request.fields['user_contacts_count'] = contactCount;
//   request.fields['user_address'] = address;
//   request.fields['user_phone_number'] = primaryPhoneNumber;
//   request.fields['user_phone_cn_code'] = primarydialCode;
//   log(request.fields.toString());
//   if (profilePic != null) {
//     log(profilePic.toString());
//     final file = await https.MultipartFile.fromPath(
//       'user_profile_image',
//       profilePic.path,
//     );
//     request.files.add(file);
//   }

//   request.headers['Authorization'] = token;
//   final response = await request.send();
//   log(response.statusCode.toString());

//   var printResponse = await response.stream.bytesToString();

//   log(printResponse);
//   log(response.statusCode.toString());
//   return response.statusCode;
// }

// //?---------------------------------------------------------------- ( Smart Ads Upload request )

// Future<int> smartAdsUpload(
//     File screenShot, String viewCount, token, adId) async {
//   final request = MultipartRequest('post', Uri.parse(uploadTaskApi(adId)));
//   request.fields['smartAd_task_view_count'] = viewCount;
//   final file = await https.MultipartFile.fromPath(
//     'smartAd_task_smartAd_proof',
//     screenShot.path,
//   );
//   request.files.add(file);
//   request.headers['Authorization'] = token;
//   final response = await request.send();
//   var printResponse = await response.stream.bytesToString();
//   log(response.statusCode.toString());
//   log(printResponse);
//   return response.statusCode;
// }

// // //?---------------------------------------------------------------- ( Upload Profile Image request )

// Future<int> uploadProfileImage(File profileImage, token) async {
//   final request = MultipartRequest('patch', Uri.parse(updatePorfileImage));

//   final file = await https.MultipartFile.fromPath(
//     'user_profile_image',
//     profileImage.path,
//   );
//   request.files.add(file);
//   request.headers['Authorization'] = token;
//   final response = await request.send();
//   var printResponse = await response.stream.bytesToString();
//   log(response.statusCode.toString());
//   log(printResponse);
//   return response.statusCode;
// }
