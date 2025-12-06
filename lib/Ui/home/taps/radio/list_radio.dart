import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/quran_tap/quran_resources.dart';
import 'package:islami_app/model/reciters_item_data.dart';
import 'package:islami_app/model/reciters_response.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_style.dart';

import '../../../../model/radio_response.dart';
import '../../../../utils/app_routes.dart';

class ListRadio extends StatefulWidget {
  bool onClick = false;
  Radios? radios;
  bool soundClick = true;
  int index;
  bool checkText;
  AudioPlayer audioPlayer = AudioPlayer();
  Reciters? reciters;
  bool recitersItem;
  String urlSourceReciters;

  ListRadio(
      {required this.index,
      required this.checkText,
      this.radios,
      this.reciters,
      this.recitersItem = false,
      this.urlSourceReciters = ''});

  @override
  State<ListRadio> createState() => _ListRadioState();
}

class _ListRadioState extends State<ListRadio> {
  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    return Container(
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
      child: Column(children: [
        Text(
          widget.recitersItem
              ? QuranResources.arabicQuranSurasList[widget.index]
              : widget.checkText
                  ? widget.radios!.name ?? ''
                  : widget.reciters!.name ?? '',
          style: AppStyle.bold20black,
        ),
        widget.checkText
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () async {
                        widget.onClick = !widget.onClick;
                        widget.recitersItem
                            ? widget.onClick
                                ? await widget.audioPlayer.play(
                                    UrlSource(widget.urlSourceReciters ?? ''))
                                : await widget.audioPlayer.stop()
                            : widget.onClick
                                ? await widget.audioPlayer.play(UrlSource(widget
                                        .radios!.url ??
                                    "https://server6.mp3quran.net/akdr/002.mp3"))
                                : await widget.audioPlayer.stop();
                        setState(() {});
                      },
                      icon: Icon(
                        widget.onClick ? Icons.pause : Icons.play_arrow,
                        color: AppColors.blackColor,
                        size: 44,
                      )),
                  IconButton(
                      onPressed: () async {
                        widget.soundClick = !widget.soundClick;
                        widget.soundClick
                            ? await widget.audioPlayer.setVolume(1)
                            : await widget.audioPlayer.setVolume(0);
                        setState(() {});
                      },
                      icon: Icon(
                        widget.soundClick ? Icons.volume_up : Icons.volume_mute,
                        color: AppColors.blackColor,
                        size: 30,
                      ))
                ],
              )
            : TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.recitersItemRoute,
                      arguments: RecitersItemData(
                          name: widget.reciters!.name ?? "",
                          moshafReciters: widget.reciters?.moshaf![0]));
                },
                child: Text(
                  "استمع الآن",
                  style: AppStyle.bold16black,
                ))
      ]),
    );
    ;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.audioPlayer.dispose();
  }
}
