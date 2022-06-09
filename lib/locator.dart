import 'package:challenge_app/viewmodel/homepage_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  //Konumlandırma
  locator.registerFactory(() => HomePageViewModel());
}