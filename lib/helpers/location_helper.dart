const GOOGLE_API_KEY = 'AIzaSyAGbKyV6NLLj3GoKWuHRyS03CZph5L9Huw';

class LocationHelper{
  static String generateLocationPreviewImage({ double? latitude,  double? longitude}){
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:S%7C$latitude,$longitude&key=$GOOGLE_API_KEY';

  }
  static Future<String> getPlaceAddress(double lat, double lng) async{
    

  }
}