import 'package:flutter/material.dart';
import 'package:udemy_practice_sec12/screens/add_place_screen.dart';
import 'package:provider/provider.dart';
import 'package:udemy_practice_sec12/providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.pushNamed(context, AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child:Center(
          child: Text('Got no places yet, start adding some!'),
        ),
        builder: (context,greatPlaces,child)=>greatPlaces.items.length<=0?child : ListView(),
        ),
    );
  }
}
