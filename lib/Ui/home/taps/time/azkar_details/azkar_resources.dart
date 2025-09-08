import 'package:islami_app/Ui/home/taps/time/azkar_details/azkar_data.dart';
import 'package:islami_app/utils/app_assets.dart';

class AzkarResources {
  static List<AzkarData> azkarList = [
    AzkarData(image: AppAssets.eveningAzkar, zkar: "Evening Azkar"),
    AzkarData(image: AppAssets.morningAzkar, zkar: "Morning Azkar"),
    AzkarData(image: AppAssets.wakingAzkar, zkar: "Waking Azkar"),
    AzkarData(image: AppAssets.sleepingAzkar, zkar: "Sleeping Azkar"),
  ];
}
