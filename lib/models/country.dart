class Country {
  String name;
  int numbers;
  double lat;
  double lng;

  Country({
    required this.name,
    required this.numbers,
    required this.lat,
    required this.lng,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        name: json["name"],
        numbers: json["numbers"],
        lat: json["lat"],
        lng: json["lng"]);
  }
}
