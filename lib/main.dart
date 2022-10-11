import 'package:flutter/material.dart';
import 'package:plawarn/modules/auth/page/login_mobile.dart';
import 'package:plawarn/modules/auth/page/verify_otp.dart';
import 'package:plawarn/modules/createprofile/widget/page/avatarpage/avatar_form.dart';

import 'package:plawarn/modules/createprofile/widget/page/dateofbirthpage/dateofbirth_page.dart';
import 'package:plawarn/modules/createprofile/widget/page/namepage/name_page.dart';
import 'package:plawarn/modules/searchjop/page/search_jop.dart';
import 'package:plawarn/modules/skills/page/selectskillsjop/add_skills.dart';
import 'package:plawarn/page/404_page.dart';
import 'package:plawarn/page/home_page.dart';
import 'package:flutter/services.dart';
import 'package:plawarn/provider/view/user_view_model.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Tokenview()),
        // ChangeNotifierProvider(create: (_) => Userview()),
      ],
      child: MaterialApp(
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
        // initialRoute: '/LoginMobile',
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
      ),
    );
  }
}
