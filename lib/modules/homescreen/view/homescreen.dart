import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nexteons/global/styles/colors.dart';
import 'package:nexteons/global/styles/textstyles.dart';

import '../controller/home.controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());
@override
void initState(){
  super.initState();
 controller.galleryApi();
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Container(
            width : 300.w,
           child: ListView.builder(itemCount:controller.galleryModel.name?.length ?? 0  ,shrinkWrap: true,
            itemBuilder: (BuildContext context,index){
              return Container(color: kGrey.withOpacity(0.1),
              child: Column(
                children: [
                  Row(children: [
                    KStyles().bold11(text: 'Name'),
                     KStyles().bold11(text: 'UID'),
                      KStyles().bold11(text: 'Doc type'),
                       KStyles().bold11(text: 'Image'),
                  ],),
                  Divider(),
                  Row(children: [
                   Column(
                    children: [
                      KStyles().med12(text: '${controller.galleryModel.name}'),
                      Divider()
                    ],
                   ),
                    Column(
                    children: [
                      KStyles().med12(text: '${controller.galleryModel.uid}'),
                       Divider()
                    ],
                   ),
                    Column(
                    children: [
                      KStyles().med12(text: '${controller.galleryModel.status}'),
                       Divider()
                    ],
                   ),
                    Column(
                    children: [
                      KStyles().med12(text: '${controller.data}')
                    ],
                   ),

                  ],),
                ],
              ),
              );

           }),
          )
        ],
      ),
    );
  }
}