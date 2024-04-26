import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../styles/colors.dart';

class APILoader extends StatelessWidget {
  const APILoader({
    super.key,
    required this.loader,
    required this.child,
  });
  final bool loader;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          child,
          loader
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0x000000).withOpacity(0.2),
                  child: Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          color: kWhite,
                          boxShadow: [],
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Center(
                        child: Container(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                              color: kPiggyBankGreen, size: 40.r),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
