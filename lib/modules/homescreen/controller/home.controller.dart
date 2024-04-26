

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nexteons/modules/homescreen/model/homescreen.model.dart';

class HomeController extends GetxController {
  
  final dio = Dio();
  final data = [].obs;
  GalleryModel galleryModel = GalleryModel();
  var jsonList;
  onInit(){
    galleryApi();
  }
  //!data fetching api
  galleryApi() async{
     try {
      final response = await dio.post(
        'https://ajcjewel.com:4000/api/global-gallery/list',
        options: Options(headers: {
      'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTcxMTQ0NTY1OSwiZXhwIjoxNzQyOTgxNjU5fQ.lE1Gbdm8YZ6Fany4184Pb7kSUg-z6Rk8Ag1irB3fstc',
      'Content-Type': 'application/json',
    },),
        data: {
          "statusArray": [1],
          "screenType": [],
          "responseFormat": [],
          "globalGalleryIds": [],
          "categoryIds": [],
          "docTypes": [],
          "types": [],
          "limit": 10,
          "skip": 0,
          "searchingText": ""
        },
      );

      if (response.statusCode == 201) {
        log("hello");
        final  responseData = response.data;
        data.assignAll(responseData.map((json) => GalleryModel.fromJson(json)));
        galleryModel = GalleryModel.fromJson(json.decode(responseData.obs));
       
      
      } else {
        // Handle error
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle Dio errors
      print('Dio Error: $e');
    }
  }
}
 