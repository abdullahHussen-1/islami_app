import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/radio/cheack_radio.dart';
import 'package:islami_app/Ui/home/taps/radio/list_radio.dart';
import 'package:islami_app/Ui/home/taps/radio/radio_resources.dart';
import 'package:islami_app/utils/app_colors.dart';

class RadioTap extends StatefulWidget {
  @override
  State<RadioTap> createState() => _RadioTapState();
}

class _RadioTapState extends State<RadioTap> {
  bool radioClick = true;

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: sizeWidth * 0.90,
              height: sizeHeight * 0.04,
              decoration: BoxDecoration(
                  color: AppColors.black71Color,
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      radioClick = true;

                      setState(() {});
                    },
                    child: CheckRadio(
                      text: "Radio",
                      click: radioClick,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      radioClick = false;

                      setState(() {});
                    },
                    child: CheckRadio(
                      text: "Reciters",
                      click: !radioClick,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListRadio(
                        index: index,
                        checkText: radioClick,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: radioClick
                        ? RadioResources.nameRadio.length
                        : RadioResources.nameReciters.length))
          ],
        ),
      ),
    );
  }
}
