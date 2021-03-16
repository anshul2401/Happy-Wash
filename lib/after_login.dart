import 'package:flutter/material.dart';
import 'package:happy_wash/admin/main.dart';

import 'package:happy_wash/carausel.dart';
import 'package:happy_wash/notification.dart';
import 'package:happy_wash/profile.dart';

import 'package:happy_wash/login_d/stores/login_store.dart';
import 'package:happy_wash/selcct_package.dart';

import 'package:happy_wash/yourBooking.dart';
import 'package:provider/provider.dart';
import 'screens/about.dart';
import 'screens/contact_us.dart';
import 'screens/faq.dart';
import 'screens/gallery.dart';
import 'screens/how_it_works.dart';

class AfterLogin extends StatefulWidget {
  @override
  _AfterLoginState createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Profile()));
    }
    if (index == 2) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => YourBooking()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginStore>(context);
    print(authProvider.userModel.number);
    if (authProvider.userModel.number == '+919340133342') {
      return AdminScreen();
    } else {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(0, 127, 219, 1),
            elevation: 5,
            leading: PopupMenuButton(
                onSelected: (int selectedValue) => {
                      if (selectedValue == 0)
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HowItWorks()))
                        }
                      else if (selectedValue == 1)
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Gallery()))
                        }
                      else if (selectedValue == 2)
                        {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => About()))
                        }
                      else if (selectedValue == 3)
                        {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Faq()))
                        }
                      else if (selectedValue == 4)
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactUs()))
                        }
                      else if (selectedValue == 7)
                        {
                          authProvider.signOut(context),
                        }
                    },
                icon: Icon(
                  Icons.menu,
                  size: 35,
                ),
                itemBuilder: (_) => [
                      PopupMenuItem(child: Text('How it works?'), value: 0),
                      PopupMenuItem(child: Text('Gallery'), value: 1),
                      PopupMenuItem(child: Text('About'), value: 2),
                      PopupMenuItem(child: Text('FAQ\'s'), value: 3),
                      PopupMenuItem(child: Text('Contact Us'), value: 4),
                      PopupMenuItem(child: Text('Log Out'), value: 7),
                    ]),
            title: Text(
              'HappyWash',
              style: TextStyle(fontSize: 25, fontFamily: 'Alegreya'),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            actions: [
              GestureDetector(
                child: Icon(
                  Icons.notifications,
                  size: 35,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationScreen(),
                      ));
                },
              ),
            ]),
        body: ListView(
          children: [
            Column(
              children: [
                CarouselWithIndicatorDemo(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Choose Your Car Segment',
                  style: TextStyle(fontSize: 30, fontFamily: 'Alegreya'),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey[400],
                                        offset: Offset(1, 10),
                                        blurRadius: 5)
                                  ]),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage('images/hatchBack2.jpg'),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('Hatch Back',
                                style: TextStyle(
                                  fontSize: 18,
                                ))
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Package(1),
                            ));
                      },
                    ),
                    GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    // border: Border.all(width: 1, color: Colors.black),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[400],
                                          offset: Offset(1, 10),
                                          blurRadius: 5)
                                    ]),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      AssetImage('images/sedan2.jpg'),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('Sedan', style: TextStyle(fontSize: 18)),
                              // Text('@ Rs 299', style: TextStyle(fontSize: 20))
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Package(2),
                              ));
                        }),
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                  // border: Border.all(width: 1, color: Colors.black),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey[400],
                                        offset: Offset(1, 10),
                                        blurRadius: 5)
                                  ]),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage('images/suv4.jpg'),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('SUV', style: TextStyle(fontSize: 18)),
                            // Text('@ Rs 399', style: TextStyle(fontSize: 20))
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Package(4),
                            ));
                      },
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     SizedBox(
                //       width: 5,
                //     ),
                //     GestureDetector(
                //         child: Padding(
                //           padding: const EdgeInsets.all(8),
                //           child: Column(
                //             children: [
                //               Container(
                //                 decoration: BoxDecoration(
                //                     color: Colors.white,
                //                     borderRadius: BorderRadius.circular(100),
                //                     // border: Border.all(width: 1, color: Colors.black),
                //                     boxShadow: [
                //                       BoxShadow(
                //                           color: Colors.grey[400],
                //                           offset: Offset(1, 10),
                //                           blurRadius: 5)
                //                     ]),
                //                 child: CircleAvatar(
                //                   radius: 40,
                //                   backgroundImage:
                //                       AssetImage('images/compact_suv.jpg'),
                //                 ),
                //               ),
                //               SizedBox(height: 8),
                //               Text('Compact SUV',
                //                   style: TextStyle(fontSize: 18)),
                //               // Text('@ Rs 349', style: TextStyle(fontSize: 20))
                //             ],
                //           ),
                //         ),
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => Package(3),
                //               ));
                //         }),
                //     GestureDetector(
                //       child: Padding(
                //         padding: const EdgeInsets.all(8),
                //         child: Column(
                //           children: [
                //             Container(
                //               decoration: BoxDecoration(
                //                   color: Colors.white,
                //                   borderRadius: BorderRadius.circular(100),
                //                   // border: Border.all(width: 1, color: Colors.black),
                //                   boxShadow: [
                //                     BoxShadow(
                //                         color: Colors.grey[400],
                //                         offset: Offset(1, 10),
                //                         blurRadius: 5)
                //                   ]),
                //               child: CircleAvatar(
                //                 radius: 40,
                //                 backgroundImage: AssetImage('images/muv.jpg'),
                //               ),
                //             ),
                //             SizedBox(height: 8),
                //             Text('MUV', style: TextStyle(fontSize: 18)),
                //             // Text('@ Rs 499', style: TextStyle(fontSize: 20))
                //           ],
                //         ),
                //       ),
                //       onTap: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => Package(5),
                //             ));
                //       },
                //     ),
                //     SizedBox(
                //       width: 5,
                //     ),
                //   ],
                // )
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 35,
          backgroundColor: Colors.white,
          elevation: 5,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Service History',
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Color.fromRGBO(0, 127, 219, 1),
          onTap: _onItemTapped,
        ),
      );
    }
  }
}
