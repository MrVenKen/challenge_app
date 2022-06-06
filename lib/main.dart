
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Challenge App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key }) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Position? _position;

  void _getCurrentLocation() async {
    Position position = await _determinePosition();
    setState(() {
      _position = position;
      convertLatLng(position.longitude, false);
      convertLatLng(position.latitude, true);
      print(convertLatLng(position.longitude, false));
      print(convertLatLng(position.latitude, true));
    });
  }


  Future<Position> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Konum İzni Verilmedi');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  String convertLatLng(double decimal,bool isLat){
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
    return dmsOutput ;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Karbon Solutions Challenge App")),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on,
              size: 40,
              color: Colors.lightBlue,
            ),
            const SizedBox(
              height: 26,
            ),
            Center(
              child: _position != null
                  ? Text('Mevcut Konum: ')
                  : const Text(
                      'Konum tespit etmek için sağ alttaki butona tıklayın'),
            ),
          ],
        ),
        floatingActionButton: Stack(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 31),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: null,
                  child: Icon(Icons.save),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: _getCurrentLocation,
                child: const Icon(Icons.location_pin),
              ),
            ),
          ],
        )
    );
  }
}


