import '../models/base_model.dart';
import '../network/responses/response.dart';
import '../../constants/extensions.dart';
import '../../constants/app_constants.dart';
import '../models/account_model.dart';

extension AccountResponseMapper on AccountDataResponse? {
  Account toDomain() {
    return Account(
      this?.id.orZero() ?? AppConstants.zero,
      this?.name.orEmpty() ?? AppConstants.empty,
      this?.email.orEmpty() ?? AppConstants.empty,
      this?.password.orEmpty() ?? AppConstants.empty,
      this?.phone.orEmpty() ?? AppConstants.empty,
      this?.createdAt.orEmpty() ?? AppConstants.empty,
      this?.updatedAt.orEmpty() ?? AppConstants.empty,
    );
  }
}

extension BaseResponseMapper on BaseResponse? {
  BaseModel toDomain() {
    return BaseModel(
      this?.status.orZero() ?? AppConstants.zero,
      this?.message.orEmpty() ?? AppConstants.empty,
    );
  }
}

extension AccountsMapper on List<AccountDataResponse>? {
  List<Account> toDomain() {
    return (this?.map((accountResponse) => accountResponse.toDomain()) ??
            const Iterable.empty())
        .cast<Account>()
        .toList();
  }
}
