import 'package:flutter/material.dart';
import 'package:happy_wash/after_login.dart';
import 'package:happy_wash/auth.dart';
import 'package:happy_wash/loding.dart';
import 'package:happy_wash/login.dart';
import 'package:happy_wash/login_d/stores/login_store.dart';
import 'package:happy_wash/notification.dart';
import 'package:happy_wash/profile.dart';
import 'package:happy_wash/screens/about.dart';
import 'package:happy_wash/screens/contact_us.dart';

import 'package:happy_wash/screens/gallery.dart';
import 'package:happy_wash/screens/services.dart';
import 'package:happy_wash/yourBooking.dart';
import 'package:provider/provider.dart';

import 'how_it_works.dart';

class Faq extends StatefulWidget {
  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
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
    List<String> faq=[
      '',
    ];
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HowItWorks()))
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ContactUs()))
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
            icon: Icon(Icons.menu,size: 35,),
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
        title: Text('HappyWash',style:TextStyle(fontSize: 25),textAlign: TextAlign.center,),
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
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
                  children: [Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('FAQ\'s',style: TextStyle(fontSize: 30,fontFamily: 'Alegreya'),),
              SizedBox(height: 10,),
              Card(
                elevation: 5,
                              child: ExpansionTile(
            leading: Icon(Icons.help),
          
            title: Text("How Long does the service Take?",
            style: TextStyle(fontSize: 20,),
                  textAlign:TextAlign.justify),
                  childrenPadding: EdgeInsets.all(15),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
            // subtitle: Text("  Sub Title's"),
            children: <Widget>[
                Text(
                  "HappyWash car care and detailing service completion time vary by size of vehicle, condition of vehicle and service selected.",
                  style: TextStyle(fontSize: 18,height: 1.5),
                  textAlign:TextAlign.justify,
                  
                ),
                 Text(
                  "- Hatchback - 30-40 minutes",
                  style: TextStyle(fontSize: 18,height: 1.5),
                  textAlign:TextAlign.justify,
                  
                ),
                Text(
                  "- Sedan and Compact SUV - 40-50 minutes",
                  style: TextStyle(fontSize: 18,height: 1.5),
                  textAlign:TextAlign.start,
                  
                ),
                Text(
                  "- SUV - 1 hour",
                  style: TextStyle(fontSize: 18,height: 1.5),
                  textAlign:TextAlign.justify,
                  
                ),
                Text(
                  "- MUV - 1 hour 20 minute",
                  style: TextStyle(fontSize: 18,height: 1.5),
                  textAlign:TextAlign.justify,
                  
                ),
                Text(
                  "If you service your vehicle at home it normally takes 15 minutes for us to set up and 15 minutes to pack up our equipment. If you have your vehicle serviced at a commercial location-office parking etc. your key pick up time and key return time may be extended for a variety of operational reasons. If you need your car back by a certain time, please let us know while scheduling your appointment.",
                  style: TextStyle(fontSize: 18,height: 1.5),
                  textAlign:TextAlign.justify,
                  
                ),

                
            ],
          ),
              ),
              SizedBox(height: 10,),
              Card(
                elevation: 5,
                              child: ExpansionTile(
            leading: Icon(Icons.help),
          
            title: Text("Seden Vs Non Sedan Vs Hatchback",
            style: TextStyle(fontSize: 20,),
                  textAlign:TextAlign.justify),
                  childrenPadding: EdgeInsets.all(15),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
            // subtitle: Text("  Sub Title's"),
            children: <Widget>[
                Text('Sedan',style: TextStyle(fontSize: 18,height: 1.5,fontWeight: FontWeight.bold),
                  textAlign:TextAlign.start,),
                Text(
                  "4 doors or less and 2 rows of seats or less with extended booth space.",
                  style: TextStyle(fontSize: 18,height: 1.5),
                  textAlign:TextAlign.justify,
                  
                ),
                SizedBox(height: 5,),
                Text('Non Sedan',style: TextStyle(fontSize: 18,height: 1.5,fontWeight: FontWeight.bold),
                  textAlign:TextAlign.start,),
                Text(
                  "3rd row of seats and 3rd door hatch. (SUV, minivans, XL trucks).",
                  style: TextStyle(fontSize: 18,height: 1.5),
                  textAlign:TextAlign.justify,
                  
                ),
                SizedBox(height: 5,),
                Text('Hatchback',style: TextStyle(fontSize: 18,height: 1.5,fontWeight: FontWeight.bold),
                  textAlign:TextAlign.start,),
                Text(
                  "4 doors or less and 2 rows of seats or less and without extended booth space.",
                  style: TextStyle(fontSize: 18,height: 1.5),
                  textAlign:TextAlign.justify,
                  
                ),
                SizedBox(height: 10,),
                Text(
                  "We reserve the right to apply additional fees for excessive dirt, sand, mold, dog hair or other factors that may impact the time required to serve your vehicle.",
                  style: TextStyle(fontSize: 18,height: 1.5),
                  textAlign:TextAlign.justify,
                  
                ),
                
            ],
          ),
              ),
              SizedBox(height: 10,),
              Card(
                elevation: 5,
                              child: ExpansionTile(
            leading: Icon(Icons.help),
          
            title: Text("How do I pay?",
            style: TextStyle(fontSize: 20,),
                  textAlign:TextAlign.justify),
                  childrenPadding: EdgeInsets.all(15),
            // subtitle: Text("  Sub Title's"),
            children: <Widget>[
                Text(
                  "HappyWash accepts credit card/debit card/net banking/cash payments for services.",
                  style: TextStyle(fontSize: 18,height: 1.5),
                  textAlign:TextAlign.justify,
                  
                ),
                
            ],
          ),
              ),
              SizedBox(height: 10,),
              Card(
                elevation: 5,
                              child: ExpansionTile(
            leading: Icon(Icons.help),
          
            title: Text("What about the damage to the car?",
            style: TextStyle(fontSize: 20,),
                  textAlign:TextAlign.justify),
                  childrenPadding: EdgeInsets.all(15),
            // subtitle: Text("  Sub Title's"),
            children: <Widget>[
                Text(
                  "Our technicians do a note of any obvious major damages to the vehicle (dents, deep scratches etc.) All cars are considered used and damaged to some extent- roap chips, minor scuffs, stains in carpets, etc. if you believe your vehicle to be in perfect condition, please note this on the service request and we will do a more detailed inspection prior to beginning services.",
                  style: TextStyle(fontSize: 18,height: 1.5),
                  textAlign:TextAlign.justify,
                  
                ),
                
            ],
          ),
              ),
              
              
            ],
          ),
                  ]
        ),
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
