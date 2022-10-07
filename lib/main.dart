import 'package:flutter/material.dart';
import 'package:plawarn/Modules/CreateProfile/Components/Page/AvatarPage/AvatarForm.dart';
import 'package:plawarn/Modules/CreateProfile/Components/Page/DateofbridPage/DateOfBirthPage.dart';
import 'package:plawarn/Modules/CreateProfile/Components/Page/NamePage/NamePage.dart';
import 'package:plawarn/Modules/Skills/Components/Page/SelectSkillsJop/AddSkillsPage.dart';

import 'package:plawarn/Page/HomePage.dart';
import 'package:plawarn/Modules/Auth/Components/Page/LoginMobile.dart';

import 'package:plawarn/Modules/Auth/Components/Page/VerifyOtp.dart';
import 'package:plawarn/Modules/SearchJop/Components/Page/SearchJop.dart';

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
        NamePage.routeName: (context) => const NamePage(),
        DateOfBirthPage.routeName: (context) => const DateOfBirthPage(),
        AvatarPage.routeName: (context) => const AvatarPage(),
        SearchJop.routeName: (context) => const SearchJop(),
        AddSkills.routeName: (context) => const AddSkills(),
      },
    );
  }
}
