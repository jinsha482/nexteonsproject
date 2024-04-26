// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:piggy_bank_app/module/dashboard/model/banner_ads.model.dart';
// import 'package:piggy_bank_app/module/dashboard/model/user_details.model.dart';
// import 'package:piggy_bank_app/module/plan/model/get_active_plans.dart';
// import 'package:piggy_bank_app/module/profile/model/local_body.model.dart';
// import 'package:piggy_bank_app/module/profile/model/pincode.model.dart';
// import 'package:piggy_bank_app/module/profile/model/profession.model.dart';
// import 'package:piggy_bank_app/module/profile/model/view_bank_details.model.dart';
// import 'package:piggy_bank_app/module/profile/model/view_profile.model.dart';
// import 'package:piggy_bank_app/module/refer/model/referal.model.dart';
// import 'package:piggy_bank_app/module/signup/model/auth.model.dart';
// import 'package:piggy_bank_app/module/smart_ads/smart_ads.model.dart';
// import 'package:provider/provider.dart';

// import '../../module/dashboard/controller/dashboard.controller.dart';
// import '../../module/notification/models/notification.model.dart';
// import '../../module/pay_out/model/redeem_history.model.dart';
// import '../../module/plan/model/get_plans.model.dart';
// import '../../module/plan/model/plan_purchase.model.dart';
// import '../../module/profile/model/education.model.dart';
// import '../../module/registration/model/send_otp.model.dart';
// import '../config/config.dart';
// import '../constants/db_key.dart';
// import '../constants/interceptor.dart';

// import '../../module/wallet/model/wallet_dashboard.model.dart';

// class DataLayerController with ChangeNotifier {
// //*---------------------------------------------------------------- Model instances Starts
//   AuthModel authModel = AuthModel();
//   ViewProfileModel viewProfileModel = ViewProfileModel();
//   ViewBankDetailsModel viewBankDetailsModel = ViewBankDetailsModel();
//   UserDetailsModel userDetailsModel = UserDetailsModel();
//   WalletDashboardModel walletDashboardModelData = WalletDashboardModel();
//   GetPlansModel getPlansModel = GetPlansModel();
//   PinCodeModel placeDetails = PinCodeModel();
//   LocalBodyTypesModel localBodyTypesModel = LocalBodyTypesModel();
//   EducationModel educationModel = EducationModel();
//   ProfessionModel professionModel = ProfessionModel();
//   PlanPurchaseModel planPurchaseModelData = PlanPurchaseModel();
//   BannerAdsModel bannerAdsModel = BannerAdsModel();
//   SmartAdsModel smartAdsModel = SmartAdsModel();
//   SentOtpModel sentOtpModel = SentOtpModel();
//   RedeemHistoryModel redeemHistoryModel = RedeemHistoryModel();
//   NotificationModel notificationDataModel = NotificationModel();
//   ReferalModel referalModel = ReferalModel();
//   GetActivePlansModel activePlansModel = GetActivePlansModel();
// //*---------------------------------------------------------------- Model instances Ends
//   clearModelClasses() {
//     authModel.data = null;
//     viewProfileModel.data = null;
//     viewBankDetailsModel.data = null;
//     userDetailsModel.data = null;
//     walletDashboardModelData.data = null;
//     getPlansModel.data = null;
//     placeDetails.data = null;
//     localBodyTypesModel.localBody = null;
//     educationModel.data = null;
//     professionModel.data = null;
//     planPurchaseModelData.data = null;
//     bannerAdsModel.data = null;
//     smartAdsModel.data = null;
//     sentOtpModel.data = null;
//     redeemHistoryModel.data = null;
//     notifyListeners();
//   }

// //!--- Authentication Model Initialization
//   assignToAuthModel(Response response) {
//     authModel = AuthModel.fromJson(json.decode(response.body));
//     userInfo.put(DbKey().tokenKey, '${authModel.data?.token}');
//     userInfo.put(DbKey().refreshTokenKey, '${authModel.data?.refreshToken}');
//     if (userInfo.get(DbKey().tokenKey) != null) {
//       header = {
//         'Authorization': 'Bearer ${userInfo.get(DbKey().tokenKey).toString()}',
//       };
//       headerWithContentType = {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer ${userInfo.get(DbKey().tokenKey).toString()}',
//       };
//     }
//     if (userInfo.get(DbKey().refreshTokenKey) != null) {
//       refreshTokenHeader = {
//         'Authorization':
//             'Bearer ${userInfo.get(DbKey().refreshTokenKey).toString()}',
//       };
//     }
//     log('Access Token Key: ${userInfo.get(DbKey().tokenKey)}');
//     log('Refresh Token Key: ${userInfo.get(DbKey().refreshTokenKey)}');
//     notifyListeners();
//   }

