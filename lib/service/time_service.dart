// https://timeapi.io/api/Time/current/zone?timeZone=Europe/Istanbul
import 'package:challenge_app/model/time_model.dart';
import 'package:vexana/vexana.dart';

abstract class TimeService {
  TimeService(this.networkManager);

  final INetworkManager networkManager;

  Future<IResponseModel<TimeModel?>> getTime();
}

class TimeServiceApi extends TimeService {

  TimeServiceApi(super.networkManager);

  @override
  Future<IResponseModel<TimeModel?>> getTime() async{
    final response = await networkManager.send<TimeModel, TimeModel>(
        '/Time/current/zone?timeZone=Europe/Istanbul',
        parseModel: TimeModel(),
        method: RequestType.GET);
    return response;
  }
}
