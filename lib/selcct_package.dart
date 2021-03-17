import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:happy_wash/after_login.dart';
import 'package:happy_wash/booking_test.dart';
import 'package:happy_wash/login_d/stores/login_store.dart';
import 'package:happy_wash/profile.dart';

import 'package:happy_wash/yourBooking.dart';
import 'package:provider/provider.dart';

// ignore: unused_import
import 'confirm_booking.dart';

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
        print(p['hatch_back']['standard_wash']);
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
        Text(
          p['hatch_back']['standard_wash'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['hatch_back']['premium_bike'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['hatch_back']['standard_bike'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['hatch_back']['two_premium'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['hatch_back']['four_premium'],
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
        Text(
          p['sedan']['standard_wash'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['sedan']['premium_bike'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['sedan']['standard_bike'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['sedan']['two_premium'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['sedan']['four_premium'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
      ],
      [
        // Text(
        //   p['compact_suv']['premium_wash'],
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Alegreya'),
        // ),
        // Text(
        //   p['compact_suv']['interior_detailing'],
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Alegreya'),
        // ),
        // Text(
        //   p['compact_suv']['exterior_wash'],
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Alegreya'),
        // ),
        // Text(
        //   p['compact_suv']['standard_wash'],
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Alegreya'),
        // ),
        // Text(
        //   p['compact_suv']['premium_bike'],
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Alegreya'),
        // ),
        // Text(
        //   p['compact_suv']['standard_bike'],
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Alegreya'),
        // ),
        // Text(
        //   p['compact_suv']['two_premium'],
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Alegreya'),
        // ),
        // Text(
        //   p['compact_suv']['four_premium'],
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Alegreya'),
        // ),
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
        Text(
          p['suv']['standard_wash'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['suv']['premium_bike'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['suv']['standard_bike'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['suv']['two_premium'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
        Text(
          p['suv']['four_premium'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alegreya'),
        ),
      ],
      [
        // Text(
        //   p['muv']['premium_wash'],
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Alegreya'),
        // ),
        // Text(
        //   p['muv']['interior_detailing'],
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Alegreya'),
        // ),
        // Text(
        //   p['muv']['exterior_wash'],
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Alegreya'),
        // ),
        // Text(
        //   p['muv']['standard_wash'],
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Alegreya'),
        // ),
        // Text(
        //   p['muv']['premium_bike'],
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Alegreya'),
        // ),
        // Text(
        //   p['muv']['standard_bike'],
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Alegreya'),
        // ),
        // Text(
        //   p['muv']['two_premium'],
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Alegreya'),
        // ),
        // Text(
        //   p['muv']['four_premium'],
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Alegreya'),
        // ),
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

    // print(packagePrice[widget.carType - 1][0]);

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
                height: 10,
              ),
              Text(
                'Regular Package',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Alegreya',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 5,
                child: ExpansionTile(
                  title: RadioListTile(
                    value: 1,
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
                      "•	Complete engine water rinse",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete chassis/Undercarriage wash",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Side doors panel polish",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete mirror/glass clean",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Tyre polish",
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
                    value: 2,
                    groupValue: selectedRadioTile,
                    title: Text(
                      "Standard Wash",
                      style: TextStyle(fontSize: 18),
                    ),
                    onChanged: (val) {
                      setSelectedRadioTile(val);
                    },
                    activeColor: Color.fromRGBO(0, 127, 219, 1),
                    secondary: packagePrice[widget.carType - 1][3],
                  ),
                  tilePadding: EdgeInsets.only(right: 10),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,

                  childrenPadding:
                      EdgeInsets.only(left: 30, bottom: 10, right: 20),
                  // subtitle: Text("  Sub Title's"),
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
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Clean front frill and mud flaps",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Dashboard clean and polish",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete Interior boot space cleaning",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete Interior vacuuming ",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete engine water rinse",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete mirror/glass clean",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Tyre Polish",
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
                    value: 3,
                    groupValue: selectedRadioTile,
                    title: Text(
                      "Interior Wash",
                      style: TextStyle(fontSize: 18),
                    ),
                    onChanged: (val) {
                      setSelectedRadioTile(val);
                    },
                    activeColor: Color.fromRGBO(0, 127, 219, 1),
                    secondary: packagePrice[widget.carType - 1][1],
                    // secondary: Text('s'),
                  ),
                  tilePadding: EdgeInsets.only(right: 10),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,

                  childrenPadding:
                      EdgeInsets.only(left: 30, bottom: 10, right: 20),
                  // subtitle: Text("  Sub Title's"),
                  children: <Widget>[
                    Text(
                      "•	Dashboard clean and polish",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Car Interior Sanitisation",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Cleaning of hinges and side doors",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete Interior boot space cleaning",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete Interior vacuuming ",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Side doors panel polish",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete mirror/glass clean",
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
                    // secondary: Text('s'),
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
                      "•	Complete chassis/Undercarriage wash",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete engine water rinse",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete mirror/glass clean",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Tyre polish",
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
                    value: 5,
                    groupValue: selectedRadioTile,
                    title: Text(
                      "Premium + Bike wash",
                      style: TextStyle(fontSize: 18),
                    ),
                    onChanged: (val) {
                      setSelectedRadioTile(val);
                    },
                    activeColor: Color.fromRGBO(0, 127, 219, 1),
                    secondary: packagePrice[widget.carType - 1][4],
                  ),
                  tilePadding: EdgeInsets.only(right: 10),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,

                  childrenPadding:
                      EdgeInsets.only(left: 30, bottom: 10, right: 20),
                  // subtitle: Text("  Sub Title's"),
                  children: <Widget>[
                    Text(
                      "•	Complete car & Bike water rinse",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Exterior car & Bike foam wash",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Eco clean and gloss of car & bike",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Clean front frill and mud flaps ",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Dashboard clean and polish",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Car Interior Sanitisation",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Cleaning of hinges and side doors",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete Interior boot space cleaning",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete Interior vacuuming",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete engine water rinse of Car & Bike",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete chassis/Undercarriage wash",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Side doors panel polish",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete mirror/glass clean",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Tyre polish",
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
                    value: 6,
                    groupValue: selectedRadioTile,
                    title: Text(
                      "Standard + Bike Wash",
                      style: TextStyle(fontSize: 18),
                    ),
                    onChanged: (val) {
                      setSelectedRadioTile(val);
                    },
                    activeColor: Color.fromRGBO(0, 127, 219, 1),
                    secondary: packagePrice[widget.carType - 1][5],
                  ),
                  tilePadding: EdgeInsets.only(right: 10),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,

                  childrenPadding:
                      EdgeInsets.only(left: 30, bottom: 10, right: 20),
                  // subtitle: Text("  Sub Title's"),
                  children: <Widget>[
                    Text(
                      "•	Complete car & Bike water rinse ",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Exterior car & Bike foam wash",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Clean front frill and mud flaps",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Dashboard clean and polish",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete Interior boot space cleaning",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete Interior vacuuming",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete engine water rinse of Car & Bike",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete mirror/glass clean",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Tyre polish",
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
                height: 20,
              ),
              Text(
                'Monthly Package',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Alegreya',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 5,
                child: ExpansionTile(
                  title: RadioListTile(
                    value: 7,
                    groupValue: selectedRadioTile,
                    title: Text(
                      "2 Premium wash per month",
                      style: TextStyle(fontSize: 18),
                    ),
                    onChanged: (val) {
                      setSelectedRadioTile(val);
                    },
                    activeColor: Color.fromRGBO(0, 127, 219, 1),
                    secondary: packagePrice[widget.carType - 1][6],
                  ),
                  tilePadding: EdgeInsets.only(right: 10),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,

                  childrenPadding:
                      EdgeInsets.only(left: 30, bottom: 10, right: 20),
                  // subtitle: Text("  Sub Title's"),
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
                      "•	Complete engine water rinse",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete chassis/Undercarriage wash",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Side doors panel polish",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete mirror/glass clean",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Tyre polish",
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
                    value: 8,
                    groupValue: selectedRadioTile,
                    title: Text(
                      "4 Premium wash per month",
                      style: TextStyle(fontSize: 18),
                    ),
                    onChanged: (val) {
                      setSelectedRadioTile(val);
                    },
                    activeColor: Color.fromRGBO(0, 127, 219, 1),
                    secondary: packagePrice[widget.carType - 1][7],
                  ),
                  tilePadding: EdgeInsets.only(right: 10),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,

                  childrenPadding:
                      EdgeInsets.only(left: 30, bottom: 10, right: 20),
                  // subtitle: Text("  Sub Title's"),
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
                      "•	Complete engine water rinse",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete chassis/Undercarriage wash",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Side doors panel polish",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Complete mirror/glass clean",
                      style: TextStyle(fontSize: 18, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "•	Tyre polish",
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
