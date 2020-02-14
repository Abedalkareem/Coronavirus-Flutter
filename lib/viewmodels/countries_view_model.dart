import 'dart:async';
import 'dart:math';
import 'package:coronavirus/models/country.dart';
import 'package:coronavirus/viewmodels/base_view_model.dart';

class CountriesViewModel extends BaseViewModel {
  final _countriesStreamController =
      StreamController<List<Country>>.broadcast();

  StreamSink<List<Country>> get countriesSink =>
      _countriesStreamController.sink;

  Stream<List<Country>> get countriesStream =>
      _countriesStreamController.stream;

  Timer _timer;

  CountriesViewModel() {
    _observeForCountriesList();
  }

  void _observeForCountriesList() {
    final random = Random();
    _timer = Timer.periodic(Duration(seconds: 2), (_) {
      countriesSink.add([
        Country(
            name: "Thailand",
            numbers: random.nextInt(33),
            lat: 15.870032,
            lng: 100.992538),
        Country(
            name: "Hong Kong",
            numbers: random.nextInt(50),
            lat: 22.396427,
            lng: 114.109497),
        Country(
            name: "France",
            numbers: random.nextInt(11),
            lat: 46.227638,
            lng: 2.213749),
        Country(
            name: "Philippines",
            numbers: random.nextInt(33),
            lat: 12.879721,
            lng: 121.774017),
        Country(
            name: "Singapore",
            numbers: random.nextInt(50),
            lat: 1.352083,
            lng: 138.25293),
        Country(
            name: "Spain",
            numbers: random.nextInt(33),
            lat: 40.463669,
            lng: -3.74922),
        Country(
            name: "South Korea",
            numbers: random.nextInt(28),
            lat: 35.907757,
            lng: 127.766922),
        Country(
            name: "Finland",
            numbers: random.nextInt(55),
            lat: 61.92411,
            lng: 25.748152),
        Country(
            name: "Sweden",
            numbers: random.nextInt(12),
            lat: 60.128162,
            lng: 18.643501),
        Country(
            name: "Sri Lanka",
            numbers: random.nextInt(44),
            lat: 7.873054,
            lng: 80.771797)
      ]);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _countriesStreamController.close();
  }
}
