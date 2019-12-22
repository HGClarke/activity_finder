import 'package:flutter/material.dart';
import 'package:place_finder/activities_list.dart';
import 'package:place_finder/models/section.dart';
import 'package:place_finder/widgets/activity_carousel.dart';

class MyHomePage extends StatelessWidget {
  List<ActivityCarousel> buildCarousels() {
    List<ActivityCarousel> carousels = [];
    for (Section section in sections) {
      ActivityCarousel carousel = ActivityCarousel(
        sectionName: section.name,
        activities: section.activities,
      );
      carousels.add(carousel);
    }
    return carousels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Discover',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: buildCarousels(),
            )
          ],
        ),
      ),
    );
  }
}
