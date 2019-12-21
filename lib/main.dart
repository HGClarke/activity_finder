import 'package:flutter/material.dart';
import 'package:place_finder/models/section.dart';
import 'package:place_finder/widgets/activity_carousel.dart';

import 'activities_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity Finder',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    print(sections.length);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
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
            // ActivityCarousel(
            //   sectionName: sections[0].name,
            //   activities: sections[0].activities,
            // ),
          ],
        ),
      ),
    );
  }
}
