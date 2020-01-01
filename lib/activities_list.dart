import 'models/activity.dart';
import 'models/section.dart';

// Sports Activities List
Activity soccer =
    Activity(name: 'Soccer', imageUrl: 'assets/images/sports/soccer.jpg');
Activity basketball = Activity(
    name: 'Basketball', imageUrl: 'assets/images/sports/basketball.jpg');

Activity baseball =
    Activity(name: 'Baseball', imageUrl: 'assets/images/sports/baseball.jpg');

Activity tennis =
    Activity(name: 'Tennis', imageUrl: 'assets/images/sports/tennis.jpg');
Activity golf =
    Activity(name: 'Golf', imageUrl: 'assets/images/sports/golf.jpg');
Activity football =
    Activity(name: 'Football', imageUrl: 'assets/images/sports/football.jpg');
Activity hockey =
    Activity(name: 'Hockey', imageUrl: 'assets/images/sports/hockey.jpg');

// Food Sections

Activity chineseFood =
    Activity(name: 'Chinese Food', imageUrl: 'assets/images/food/chinese.jpg');

Activity italianFood =
    Activity(name: 'Italian Food', imageUrl: 'assets/images/food/italian.jpg');

Activity frenchFood =
    Activity(name: 'French Food', imageUrl: 'assets/images/food/french.jpg');

Activity japanaseFood = Activity(
    name: 'Japanese Food', imageUrl: 'assets/images/food/japanese.jpg');

Activity mexicanFood =
    Activity(name: 'Mexican Food', imageUrl: 'assets/images/food/mexican.jpg');

Activity carribeanFood = Activity(
    name: 'Carribean Food', imageUrl: 'assets/images/food/carribean.jpg');
List<Activity> sportsActivities = [
  soccer,
  basketball,
  football,
  baseball,
  tennis,
  golf,
  hockey
];

List<Activity> foods = [
  chineseFood,
  italianFood,
  frenchFood,
  mexicanFood,
  carribeanFood
];

// Fun Activities

Activity nightlife =
    Activity(name: 'Night Life', imageUrl: 'assets/images/fun/nightlife.jpg');

Activity zoo = Activity(name: 'Zoo', imageUrl: 'assets/images/fun/zoo.jpg');
Activity bowling =
    Activity(name: 'Bowling', imageUrl: 'assets/images/fun/bowling.jpg');
Activity mall = Activity(name: 'Malls', imageUrl: 'assets/images/fun/mall.jpg');
Activity kayaking =
    Activity(name: 'Kayaking', imageUrl: 'assets/images/fun/kayaking.jpg');
Activity movies =
    Activity(name: 'Movies', imageUrl: 'assets/images/fun/movies.jpg');
Activity park = Activity(name: 'Parks', imageUrl: 'assets/images/fun/park.jpg');
Activity amusementParks = Activity(
    name: 'Amusement Parks', imageUrl: 'assets/images/fun/amusement-parks.jpg');

List<Activity> funActivities = [
  nightlife,
  bowling,
  movies,
  kayaking,
  amusementParks,
  mall,
  zoo,
  park
];

List<Section> sections = [
  Section(name: 'Sports', activities: sportsActivities),
  Section(name: 'Restaurants', activities: foods),
  Section(name: 'Fun', activities: funActivities)
];
