import 'package:creator/creator.dart';
import 'package:flutter/material.dart';
import 'package:gallery/screens/home/widgets/home.dart';
import 'package:sizer/sizer.dart';
import 'config/global_variables.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Local files
import 'config/routes.dart';

void main() {
  runApp(CreatorGraph( child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) =>
        MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalMaterialLocalizations.delegate
            ],
            scaffoldMessengerKey: snackbarKey,
            supportedLocales: const [
              Locale('en'),
              Locale('es_ES')
            ],
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'timesBold'),
            title: 'Vladi Gallery',
            routes: routes,
            initialRoute: HomeScreen.routeName
        ));
  }
}


