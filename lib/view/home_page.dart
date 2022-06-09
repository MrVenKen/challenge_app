import 'package:challenge_app/core/base_view.dart';
import 'package:challenge_app/viewmodel/homepage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, this.result}) : super(key: key);


  String? result;
   void _getCurrentLocation(BuildContext context) async {
     result = await Provider.of<HomePageViewModel>(context, listen: false).getCurrentLocation(
     );
   }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomePageViewModel>(onModelReady: (viewmodel){
      viewmodel.getCurrentLocation();
    },builder: (context, viewmodel, child){
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
                  child: viewmodel.position != null
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
                      onPressed: () => viewmodel.firebaseSaveData(context),
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
