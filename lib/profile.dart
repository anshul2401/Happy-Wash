import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:happy_wash/notification.dart';
import 'package:happy_wash/yourBooking.dart';
import 'package:happy_wash/login_d/stores/login_store.dart';

import 'package:happy_wash/orders.dart';
import 'package:happy_wash/screens/how_it_works.dart';
import 'package:happy_wash/screens/services.dart';
import 'package:provider/provider.dart';

import 'package:happy_wash/after_login.dart';
import 'package:happy_wash/login.dart';
import 'package:happy_wash/screens/about.dart';
import 'package:happy_wash/screens/contact_us.dart';
import 'package:happy_wash/screens/faq.dart';
import 'package:happy_wash/screens/gallery.dart';

class Profile extends StatefulWidget with ChangeNotifier{
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    

    void _onItemTapped(int index) {
      
      if (index == 0) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AfterLogin()));
      }
       if (index == 2) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => YourBooking()));
      }
      
    }

     
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
        padding: const EdgeInsets.only(top: 25,left: 10,right: 10),
        child: Column(
          children: [
            Text('Account Details',style: TextStyle(fontSize: 30,fontFamily: 'Alegreya'),),
              SizedBox(height: 30,),
            Table(
              
                    children: [
                      
                      TableRow(children: [
                        Text(
                          'Username:',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          authProvider.userModel.name==''? 'NA' : authProvider.userModel.name,
                          style: TextStyle(fontSize: 18),
                        ),
                      ]),
                      TableRow(children: [Text(''), Text('')]),
                      TableRow(children: [
                        Text(
                          'Address:',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          authProvider.userModel.address==''? 'NA' : authProvider.userModel.address,
                          style: TextStyle(fontSize: 18),
                        ),
                      ]),
                      TableRow(children: [Text(''), Text('')]),
                      TableRow(children: [
                        Text(
                        
                          'Moblie Number:',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          
                        ),
                        Text(
                          authProvider.userModel.number,
                          style: TextStyle(fontSize: 18),
                        ),
                      ]),
                      TableRow(children: [Text(''), Text('')]),
                      TableRow(
                        children: [
                        Text(
                          'Email ID:',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          
                        ),
                        
                        Text(
                         authProvider.userModel.email==''? 'NA' : authProvider.userModel.email,
                          style: TextStyle(fontSize: 18),
                        ),
                      ]),
                     
                    ],
                  ),
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
        currentIndex: 1,
        selectedItemColor: Color.fromRGBO(0, 127, 219, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
