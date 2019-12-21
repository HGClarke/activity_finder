import 'models/activity.dart';
import 'models/section.dart';

// Sports Activities List
Activity soccer =
    Activity(name: 'Soccer', imageUrl: 'assets/images/sports/soccer.jpg');
Activity basketball = Activity(
    name: 'Basketball', imageUrl: 'assets/images/sports/basketball.jpg');

Activity baseball =
    Activity(name: 'baseball', imageUrl: 'assets/images/sports/baseball.jpg');

Activity tennis =
    Activity(name: 'Tennis', imageUrl: 'assets/images/sports/tennis.jpg');
Activity golf =
    Activity(name: 'Golf', imageUrl: 'assets/images/sports/golf.jpg');
Activity football =
    Activity(name: 'Football', imageUrl: 'assets/images/sports/football.jpg');
Activity hockey =
    Activity(name: 'Hockey', imageUrl: 'assets/images/sports/hockey.jpg');

List<Activity> sportsActivities = [
  soccer,
  basketball,
  football,
  baseball,
  tennis,
  golf,
  hockey
];

List<Section> sections = [
  Section(name: 'Sports', activities: sportsActivities),
  Section(name: 'Sports', activities: sportsActivities),
];
