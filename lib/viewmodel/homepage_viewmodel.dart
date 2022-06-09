import 'dart:async';
import 'package:challenge_app/core/base_viewmodel.dart';
import 'package:challenge_app/service/time_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:vexana/vexana.dart';

class HomePageViewModel extends BaseViewModel {

  late StreamSubscription<Position> positionStream;


  final TimeService _timeService = TimeServiceApi(
    //Saat Servisi
    NetworkManager(
      isEnableLogger: true,
      options: BaseOptions(
        baseUrl: 'https://timeapi.io/api',
      ),
    ),
  );

  Position? _position;

  Position? get position => _position;

  Future<String> getCurrentLocation() async {
    // Konum Tespiti
    notifyListeners();

    Position position = await _determinePosition(
    );
    _position = position;
    String result =
        '\n${convertLatLng(position.longitude, false)}\n${convertLatLng(position.latitude, true)}';
    print(convertLatLng(position.longitude, false));
    print(convertLatLng(position.latitude, true));


    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 1,
    );
     positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
      //Konumun Güncellenmesi
            (Position position) {
          print("Updated position");
          print(position == null ? 'Unknown' : '${position.latitude}, ${position.longitude}');
        });

    positionStream.onData((data) {
      notifyListeners();
      print("Data");
      print(data == null ? 'Unknown' : '${data.longitude}, ${data.latitude}');
      '\n${convertLatLng(data.longitude, false)}\n${convertLatLng(data.latitude, true)}';
      print(convertLatLng(data.longitude, false));
      print(convertLatLng(data.latitude, true));
      notifyListeners();
    });
    notifyListeners();
    return result;
  }

  Future<Position> _determinePosition(

      //Konum izin kontrolü
      ) async {

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
    //Konum Verisi WGS84 Standartına Dönüştürme
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
    //Veritabanı Kaydetme
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

