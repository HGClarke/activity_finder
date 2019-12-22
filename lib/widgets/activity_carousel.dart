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
                  letterSpacing: 1.5,
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
                  Position position = await Geolocator().getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.low);

                  if (GeolocationStatus.granted == true) {
                    NetworkHelper helper = NetworkHelper(position: position);

                    List<Place> places =
                        await helper.getPlaces(activities[index].name);
                    var imagePath = activities[index].imageUrl;
                    for (Place place in places) {
                      print(
                          '${place.name}, ${place.address}, ${place.city}, ${place.state}, ${place.country}');
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlacesPage(
                          imagePath: imagePath,
                          places: places,
                        ),
                      ),
                    );
                  } else {
                    print('status denied');
                  }
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
                            color: Colors.black26,
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
                                    letterSpacing: 1.2,
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
