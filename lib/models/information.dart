
class Information {
  var deaths = 0;
  var recovered = 0;
  var total = 0;

  Information({this.total, this.recovered, this.deaths});

  Information.fromJson(Map<String, dynamic> json) {
    deaths = json["deaths"];
    recovered = json["recovered"];
    total = json["total"];
  }
}