// //!--- View Profile Model Initialization
//   assignToViewProfileModel(Response response) {
//     viewProfileModel = ViewProfileModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

//   //!--- Send OTP Model Initialization
//   assignToSendOTPModel(Response response) async {
//     sentOtpModel = await SentOtpModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

// //!--- View Bank Details Model Initialization
//   assignToViewBankDetailsModel(Response response) {
//     viewBankDetailsModel =
//         ViewBankDetailsModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

//   //!--- PinCode Model Initialization
//   assignToPlaceDetailsModel(Response response) {
//     placeDetails = PinCodeModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

//   //!--- Local Body Types Model Initialization
//   assignToLocalBodyTypes(Response response) {
//     localBodyTypesModel =
//         LocalBodyTypesModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

//   //!--- referal Model Initialization
//   assignToReferalModel(Response response) {
//     referalModel = ReferalModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

//   //!--- Educational Qualification Model Initialization
//   assignToEducationDetails(Response response) {
//     educationModel = EducationModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

//   //!---Smart Advertisement Model Initialization
//   assigntoSmartAdsModel(Response response) {
//     smartAdsModel = SmartAdsModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

//   //!--- Profession Model Initialization
//   assignToProfessionDetails(Response response) {
//     professionModel = ProfessionModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

// //!--- User Details Model Initialization
//   assignToUserDetailsModel(Response response) {
//     userDetailsModel = UserDetailsModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

//   //!--- Banner Ads Model Initialization
//   assignToBannerAdsModel(Response response) {
//     bannerAdsModel = BannerAdsModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

// //!---Wallet Dashboard Model
//   assignToWalletDashboardModel(Response response) {
//     walletDashboardModelData =
//         WalletDashboardModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

// //!---Get plans list model
//   assignToPlansListModel(Response response) {
//     getPlansModel = GetPlansModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

//   //!---Get Active plan model
//   assignToActivePlansListModel(Response response) {
//     activePlansModel = GetActivePlansModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

// //!--- Plan purchase model
//   assignToPlanPurchaseModel(Response response) {
//     planPurchaseModelData =
//         PlanPurchaseModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

//   String contactLength = "";
//   callContactService() async {
//     contactLength = await globalCtrl.getContactsService();
//     notifyListeners();
//   }

// //!--- Redeem History model
//   assignToRedeemHistoryModel(Response response) {
//     redeemHistoryModel =
//         RedeemHistoryModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

// //!--- Redeem History model
//   setNotificationData(Response response) {
//     notificationDataModel =
//         NotificationModel.fromJson(json.decode(response.body));
//     notifyListeners();
//   }

//   //!--- Reauthenticate Model Initialization
//   assignModelDynamically(List urlList, api, Response response) {
//     log('The Requested API response is: $api');
//     switch (api) {
//       case 'profile':
//         assignToViewProfileModel(response);
//         notifyListeners();
//         break;
//       case 'dashboard':
//         if (urlList.contains("wallet")) {
//           assignToWalletDashboardModel(response);
//           notifyListeners();
//         } else if (urlList.contains("smartAd")) {
//           assigntoSmartAdsModel(response);
//           notifyListeners();
//         } else {
//           assignToUserDetailsModel(response);
//           if ((dataCtrl.userDetailsModel.data?.profileCompletionProgress ?? 0) <
//                   100 &&
//               dataCtrl.userDetailsModel.data?.userIsApproved == false) {
//             var dashBoardCtrl =
//                 Provider.of<DashBoardController>(globalContext, listen: false);
//             dashBoardCtrl.completeProfileBottomSheet(globalContext);
//           }
//           notifyListeners();
//         }

//         break;
//       case 'banner':
//         assignToBannerAdsModel(response);
//         var dashBoardCtrl =
//             Provider.of<DashBoardController>(globalContext, listen: false);
//         dashBoardCtrl.createTopBannerList();
//         dashBoardCtrl.createBottomBannerList();
//         notifyListeners();
//         break;
//       case 'active':
//         assignToViewBankDetailsModel(response);
//         notifyListeners();
//         break;
//       case 'plans':
//         assignToPlansListModel(response);
//         notifyListeners();
//         break;
//       case 'education':
//         assignToEducationDetails(response);
//         notifyListeners();
//         break;
//       case 'professions':
//         assignToProfessionDetails(response);
//         notifyListeners();
//         break;
//       case 'localbodytypes':
//         assignToLocalBodyTypes(response);
//         notifyListeners();
//         break;
//       case 'wallet':
//         assignToWalletDashboardModel(response);
//         notifyListeners();
//         break;
//     }
//   }
// }
