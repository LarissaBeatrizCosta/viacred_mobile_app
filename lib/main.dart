import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'controllers/inactivity_controller.dart';
import 'controllers/profile_controller.dart';
import 'controllers/rates_controller.dart';
import 'firebase_options.dart';
import 'i10/auth.dart';
import 'views/home_view.dart';
import 'views/routes/routes.dart';

///Configuração firebase
bool shouldUseFirebaseEmulator = false;

///Firebase
late final FirebaseApp app;

///Firebase
late final FirebaseAuth auth;

void main() async {
  Intl.defaultLocale = 'pt_BR';

  WidgetsFlutterBinding.ensureInitialized();

  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RatesController(),
        ),
        ChangeNotifierProvider(
          create: (_) => InactivityController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileController(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

///App
class MyApp extends StatelessWidget {
  ///Key do app
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => context.read<InactivityController>().userInteracted(),
      onPanDown: (_) => context.read<InactivityController>().userInteracted(),
      onScaleStart: (_) =>
          context.read<InactivityController>().userInteracted(),
      child: GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'DepotBold',
        ),
        localizationsDelegates: [
          FirebaseUILocalizations.withDefaultOverrides(const LabelOverrides()),
          FirebaseUILocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        title: 'Viacred Satisfaction',
        initialRoute: '/login',
        onGenerateRoute: Routes.createRoutes,
        routes: {
          '/home': (context) => const HomeView(),
        },
      ),
    );
  }
}
