import 'package:magdsoft_flutter_structure/data/models/help_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/hep_request.dart';

class HelpResponse {
  HelpResponse._();
  static final HelpResponse instance = HelpResponse._();

  Future<List<HelpModel>> call() async {
    final request = await HelpRequest.instance();
    final List<dynamic> response = request.data['help'];
    final data = response.map((e) => HelpModel.fromJson(e)).toList();
    return data;
  }
}
