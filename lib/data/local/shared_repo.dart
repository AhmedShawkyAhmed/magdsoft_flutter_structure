import 'package:magdsoft_flutter_structure/data/models/user_data_model.dart';

import '../../constants/app_constants.dart';
import 'cache_helper.dart';

void saveUserShared(UserData userData) {
  CacheHelper.saveDataSharedPreference(
      key: AppConstants.userNameSharedKey, value: userData.name);
  CacheHelper.saveDataSharedPreference(
      key: AppConstants.userEmailSharedKey, value: userData.email);
  CacheHelper.saveDataSharedPreference(
      key: AppConstants.userPhoneSharedKey, value: userData.phone);
}

UserData getUserFromShared() {
  return UserData(
      CacheHelper.getDataFromSharedPreference(
          key: AppConstants.userNameSharedKey),
      CacheHelper.getDataFromSharedPreference(
          key: AppConstants.userEmailSharedKey),
      CacheHelper.getDataFromSharedPreference(
          key: AppConstants.userPhoneSharedKey));
}

deleteUser() {
  CacheHelper.clearData();
}
