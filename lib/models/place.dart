class Place {
  final String name;
  final double latitude;
  final double longitude;

  Place({this.name, this.latitude, this.longitude});
  Place.fromJSON(json)
      : name = json["venue"]["name"],
        latitude = json["venue"]["location"]["lat"],
        longitude = json["venue"]["location"]["lng"];
}
