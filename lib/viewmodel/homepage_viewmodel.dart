import 'package:challenge_app/service/time_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:vexana/vexana.dart';


class HomePageViewModel extends ChangeNotifier {

  final TimeService _timeService = TimeServiceApi(
    NetworkManager(
      isEnableLogger: true,
      options: BaseOptions(
        baseUrl: 'https://timeapi.io/api',
      ),
    ),
  );





  Position? _position;

  Position? get position => _position;

  void _getCurrentLocation() async {
    notifyListeners();
    Position position = await _determinePosition();
    _position = position;
    convertLatLng(position.longitude, false);
    convertLatLng(position.latitude, true);
    print(convertLatLng(position.longitude, false));
    print(convertLatLng(position.latitude, true));
    notifyListeners();
  }

  Future<String> getCurrentLocation() async {
    notifyListeners();
    Position position = await _determinePosition();
    _position = position;
    String result = '\n${convertLatLng(position.longitude, false)}\n${convertLatLng(position.latitude, true)}';
    print(convertLatLng(position.longitude, false));
    print(convertLatLng(position.latitude, true));
    notifyListeners();
    return result;
  }

  Future<Position> _determinePosition() async {
    notifyListeners();
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Konum İzni Verilmedi');
      }
    }
    notifyListeners();
    return await Geolocator.getCurrentPosition();
  }

  String convertLatLng(double decimal, bool isLat) {
    notifyListeners();
    String degree = "${decimal.toString().split(".")[0]}°";
    double minutesBeforeConversion =
        double.parse("0.${decimal.toString().split(".")[1]}");
    String minutes =
        "${(minutesBeforeConversion * 60).toString().split('.')[0]}'";
    double secondsBeforeConversion = double.parse(
        "0.${(minutesBeforeConversion * 60).toString().split('.')[1]}");
    String seconds =
        '${double.parse((secondsBeforeConversion * 60).toString()).toStringAsFixed(2)}" ';
    String dmsOutput =
        "$degree    $minutes    $seconds    ${isLat ? decimal > 0 ? 'N' : 'S' : decimal > 0 ? 'E' : 'w'}";
    notifyListeners();
    return dmsOutput;
  }

   firebaseSaveData(BuildContext context) async {
    notifyListeners();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference locationRef =
        FirebaseFirestore.instance.collection('location');
    notifyListeners();
    String geoPointResult =
        await Provider.of<HomePageViewModel>(context, listen: false)
            .getCurrentLocation();
    final response = await _timeService.getTime();
    final jsonBody = response.data;
    locationRef.add({
      'Geopoint': geoPointResult,
      'date': jsonBody?.date,
      'time': jsonBody?.time,
    });
    notifyListeners();
  }


}
