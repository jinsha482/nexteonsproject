// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nexteons/global/dimensions/dimensions.dart';
import '../../styles/colors.dart';

class UIConstants {
  //*---------------------------------------------------------------- ( Loader )
  Widget loader({double size = 60, Color color = kWhite}) {
    return LoadingAnimationWidget.newtonCradle(
      size: size,
      color: color,
    );
  }
  //*---------------------------------------------------------------- ( Loader )

  //*---------------------------------------------------------------- ( Button Loader )
  Widget buttonlLoader({double size = 60, Color color = kWhite}) {
    return LoadingAnimationWidget.threeArchedCircle(
      size: size,
      color: color,
    );
  }
  //*---------------------------------------------------------------- ( Button Loader )

  //*---------------------------------------------------------------- ( Svg_Icon )
  Widget svgIcon({
    required double wd,
    required double ht,
    required String assetImage,
    Color? color,
  }) {
    return SizedBox(
      height: ht,
      width: wd,
      child: SvgPicture.asset(
        assetImage,
        color: color,
      ),
    );
  }

  //*---------------------------------------------------------------- (Transparent_Button)
  TextButton transparentButton(
      {required Widget style,
      bool apiCalling = false,
      required void Function()? onPressed,
      MaterialTapTargetSize? tapTargetSize,
      MaterialStateProperty<Size?>? minimumSize,
      MaterialStateProperty<EdgeInsetsGeometry?>? padding,
      MaterialStateProperty<Color?> overlayColor =
          const MaterialStatePropertyAll(kTrans)}) {
    return TextButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: kRadius10)),
            padding: padding,
            minimumSize: minimumSize,
            overlayColor: overlayColor,
            tapTargetSize: tapTargetSize),
        onPressed: onPressed,
        child: style);
  }

  //*---------------------------------------------------------------- (Transparent_Button)
  TextButton roundedButton(
      {required Widget child,
      Color? bdrClr = kGreen,
      bool apiCalling = false,
      required void Function()? onPressed,
      MaterialTapTargetSize? tapTargetSize,
      MaterialStateProperty<Size?>? minimumSize,
      MaterialStateProperty<Color?>? backgroundColor,
      MaterialStateProperty<EdgeInsetsGeometry?>? padding,
      MaterialStateProperty<Color?> overlayColor =
          const MaterialStatePropertyAll(kTrans)}) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: backgroundColor,
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            side: MaterialStatePropertyAll(BorderSide(color: bdrClr!)),
            padding: padding,
            minimumSize: minimumSize,
            overlayColor: overlayColor,
            tapTargetSize: tapTargetSize),
        onPressed: onPressed,
        child: apiCalling ? loader() : child);
  }

//*---------------------------------------------------------------- (Rpay_Elevated_Button)

//*---------------------------------------------------------------- (Smart Ad Instruction)
  String smartAdInstruction =
      "Smart Advertisement (SMART AD) is an advertisement programme where Whatsapp service is used as the brand promotion medium. Smart Ad can be any image or short duration to promote client brands. New ads will be available in the New Smart Ads section. Members are requested to keep Smart Ad as their Whatsapp status based on their interest. Expiry time will be displayed in the advertisement details. Members are requested to take the screen shot of the status view count and upload through the upload option of the advertisement. After approval from administrative desk, member’s piggy bank wallet will be credited with amount equivalent to the status view count. For different membership plans, paisa per view will be different. After expiry period members cannot upload screen shot to get the amount. After uploading screen shot, that ad will be available in Completed Ads section. If the member failed to upload screen shot , that ad will be available in Missed Ads section.";
//*---------------------------------------------------------------- (Smart Ad Instruction)
}
