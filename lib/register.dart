// import 'package:flutter/material.dart';
// import 'package:happy_wash/after_login.dart';
// import 'package:happy_wash/auth.dart';
// import 'package:happy_wash/loding.dart';
// import 'package:happy_wash/login.dart';
// import 'package:provider/provider.dart';

// class RegistrationScreen extends StatefulWidget {
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final _key = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<UserProvider>(context);
//     // final categoryProvider = Provider.of<CategoryProvider>(context);
//     // final restaurantProvider = Provider.of<RestaurantProvider>(context);
//     // final productProvider = Provider.of<ProductProvider>(context);

//     return Container(
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               stops: [0.3, 1],
//               colors: [Colors.blue, Colors.white])),
//       child: Scaffold(
//         key: _key,
//         backgroundColor: Colors.transparent,
//         body: authProvider.status == Status.Authenticating
//             ? Loading()
//             : SingleChildScrollView(
//                 child: Column(
//                   children: <Widget>[
//                     SizedBox(
//                       height: 100,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Image.asset(
//                           "images/logo4.png",
//                           width: 150,
//                           height: 150,
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 40,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(12),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             border: Border.all(color: Colors.white),
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 10),
//                           child: TextFormField(
//                             controller: authProvider.name,
//                             decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 hintText: "Username",
//                                 icon: Icon(Icons.person)),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(12),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             border: Border.all(color: Colors.white),
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 10),
//                           child: TextFormField(
//                             controller: authProvider.email,
//                             decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 hintText: "Emails",
//                                 icon: Icon(Icons.email)),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(12),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             border: Border.all(color: Colors.white),
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 10),
//                           child: TextFormField(
//                             controller: authProvider.password,
//                             decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 hintText: "Password",
//                                 icon: Icon(Icons.lock)),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: GestureDetector(
//                         onTap: () async {
//                           if (!await authProvider.signUp()) {
//                             _key.currentState.showSnackBar(SnackBar(
//                                 content: Text("Resgistration failed!")));
//                             return;
//                           }
//                           // categoryProvider.loadCategories();
//                           // restaurantProvider.loadSingleRestaurant();
//                           // productProvider.loadProducts();
//                           authProvider.clearController();
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => AfterLogin()));
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: Color.fromRGBO(0, 127, 219, 1),
//                               border: Border.all(color: Colors.grey),
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Padding(
//                             padding: EdgeInsets.only(top: 10, bottom: 10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Text('Register',
//                                     style: TextStyle(
//                                         fontSize: 22, color: Colors.white))
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginScreen()));
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Text('Login Here', style: TextStyle(fontSize: 20))
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }
