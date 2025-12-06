import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/radio/cheack_radio.dart';
import 'package:islami_app/Ui/home/taps/radio/list_radio.dart';
import 'package:islami_app/api/apiManager.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_style.dart';

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
            radioClick
                ? FutureBuilder(
                    future: ApiManager.getRadio(),
                    builder: (context, snapshot) {
                      //todo loading
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          alignment: Alignment.center,
                          height: sizeHeight * 0.5,
                          child: CircularProgressIndicator(
                            backgroundColor: AppColors.whiteColor,
                            color: AppColors.goldColor,
                          ),
                        );
                        //todo error from client
                      } else if (snapshot.hasError) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Something went wrong.",
                              style: AppStyle.bold24gold,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.whiteColor,
                              ),
                              onPressed: () {
                                ApiManager.getRadio();
                                setState(() {});
                              },
                              child: Text(
                                "Try Again",
                                style: AppStyle.bold14black,
                              ),
                            ),
                          ],
                        );
                        //todo server=>response=>success,error
                      }
                      var listRadio = snapshot.data!.radios ?? [];
                      return Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return ListRadio(
                                  index: index,
                                  checkText: radioClick,
                                  radios: listRadio[index],
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10,
                                  ),
                              itemCount: listRadio!.length));
                    },
                  )
                : FutureBuilder(
                    future: ApiManager.getReciters(),
                    builder: (context, snapshot) {
                      //todo loading
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          alignment: Alignment.center,
                          height: sizeHeight * 0.5,
                          child: CircularProgressIndicator(
                            backgroundColor: AppColors.whiteColor,
                            color: AppColors.goldColor,
                          ),
                        );
                        //todo error from client
                      } else if (snapshot.hasError) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Something went wrong.",
                              style: AppStyle.bold24gold,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.whiteColor,
                              ),
                              onPressed: () {
                                ApiManager.getRadio();
                                setState(() {});
                              },
                              child: Text(
                                "Try Again",
                                style: AppStyle.bold14black,
                              ),
                            ),
                          ],
                        );
                        //todo server=>response=>success,error
                      }
                      var listReciters = snapshot.data!.reciters ?? [];
                      return Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return ListRadio(
                                  index: index,
                                  checkText: radioClick,
                                  reciters: listReciters[index],
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10,
                                  ),
                              itemCount: listReciters.length));
                    },
                  )
          ],
        ),
      ),
    );
  }
}
