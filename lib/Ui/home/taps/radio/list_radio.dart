import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/radio/radio_resources.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_style.dart';

class ListRadio extends StatefulWidget {
  bool onClick = false;

  bool soundClick = true;
  int index;
  bool checkText;

  ListRadio({required this.index, required this.checkText});

  @override
  State<ListRadio> createState() => _ListRadioState();
}

class _ListRadioState extends State<ListRadio> {
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      height: sizeHeight * 0.14,
      width: sizeWidth * 0.90,
      decoration: BoxDecoration(
        color: AppColors.goldColor,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage(widget.onClick
                ? "assets/images/Mask group radio_on.png"
                : "assets/images/Mask group_radio_off.png"),
            fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          Text(
            widget.checkText
                ? RadioResources.nameRadio[widget.index]
                : RadioResources.nameReciters[widget.index],
            style: AppStyle.bold20black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    widget.onClick = !widget.onClick;
                    setState(() {});
                  },
                  icon: Icon(
                    widget.onClick ? Icons.pause : Icons.play_arrow,
                    color: AppColors.blackColor,
                    size: 44,
                  )),
              IconButton(
                  onPressed: () {
                    widget.soundClick = !widget.soundClick;
                    setState(() {});
                  },
                  icon: Icon(
                    widget.soundClick ? Icons.volume_up : Icons.volume_mute,
                    color: AppColors.blackColor,
                    size: 30,
                  ))
            ],
          )
        ],
      ),
    );
    ;
  }
}
