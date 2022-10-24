import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:magdsoft_flutter_structure/business_logic/bloc_observer.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/help_response.dart';

import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/theme.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

//late LocalizationDelegate delegate;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {
      DioHelper.init();
      await CacheHelper.init();
      // final locale =
      //     CacheHelper.getDataFromSharedPreference(key: 'language') ?? "ar";
      //  delegate = await LocalizationDelegate.create(
      //     fallbackLocale: locale,
      //     supportedLocales: ['ar', 'en'],
      //   );
      //   await delegate.changeLocale(Locale(locale));
      runApp(MyApp(
        appRouter: AppRouter(),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
          builder: (context, orientation, deviceType) => MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.onGenerateRoute,
            theme: appTheme(context),
          ),
        );
  }
}

// class MyApp extends StatefulWidget {
//   final AppRouter appRouter;

//   const MyApp({
//     required this.appRouter,
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//     Intl.defaultLocale = delegate.currentLocale.languageCode;

//     delegate.onLocaleChanged = (Locale value) async {
//       try {
//         setState(() {
//           Intl.defaultLocale = value.languageCode;
//         });
//       } catch (e) {
//         showToast(e.toString(), context);
//       }
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: ((context) => GlobalCubit()),
//         ),
//       ],
//       child: BlocConsumer<GlobalCubit, GlobalState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Sizer(
//             builder: (context, orientation, deviceType) {
//               return LocalizedApp(
//                 delegate,
//                 LayoutBuilder(builder: (context, constraints) {
//                   return MaterialApp(
//                     debugShowCheckedModeBanner: false,
//                     localizationsDelegates: [
//                       GlobalCupertinoLocalizations.delegate,
//                       DefaultCupertinoLocalizations.delegate,
//                       GlobalMaterialLocalizations.delegate,
//                       GlobalWidgetsLocalizations.delegate,
//                       delegate,
//                     ],
//                     locale: delegate.currentLocale,
//                     supportedLocales: delegate.supportedLocales,
//                     onGenerateRoute: widget.appRouter.onGenerateRoute,
//                     theme: ThemeData(
//                       fontFamily: 'Inter',
//                       //scaffoldBackgroundColor: AppColors.white,
//                       appBarTheme: const AppBarTheme(
//                         elevation: 0.0,
//                         systemOverlayStyle: SystemUiOverlayStyle(
//                           // statusBarColor: Colors.transparent,
//                           statusBarIconBrightness: Brightness.dark,
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
