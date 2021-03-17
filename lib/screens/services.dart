import 'package:flutter/material.dart';
import 'package:happy_wash/after_login.dart';

import 'package:happy_wash/login_d/stores/login_store.dart';
import 'package:happy_wash/notification.dart';
import 'package:happy_wash/profile.dart';
import 'package:happy_wash/screens/about.dart';
import 'package:happy_wash/screens/contact_us.dart';
import 'package:happy_wash/screens/faq.dart';
import 'package:happy_wash/screens/gallery.dart';
import 'package:happy_wash/yourBooking.dart';
import 'package:provider/provider.dart';
import 'how_it_works.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AfterLogin()));
    }

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
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 127, 219, 1),
          elevation: 5,
          // leading: Image.asset('images/logo4.png'),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Gallery()))
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
                    else if (selectedValue == 5)
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Services()))
                      }
                    // else if (selectedValue == 6)
                    //   {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => YourBooking()))
                    //   }
                    else if (selectedValue == 7)
                      {
                        authProvider.signOut(context),
                        // authProvider.status == Status.Authenticating
                        //     ? Loading()
                        //     : Navigator.pushReplacement(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => Login()))
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
                    PopupMenuItem(child: Text('Services'), value: 5),
                    // PopupMenuItem(child: Text('Your Booking'), value: 6),
                    PopupMenuItem(child: Text('Log Out'), value: 7),
                  ]),
          title: Text(
            'SERVICES',
            style: TextStyle(fontSize: 25),
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
      body: Text("Content here"),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        backgroundColor: Colors.white,
        elevation: 5,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('Service History'),
          ),
        ],
        selectedItemColor: Colors.grey[600],
        onTap: _onItemTapped,
      ),
    );
  }
}
