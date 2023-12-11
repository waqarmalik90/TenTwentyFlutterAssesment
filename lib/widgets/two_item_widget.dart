import 'package:flutter/material.dart';
import 'package:tentwentyflutterasgn/Utils/image_constant.dart';
import 'package:tentwentyflutterasgn/Utils/size_utils.dart';
import 'package:tentwentyflutterasgn/presentation/Theme/custom_text_style.dart';
import 'package:tentwentyflutterasgn/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class TwoItemWidget extends StatelessWidget {
  const TwoItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.v,
      width: 163.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle2235,
            height: 100.v,
            width: 163.h,
            radius: BorderRadius.circular(
              10.h,
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.h,
                bottom: 18.v,
              ),
              child: Text(
                "Comedies",
                style: CustomTextStyles.titleMediumWhiteA700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
