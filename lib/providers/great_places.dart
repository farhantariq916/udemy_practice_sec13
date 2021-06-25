import 'dart:io';

import 'package:flutter/material.dart';
import '../models/place.dart';
import 'package:udemy_practice_sec12/helpers/db_helper.dart';

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
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert(
      'user_places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path
      },
    );
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.fetchData('user_places');
    _items = dataList.map((item) => Place(
          id: item['id'],
          title: item['title'],
          image: File(
            item['image'],
          ),
          location: PlaceLocation(address: 'Lahore',latitude: 31.5204,longitude: 74.3587),
        )
    ).toList();
  }
}
