import 'dart:async';
import 'package:coronavirus/models/information.dart';
import 'base_view_model.dart';

class CounterViewModel extends BaseViewModel {
  final _informationStreamController =
      StreamController<Information>.broadcast();
  Timer _timer;

  StreamSink<Information> get infoSink => _informationStreamController.sink;

  Stream<Information> get infoStream => _informationStreamController.stream;

  CounterViewModel() {
    _observeForInformation();
  }

  void _observeForInformation() {
    // add the source of your information here
    var number = 0;
    _timer = Timer.periodic(Duration(milliseconds: 200), (_) {
      final newNumber = number++;
      infoSink.add(Information(
          total: newNumber,
          recovered: (newNumber / 2).round(),
          deaths: (newNumber / 4).round()));
    });
  }

  @override
  void dispose() {
    _informationStreamController.close();
    _timer.cancel();
  }
}
