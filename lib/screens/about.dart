import 'package:flutter/material.dart';
import 'package:happy_wash/after_login.dart';

import 'package:happy_wash/login_d/stores/login_store.dart';
import 'package:happy_wash/notification.dart';
import 'package:happy_wash/profile.dart';
import 'package:happy_wash/screens/contact_us.dart';
import 'package:happy_wash/screens/faq.dart';
import 'package:happy_wash/screens/gallery.dart';

import 'package:happy_wash/yourBooking.dart';
import 'package:provider/provider.dart';

import 'how_it_works.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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
    final String aboutus =
        'HappyWash provide Car Cleaning/Washing service to our customers at the convenience of their home, office, or any other location which customer wants. Our trained, experienced, talented and passionate professionals provide the Best car Cleaning service at the doorstep of the customers. Technology helps in identifying problem at the root and communicate our professionals to carry necessary tools to complete the service.HappyWash redefines the entire car care experience. No longer do customers have to deal with inconvenient, inconsistent and frustrating visits to fixed car wash locations, instead, by using mobile apps, one can book and avail complete car washing services at any location he prefers and our mobile team will reach there in the scheduled time.Not only that all our employees have been background checked to ensure that we service your request on time by trusted people who are 100% accountable for quality service. We run police verification checks, reference checks etc to ensure that the service we offer is secure and your vehicle is at safe hands.';
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
                    // else if (selectedValue == 5)
                    //   {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) => Services()))
                    //   }
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
                    // PopupMenuItem(child: Text('Services'), value: 5),
                    // PopupMenuItem(child: Text('Your Booking'), value: 6),
                    PopupMenuItem(child: Text('Log Out'), value: 7),
                  ]),
          title: Text(
            'HappyWash',
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Us',
                style: TextStyle(fontSize: 30, fontFamily: 'Alegreya'),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  aboutus,
                  textAlign: TextAlign.justify,
                  softWrap: true,
                  style: TextStyle(fontSize: 18, height: 1.5),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Why Choose HappyWash?',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'HappyWash is the simplest and most reliable car cleaning mobile app to keep your car clean at your doorstep. We offer services like car wash, interior detailing, exterior detailing, Car sanitization, which has became essential due to COVID-19 outbreak. Our Unique three layer car wash formula (Water, foam & eco friendly spray) gives your car a brand new mirror finish and with service at comfort of your home.',
                style: TextStyle(fontSize: 18, height: 1.5),
              ),
            ],
          ),
        ]),
      ),
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
