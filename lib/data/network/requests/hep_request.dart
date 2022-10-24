import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';


class HelpRequest {
  HelpRequest._();

  static final HelpRequest instance = HelpRequest._();

  Future<Response<dynamic>> call() async {
    return await DioHelper.getData(
      url: getHelp,
    );
  }
}
