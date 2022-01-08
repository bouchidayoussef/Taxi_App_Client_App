import 'package:taxi_rouge_app/Models/nearbyAvailableDrivers.dart';

class GeoFireAssistant
{
  static List<NearbyAvailableDrivers> nearByAvailableDriverslist = [];

  static void removeDriverFromList(String key)
  {
    int index = nearByAvailableDriverslist.indexWhere((element) => element.key == key);
    nearByAvailableDriverslist.removeAt(index);
  }

  static void updateDriverNearbyLocation(NearbyAvailableDrivers driver)
  {
    int index = nearByAvailableDriverslist.indexWhere((element) => element.key == driver.key);

    nearByAvailableDriverslist[index].latitude = driver.latitude;
    nearByAvailableDriverslist[index].longitude = driver.longitude;
  }
}