import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_practice_sec12/providers/great_places.dart';
import 'package:udemy_practice_sec12/screens/places_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: PlacesListScreen(),
      ),
    );
  }
}




