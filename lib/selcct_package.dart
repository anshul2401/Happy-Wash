import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:happy_wash/after_login.dart';
import 'package:happy_wash/booking_test.dart';
import 'package:happy_wash/login_d/stores/login_store.dart';
import 'package:happy_wash/profile.dart';
import 'package:happy_wash/screens/about.dart';
import 'package:happy_wash/screens/contact_us.dart';
import 'package:happy_wash/screens/faq.dart';
import 'package:happy_wash/screens/gallery.dart';
import 'package:happy_wash/screens/how_it_works.dart';
import 'package:happy_wash/screens/services.dart';
import 'package:happy_wash/yourBooking.dart';
import 'package:provider/provider.dart';

// ignore: unused_import
import 'confirm_booking.dart';

import 'orders.dart';

class Package extends StatefulWidget {
  final int carType;

  Package(this.carType) : super();
  final String title = "HappyWash";

  @override
  PackageState createState() => PackageState();
}

class PackageState extends State<Package> {
  final CollectionReference carPrice = Firestore.instance.collection('price');
  var prices;
  Future getPrice() async {
    try {
      await carPrice.getDocuments().then((value) {
        value.documents.forEach((element) {
          prices = element.data;
        });
      });
      return prices;
    } catch (e) {
      print(e.toString());
    }
  }

  var p;
  @override
  void initState() {
    super.initState();
    fetchPrice();
    selectedRadioTile = 0;
  }

  fetchPrice() async {
    dynamic prices = await getPrice();
    if (prices == null) {
      print('error');
    } else {
      setState(() {
        p = prices;
      });
    }
  }

  int selectedRadioTile;

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<List<Text>> packagePrice = [
      [
        Text(
          p['hatch_back']['premium_wash'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['hatch_back']['interior_detailing'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['hatch_back']['exterior_wash'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
      ],
      [
        Text(
          p['sedan']['premium_wash'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['sedan']['interior_detailing'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['sedan']['exterior_wash'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
      ],
      [
        Text(
          p['compact_suv']['premium_wash'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['compact_suv']['interior_detailing'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['compact_suv']['exterior_wash'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
      ],
      [
        Text(
          p['suv']['premium_wash'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['suv']['interior_detailing'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['suv']['exterior_wash'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
      ],
      [
        Text(
          p['muv']['premium_wash'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['muv']['interior_detailing'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['muv']['exterior_wash'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
      ],
    ];
    final authProvider = Provider.of<LoginStore>(context);
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 127, 219, 1),
        elevation: 5,

        title: Text(
          'HappyWash',
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        // actions: [

        //   Icon(Icons.notifications,size: 35,)
        // ]
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Choose Package',
                  style: TextStyle(fontSize: 30, fontFamily: 'Alegreya'),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // ExpandablePanel(
              //   header: Card(
              //     elevation: 5,
              //     child: RadioListTile(
              //       value: 1,
              //       groupValue: selectedRadioTile,
              //       title: Text(
              //         "Package",
              //         style: TextStyle(fontSize: 20),
              //       ),

              //       onChanged: (val) {
              //         setSelectedRadioTile(val);
              //       },
              //       activeColor: Color.fromRGBO(0, 127, 219, 1),
              //       // secondary: Text('Rs xxx',style: TextStyle(fontSize: 20),),
              //       secondary: packagePrice[widget.carType - 1][0],
              //     ),
              //   ),
              //   // collapsed: Text("COntent", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
              //   expanded: Text(
              //     "ckiokt",
              //     softWrap: true,
              //   ),
              //   headerAlignment: ExpandablePanelHeaderAlignment.center,
              //   // tapHeaderToExpand: true,
              //   // hasIcon: true,
              // ),
              Card(
                elevation: 5,
                child: ExpansionTile(
                  title: RadioListTile(
                    value: 2,
                    groupValue: selectedRadioTile,
                    title: Text(
                      "Premium Wash",
                      style: TextStyle(fontSize: 18),
                    ),
                    onChanged: (val) {
                      setSelectedRadioTile(val);
                    },
                    activeColor: Color.fromRGBO(0, 127, 219, 1),
                    secondary: packagePrice[widget.carType - 1][0],
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                  childrenPadding:
                      EdgeInsets.only(left: 30, bottom: 10, right: 20),
                  tilePadding: EdgeInsets.only(
                    right: 10,
                  ),
                  children: <Widget>[
                    Text(
                      "•	Complete car water rinse",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Exterior car foam wash",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Eco glass clean & gloss",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Clean front grill & mud flaps",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Dashboard cleaning & shine",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Car interior Sanitization ",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Cleaning of Hinges & side doors ",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete interior boot space cleaning",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete interior vacuuming",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Water and Electricity is to be provided by the customer",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 15,
              ),
              Card(
                elevation: 5,
                child: ExpansionTile(
                  title: RadioListTile(
                    value: 3,
                    groupValue: selectedRadioTile,
                    title: Text(
                      "Interior Detailing",
                      style: TextStyle(fontSize: 18),
                    ),
                    onChanged: (val) {
                      setSelectedRadioTile(val);
                    },
                    activeColor: Color.fromRGBO(0, 127, 219, 1),
                    secondary: packagePrice[widget.carType - 1][1],
                  ),
                  tilePadding: EdgeInsets.only(right: 10),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,

                  childrenPadding:
                      EdgeInsets.only(left: 30, bottom: 10, right: 20),
                  // subtitle: Text("  Sub Title's"),
                  children: <Widget>[
                    Text(
                      "•	Complete interior vacuuming",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Car Interior Deep Cleaning",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Dashboard cleaning & shine",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Cleaning of Hinges & side doors",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Car interior Sanitization ",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete interior boot space cleaning",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Water and Electricity is to be provided by the customer",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 15,
              ),
              Card(
                elevation: 5,
                child: ExpansionTile(
                  title: RadioListTile(
                    value: 4,
                    groupValue: selectedRadioTile,
                    title: Text(
                      "Exterior Wash",
                      style: TextStyle(fontSize: 18),
                    ),
                    onChanged: (val) {
                      setSelectedRadioTile(val);
                    },
                    activeColor: Color.fromRGBO(0, 127, 219, 1),
                    secondary: packagePrice[widget.carType - 1][2],
                  ),
                  tilePadding: EdgeInsets.only(right: 10),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,

                  childrenPadding:
                      EdgeInsets.only(left: 30, bottom: 10, right: 20),
                  // subtitle: Text("  Sub Title's"),
                  children: <Widget>[
                    Text(
                      "•	Complete Car Water rinse ",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Exterior car foam wash",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Eco clean & gloss",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Clean front grill & mud flaps",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Clean tyre & shine ",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Clean complete chassis",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Water and Electricity is to be provided by the customer",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),

              GestureDetector(
                onTap: () {
                  selectedRadioTile == 0
                      // ignore: unnecessary_statements
                      ? null
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Booking(widget.carType, selectedRadioTile)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: selectedRadioTile == 0
                            ? Colors.grey
                            : Color.fromRGBO(0, 127, 219, 1),
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // RaisedButton(
              //     child: Text('Book Wash'),
              //     textColor: Colors.white,
              //     color: selectedRadioTile == 0
              //         ? Colors.grey
              //         : Color.fromRGBO(0, 127, 219, 1),
              //     onPressed: () {
              //       selectedRadioTile == 0
              //           // ignore: unnecessary_statements
              //           ? null
              //           : Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => YourBooking()));
              //       // builder: (context) => BookingConfirmed()));
              //     })
            ],
          ),
        ),
      ]),
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
