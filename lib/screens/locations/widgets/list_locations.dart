import 'package:flutter/material.dart';
import 'package:rick_morty/data/location_model.dart';
import 'file:///C:/Users/tatiana/StudioProjects/rick_morty/lib/components/element_of_list_locations.dart';

class ListLocations extends StatelessWidget{
  List <Location> locations;
  ListLocations(this.locations);
  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
        shrinkWrap: true,
        itemCount: locations.length,
        itemBuilder: (_, index) {
          return ElementOfListLocations(locations[index]);
        },
      );

  }
}