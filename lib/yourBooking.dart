import 'package:flutter/material.dart';
import 'package:happy_wash/auth.dart';
import 'package:happy_wash/login_d/stores/login_store.dart';
import 'package:happy_wash/notification.dart';

import 'package:happy_wash/orders.dart';
import 'package:happy_wash/screens/how_it_works.dart';
import 'package:happy_wash/screens/services.dart';
import 'package:provider/provider.dart';

import 'package:happy_wash/after_login.dart';
import 'package:happy_wash/profile.dart';
import 'package:happy_wash/screens/about.dart';
import 'package:happy_wash/screens/contact_us.dart';
import 'package:happy_wash/screens/faq.dart';
import 'package:happy_wash/screens/gallery.dart';

class YourBooking extends StatefulWidget {
  @override
  _YourBookingState createState() => _YourBookingState();
}

class _YourBookingState extends State<YourBooking> {
  @override
  Widget build(BuildContext context) {
    

    void _onItemTapped(int index) {
     

      if (index == 0) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AfterLogin()));
      }
      if (index == 1) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Profile()));
      }
    }

    // final authProvider = Provider.of<AuthProvider>(context);
    final authProvider = Provider.of<LoginStore>(context);
    // final user = Provider.of<AuthProvider>(context);
    final user = Provider.of<LoginStore>(context);

    final order = Provider.of<List<OrderItem>>(context)
        .where((element) => element.userId == user.firebaseUser.uid)
        .toList();
        print(order.length);

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
      body: 
      order.length != 0
          ? ListView.builder(
              itemCount: order.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(left:10.0,right: 10,top: 10),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text('Booked On'),
                      subtitle:
                          Text(order[index].date + ' At ' + order[index].time),
                      trailing: 
                      Text.rich(TextSpan(children: [
                        TextSpan(
            text: 'Status: ',
            style: TextStyle(fontWeight: FontWeight.bold)
           ),
                TextSpan(
            text: order[index].status,
            style: TextStyle(
                
                color: order[index].status=='Pending'? Colors.red[900]:Colors.green[900]))
                      ])),
                      // Text('Status: ' + order[index].status,
                      //     style: TextStyle(color: Colors.red[900])),
                    ),
                  ),
                );
              })
          : Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/nor_service3.png'),
              Text('Listen to your Car.',style: TextStyle(fontSize: 18),),
              Text('Book a Wash Now!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
              ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        backgroundColor: Colors.white,
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
        currentIndex: 2,
        selectedItemColor: Color.fromRGBO(0, 127, 219, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
