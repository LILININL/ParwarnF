import 'package:flutter/material.dart';
import 'package:plawarn/Auth/Mobile_Auth/LoginMobile.dart';
import 'package:plawarn/Auth/Mobile_Auth/VerifyOtp.dart';
import 'package:plawarn/Page/CaeateUser/AvatarPage/AvatarForm.dart';
import 'package:plawarn/Page/CaeateUser/DateofbridPage/DateofbirthForm.dart';
import 'Page/CaeateUser/NamePage/NameForm.dart';
import 'Page/HomePage.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'l10n/support_locale.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Noto'),
      localizationsDelegates: const [
        // AppLocalizations.delegate,
        // GlobalMaterialLocalizations.delegate,
        // // GlobalWidgetsLocalizations.delegate,
        // // GlobalCupertinoLocalizations.delegate,
      ],

      locale: const Locale('th', 'TH'),
      // supportedLocales: L10n.support,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        LoginMobile.routeName: (context) => const LoginMobile(),
        VerifyOtp.routeName: (context) => const VerifyOtp(),
        NameForm.routeName: (context) => const NameForm(),
        DateOfBirthForm.routeName: (context) => const DateOfBirthForm(),
        AvatarForm.routeName: (context) => const AvatarForm(),
      },
    );
  }
}
