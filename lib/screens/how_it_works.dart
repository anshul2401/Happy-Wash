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

class HowItWorks extends StatefulWidget {
  @override
  _HowItWorksState createState() => _HowItWorksState();
}

class _HowItWorksState extends State<HowItWorks> {
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
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How It Works?',
                style: TextStyle(fontSize: 30, fontFamily: 'Alegreya'),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Turn any parking space into a mobile car wash with HappyWash mobile app at the time and place of your choice with following simple steps -',
                style: TextStyle(height: 1.5, fontSize: 18),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 30,
              ),

              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/cars2.jpg'),
                    radius: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      child: Text(
                    "Choose your vehicle type.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(height: 20, thickness: 1, color: Colors.black),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/cart.jpg'),
                    radius: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      child: Text(
                    "Choose a service.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
              //  Row(
              //    mainAxisAlignment: MainAxisAlignment.end,
              //    children: [

              //      Container(child: Text("Choose a service",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
              //      SizedBox(width: 20,),
              //      CircleAvatar(
              //       backgroundImage: AssetImage('images/cart.jpg'),
              //       radius: 50,
              //      ),
              //    ],
              //  ),
              SizedBox(
                height: 10,
              ),
              Divider(height: 20, thickness: 1, color: Colors.black),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/schedule.png'),
                    radius: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Pick a Date and Time',
                    style: TextStyle(
                        fontSize: 18, height: 1.5, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(height: 20, thickness: 1, color: Colors.black),
              SizedBox(
                height: 10,
              ),

              //  Row(
              //    mainAxisAlignment: MainAxisAlignment.end,
              //    children: [

              //      Container(child: Text("Submit Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
              //      SizedBox(width: 20,),
              //      CircleAvatar(
              //       backgroundImage: AssetImage('images/pen_paper.jpg'),
              //       radius: 50,
              //      ),
              //    ],
              //  ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/pen_paper.jpg'),
                    radius: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      child: Text(
                    "Submit details.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(height: 20, thickness: 1, color: Colors.black),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/tickmark.jpeg'),
                    radius: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Checkout',
                    style: TextStyle(
                        fontSize: 18, height: 1.5, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
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
