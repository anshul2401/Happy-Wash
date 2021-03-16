import 'package:flutter/material.dart';
import 'package:happy_wash/auth.dart';
import 'dart:async';

import 'package:happy_wash/login_d/pages/splash_page.dart';
import 'package:happy_wash/login_d/stores/login_store.dart';
import 'package:happy_wash/order_provider.dart';
import 'package:happy_wash/order_service.dart';
import 'package:happy_wash/user.dart';
import 'package:happy_wash/user_provider.dart';
import 'package:happy_wash/user_services.dart';

import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: AuthProvider.initialize()),
      ChangeNotifierProvider.value(value: OrderProvider()),
      ChangeNotifierProvider.value(value: UserProvider()),
      StreamProvider(create: (context) => OrderServices().getUserOrders()),
      Provider<LoginStore>(
        create: (_) => LoginStore(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happy Wash',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Lato',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(fontSize: 25, fontFamily: 'Alegreya')))),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 3),
        () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SplashPage()))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //       stops: [0.3, 1],
      //       colors: [Color.fromRGBO(0, 127, 219, 1), Colors.white]),
      // ),
      color: Color.fromRGBO(0, 127, 219, 1),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            'HappyWash',
            style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Alegreya'),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:google_map_location_picker/generated/l10n.dart'
//     as location_picker;
// import 'package:google_map_location_picker/generated/l10n.dart';
// import 'package:google_map_location_picker/google_map_location_picker.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   LocationResult _pickedLocation;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
// //      theme: ThemeData.dark(),
//       title: 'location picker',
//       localizationsDelegates: const [
//         location_picker.S.delegate,
//         S.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: const <Locale>[
//         Locale('en', ''),
//         Locale('ar', ''),
//         Locale('pt', ''),
//         Locale('tr', ''),
//         Locale('es', ''),
//         Locale('it', ''),
//         Locale('ru', ''),
//       ],
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('location picker'),
//         ),
//         body: Builder(builder: (context) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 RaisedButton(
//                   onPressed: () async {
//                     String apiKey = 'AIzaSyA2CTGh2H0V-i5IYQnF49IJ9cf55vxBvuw';
//                     LocationResult result = await showLocationPicker(
//                       context, apiKey,
//                       initialCenter: LatLng(31.1975844, 29.9598339),
//                       automaticallyAnimateToCurrentLocation: true,
// //                      mapStylePath: 'assets/mapStyle.json',
//                       myLocationButtonEnabled: true,
//                       // requiredGPS: true,
//                       layersButtonEnabled: true,
//                       countries: ['IN'],

// //                      resultCardAlignment: Alignment.bottomCenter,
//                       desiredAccuracy: LocationAccuracy.best,
//                     );
//                     print("result = $result");
//                     setState(() => _pickedLocation = result);
//                   },
//                   child: Text('Pick location'),
//                 ),
//                 Text(_pickedLocation.toString()),
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
