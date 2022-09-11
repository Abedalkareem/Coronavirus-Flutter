class Information {
  int deaths;
  int recovered;
  int total;

  Information({
    required this.total,
    required this.recovered,
    required this.deaths,
  });

  factory Information.fromJson(Map<String, dynamic> json) {
    return Information(
      deaths: json["deaths"],
      recovered: json["recovered"],
      total: json["total"],
    );
  }
}
