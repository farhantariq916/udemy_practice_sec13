import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:udemy_practice_sec12/helpers/location_helper.dart';
import 'package:udemy_practice_sec12/screens/map_screen.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  Future<void> _getCurrentLocation() async {
    final locationData = await Location().getLocation();
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      latitude: locationData.latitude,
      longitude: locationData.longitude,
    );
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
    print('location>>>>>>>>');
    print(locationData.longitude);
    print(locationData.heading);
    print(locationData.time);
    print(locationData.satelliteNumber);
  }

  Future<void> _selectOnMap() async {
    final  selectedLocation=await Navigator.of(context).push<LatLng>(MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => MapScreen(
        isSelecting: true,
      ),
    ));
    if(selectedLocation==null){
      return;
    }
    print('selcted location>>>>>>>>>>..');
    print(selectedLocation.latitude);


  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 170.0,
          width: double.infinity,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _previewImageUrl == null
              ? Text(
                  'No location chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: Icon(Icons.location_on),
              label: Text(
                'Current Location',
              ),
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              icon: Icon(Icons.map),
              label: Text(
                'Select on map',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
