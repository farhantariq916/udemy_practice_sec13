import 'dart:io';

import 'package:flutter/material.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  void addPlace(
    String pickedTitle,
    File pickedImage,
  ) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: pickedImage,
        title: pickedTitle,
        location: PlaceLocation(
          address: 'Lahore',
          latitude: 31.5204,
          longitude: 74.3587,
        ));
    items.add(newPlace);
    notifyListeners();
  }
}
