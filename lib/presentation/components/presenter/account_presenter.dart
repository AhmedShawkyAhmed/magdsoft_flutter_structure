// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../data/models/account_model.dart';


// abstract class GeneralDelegate {
//   void displayError(String message, bool returnHome) {}
//   void startLoading();
//   void stopLoading();
// }

// abstract class AccountDelegate {
//   void displayAccountData(Account data) {}
//   void displayError(String message) {}
//   void startLoading() {}
//   void stopLoading() {}
// }

// class AccountPresenter {
//   // final AccountService? accountService;
//   final AccountDelegate? delegate;
//   final GeneralDelegate? genDelegate;

//   AccountPresenter({this.accountService, this.delegate, this.genDelegate});
//   Future<String>? accountToken;

//   void authSignIn(String email, String password, String lang) async {
//     try {
//       delegate!.startLoading();
//       Account account =
//           await AccountService().authSignIn(email, password, lang);
//       if (account.info == true) {
//         final prefs = await SharedPreferences.getInstance();
//         //  prefs.remove("accountToken");
//         //prefs.setString("accountToken", account.token.toString());

//         delegate!.displayAccountData(account);
//         delegate!.stopLoading();
//       } else {
//         delegate!.displayError(account.message!);
//         delegate!.stopLoading();
//       }
//     } catch (e) {
//       if (e == 404) {
//         delegate!.displayError('url-connection'.tr());
//         delegate!.stopLoading();
//       } else {
//         delegate!.displayError('check-connection'.tr());
//         delegate!.stopLoading();
//       }
//     }
//   }

//   Future<List> getAccountBrief(String lang, String employeeId) async {
//     try {
//       genDelegate!.startLoading();
//       AccountBrief accountBrief =
//           await AccountService().getAccountBrief(lang, employeeId);
//       if (accountBrief.info == true) {
// //        print(accountBrief.data);

//         genDelegate!.stopLoading();
//         return accountBrief.data!;
//       } else {
//         genDelegate!.displayError(accountBrief.message!, true);
//         genDelegate!.stopLoading();
//       }
//     } catch (e) {
//       genDelegate!.displayError('check-connection', true);
//       genDelegate!.stopLoading();
      
//     }
//         return [];//TODO

//   }
// }
