import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_style.dart';

class SouraContent extends StatefulWidget {
  String text;
  int index;

  SouraContent({
    required this.text,
    required this.index,
  });

  @override
  State<SouraContent> createState() => _SouraContentState();
}

class _SouraContentState extends State<SouraContent> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        click = !click;
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: sizeWidth * 0.06),
        padding: EdgeInsets.symmetric(vertical: sizeWidth * 0.02),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: click ? AppColors.goldColor : AppColors.transparentColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.goldColor, width: 1)),
        child: Text(
          "${widget.text} [${widget.index + 1}]",
          textDirection: TextDirection.rtl,
          style: click ? AppStyle.bold20black : AppStyle.bold20gold,
        ),
      ),
    );
  }
}
