import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:place_finder/models/activity.dart';

import 'package:place_finder/models/place.dart';
import 'package:place_finder/screens/places_screen.dart';
import 'package:place_finder/services/networking.dart';

class ActivityCarousel extends StatelessWidget {
  final String sectionName;
  final List<Activity> activities;
  ActivityCarousel({this.sectionName, this.activities});

  List<Place> getRecommendations(List<Place> places) {
    if (places.length <= 10) return places;
    List<Place> randomPlaces = generateRandomPlaces(places).toList();
    return randomPlaces;
  }

  List<Place> generateRandomPlaces(List<Place> places) {
    Set<Place> randomPlaces = Set<Place>();

    while (randomPlaces.length < 10) {
      int randomIndex = Random().nextInt(places.length);
      randomPlaces.add(places[randomIndex]);
    }

    return randomPlaces.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                sectionName,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: activities.length,
            itemBuilder: (BuildContext context, int index) {
              // Activity activity = activities[index];
              return GestureDetector(
                onTap: () async {
                  // TODO: Need to make sure that if user denied access, we alert user
                  Position position = await Geolocator().getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.low);

                  NetworkHelper helper = NetworkHelper(position: position);

                  List<Place> places =
                      await helper.getPlaces(activities[index].name);
                  var recommendedPlaces = getRecommendations(places);
                  var imagePath = activities[index].imageUrl;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlacesPage(
                        imagePath: imagePath,
                        places: recommendedPlaces,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  width: 210.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 15.0,
                        child: Container(
                          height: 120.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${activities[index].name}',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Hero(
                        tag: activities[index].imageUrl,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 180.0,
                                  width: 180.0,
                                  image: AssetImage(activities[index].imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
