class Place {
  final String name;
  final String address;
  final String city;
  final String state;
  final String country;

  Place({this.name, this.city, this.address, this.country, this.state});
  Place.fromJSON(json)
      : name = json["venue"]["name"],
        address = json["venue"]["location"]["address"],
        city = json["venue"]["location"]["city"],
        state = json["venue"]["location"]["state"],
        country = json["venue"]["location"]["country"];
}
