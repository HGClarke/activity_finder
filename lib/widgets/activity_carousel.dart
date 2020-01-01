import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
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
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 250.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: activities.length,
            itemBuilder: (BuildContext context, int index) {
              // Activity activity = activities[index];
              return GestureDetector(
                onTap: () async {
                  var status =
                      await Geolocator().checkGeolocationPermissionStatus();
                  print(status);
                  if (status == GeolocationStatus.granted) {
                    Position position = await Geolocator().getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.low);

                    NetworkHelper helper = NetworkHelper(position: position);

                    List<Place> places =
                        await helper.getPlaces(activities[index].name);
                    var imagePath = activities[index].imageUrl;
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
                    showDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: Text(
                          'Please allow location services for \'Place Finder\'.',
                        ),
                        actions: <Widget>[
                          CupertinoButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          CupertinoButton(
                            child: Text('Settings'),
                            onPressed: () {
                              PermissionHandler().openAppSettings();
                            },
                          )
                        ],
                      ),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  width: 210.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
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
                      Positioned(
                        bottom: 20,
                        child: Text(
                          '${activities[index].name}',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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
