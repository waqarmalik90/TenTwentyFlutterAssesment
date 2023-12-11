import 'package:flutter/material.dart';
import 'package:tentwentyflutterasgn/Utils/size_utils.dart';
import 'package:tentwentyflutterasgn/presentation/Theme/theme_helper.dart';
import 'package:tentwentyflutterasgn/widgets/CustomColors.dart';

// ignore: must_be_immutable
class FortytwoItemWidget extends StatelessWidget {
  const FortytwoItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 7.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "5 Mar",
        style: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
      selected: false,
      backgroundColor: CustomColors.GetTicketsColor,
      selectedColor: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          10.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
