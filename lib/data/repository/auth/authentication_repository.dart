import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/user_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/auth_response.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

class AuthenticationRepository {
  final DioHelper dioHelper;
  final AuthReoponseServices authReoponseServices;
  AuthenticationRepository(this.dioHelper, this.authReoponseServices);
  // Dio dio = Dio();

  Future<List<User>> getAllUsers() async {
    final users = await authReoponseServices.getAllUsers();
  }

  Future<List<UserModel>> registerUserData(
    String name,
    String email,
    String phone,
    String password,
  ) async {
    try {
      final users = await DioHelper.postData(url: loginUrl, body: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      });
      return users.data['account'];
    } catch (error) {
      error;
      return [];
    }
  }

  Future<List<UserModel>> loginUser(String email, String password) async {
    try {
      final users = await DioHelper.postData(url: loginUrl, body: {
        'email': email,
        'password': password,
      });
      return users.data['account'];
    } catch (error) {
      error;
      return [];
    }
  }

  Future signIn(UserModel user) {
    throw UnimplementedError();
  }

  Future<void> signOut() {
    throw UnimplementedError();
  }

  Future signUp(UserModel user) {
    throw UnimplementedError();
  }
}




// // base Repo
// import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

// import '../../models/user_model.dart';

// abstract class BaseAuthenticationRepository {
//   Stream<UserModel> getCurrentUser();
//   Future signUp(UserModel user);
//   Future signIn(UserModel user);
//   Future<void> signOut();
//   Future<String?> retrieveUserData(UserModel user);
// }

// class AuthenticationRepository implements BaseAuthenticationRepository {
// //
//   @override
//   Stream<UserModel> getCurrentUser() {
//     final user  = DioHelper.getData(url: url, query: query)
//     throw UnimplementedError();
//   }

//   @override
//   Future<String?> retrieveUserData(UserModel user) {
//     // TODO: implement retrieveUserData
//     throw UnimplementedError();
//   }

//   @override
//   Future signIn(UserModel user) {
//     // TODO: implement signIn
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> signOut() {
//     // TODO: implement signOut
//     throw UnimplementedError();
//   }

//   @override
//   Future signUp(UserModel user) {
//     // TODO: implement signUp
//     throw UnimplementedError();
//   }
// }
