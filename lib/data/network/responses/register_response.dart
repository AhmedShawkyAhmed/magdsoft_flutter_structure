import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/models/status_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/register_request.dart';

 registerResponse({
  required String fullName,
  required String email,
  required String phone,
  required String password,
  required String confirmPassword,
}) async {
  Response? data;
  StatusModel? statusModel;
  try {

    String confirmedPassword = '';
    if (checkMatch(password: password,confirmPassword: confirmPassword)) {
      confirmedPassword = password;
    }
    data =
    await registerRequest(
      name: fullName, email: email, password: confirmedPassword, phone: phone,);
    if (data.data == null) {
      throw Exception('Response data is null!');
    } else {
      // statusModel = StatusModel.fromJson(data.data);
      log('TAG {}{}{}{}{}{} ${data.data}');
    }
  } on Exception catch (e) {
    log('Error -> Failed request : $e');
  }
}


bool checkMatch({
  required String password,
  required String confirmPassword,
}) {
  return password == confirmPassword;
}