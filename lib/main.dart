import 'package:flutter/material.dart';
import 'package:plawarn/Modules/auth/page/LoginMobile.dart';
import 'package:plawarn/Modules/auth/page/VerifyOtp.dart';
import 'package:plawarn/Modules/CreateProfile/Widget/Page/AvatarPage/AvatarForm.dart';
import 'package:plawarn/Modules/CreateProfile/Widget/Page/DateofbridPage/DateOfBirthPage.dart';
import 'package:plawarn/Modules/CreateProfile/Widget/Page/NamePage/NamePage.dart';
import 'package:plawarn/Modules/searchJop/page/SearchJop.dart';
import 'package:plawarn/Modules/skills/page/SelectSkillsJop/AddSkillsPage.dart';
import 'package:plawarn/page/404Page.dart';
import 'package:plawarn/page/HomePage.dart';
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
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
      },

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
