import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/user_model.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

class AuthReoponseServices {
  // DioHelper dioHelper = DioHelper();

  Future<List<dynamic>> getAllUsers(User user) async {
    try {
      final users = await DioHelper.getData(
        url: loginUrl,
        query: {
          'name': user.name,
          'email': user.email,
          'phone': user.phone,
        },
      );
      return users.data['acount'];
    } catch (error) {
      error;
      return [];
    }
  }
}
