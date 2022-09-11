import 'dart:async';
import 'package:coronavirus/helpers/constants/app_images.dart';
import 'package:coronavirus/helpers/constants/strings.dart';
import 'package:coronavirus/helpers/theme.dart';
import 'package:coronavirus/models/country.dart';
import 'package:coronavirus/viewmodels/countries_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapScreen();
  }
}

class _MapScreen extends State<StatefulWidget> with TickerProviderStateMixin {
  var _markers = Set<Marker>();
  final _cameraPosition = CameraPosition(target: LatLng(30.987028, 107.773498));
  late GoogleMapController _controller;
  var _visible = false;
  double? _devicePixelRatio;
  var _viewModel = CountriesViewModel();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _updateDeviceRatio();
  }

  void _updateDeviceRatio() {
    if (_devicePixelRatio != null) {
      return;
    }
    var queryData = MediaQuery.of(context);
    _devicePixelRatio = queryData.devicePixelRatio;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      child: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(seconds: 1),
        child: GoogleMap(
          myLocationButtonEnabled: false,
          myLocationEnabled: false,
          initialCameraPosition: _cameraPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
            onMapCreated();
          },
          markers: _markers,
        ),
      ),
    );
  }

  void onMapCreated() {
    _controller.setMapStyle(Styles.mapStyle);
    _controller.moveCamera(CameraUpdate.newCameraPosition(_cameraPosition));

    setState(() {
      _visible = !_visible;
    });

    _viewModel.countriesStream.listen((data) {
      setState(() {
        _markers.clear();
        data.forEach((item) {
          _add(city: item);
        });
      });
    });
  }

  Future _add({city: Country}) async {
    final icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
            size: Size(10, 10), devicePixelRatio: _devicePixelRatio),
        AppImages.counterIcon);
    Marker resultMarker = Marker(
      icon: icon,
      markerId: MarkerId(city.name),
      infoWindow: InfoWindow(
          title: city.name, snippet: "${Strings.counterTitle} ${city.numbers}"),
      position: LatLng(city.lat, city.lng),
    );
    _markers.add(resultMarker);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
