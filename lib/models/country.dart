class Country {
  var name = "Text";
  var numbers = 0;
  var lat = 0.0;
  var lng = 0.0;

  Country({this.name, this.numbers, this.lat, this.lng});

  Country.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    numbers = json["numbers"];
    lat = json["lat"];
    lng = json["lng"];
  }
}
