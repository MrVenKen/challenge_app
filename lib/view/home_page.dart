import 'package:challenge_app/viewmodel/homepage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);


   late final String result;
   void _getCurrentLocation(BuildContext context) async {
     result = await Provider.of<HomePageViewModel>(context, listen: false).getCurrentLocation();
   }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, HomePageViewModel model, _) {
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title:
                  const Center(child: Text("Karbon Solutions Challenge App")),
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
                  child: model.position != null
                      ? Text('\nMevcut Konum: \n$result')
                      : const Text(
                          'Konum tespit etmek için sağ alttaki butona tıklayın'),
                ),
              ],
            ),
            floatingActionButton: Stack(
              children: <Widget>[
                 Padding(
                  padding: const EdgeInsets.only(left: 31),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton(
                      onPressed: () => model.firebaseSaveData(context),
                      child: const Icon(Icons.save),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () => _getCurrentLocation(context),
                    child: const Icon(Icons.location_pin),
                  ),
                ),
              ],
            )),
      );
    });
  }
}
