import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:happy_wash/after_login.dart';
import 'package:happy_wash/login_d/stores/login_store.dart';

import 'package:happy_wash/orders.dart';
import 'package:happy_wash/profile.dart';
import 'package:happy_wash/taking_details.dart';
import 'package:happy_wash/user_services.dart';
import 'package:happy_wash/yourBooking.dart';
import 'package:provider/provider.dart';
import 'package:happy_wash/date_picker/date_picker_widget.dart';
import 'package:intl/intl.dart';

class Booking extends StatefulWidget {
  final int carType, package;
  Booking(this.carType, this.package);
  @override
  _BookingState createState() => _BookingState(carType);
}

class _BookingState extends State<Booking> {
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
  }

  fetchPrice() async {
    dynamic prices = await getPrice();
    if (prices == null) {
      print('error');
    } else {
      setState(() {
        p = prices;
      });
      // print(p['hatch_back']['interior_detailing']);
    }
  }

  final getuser = UserServices();
  final int carType;
  _BookingState(this.carType);

  String price(int carType) {
    if (carType == 1) {
      if (widget.package == 1) {
        return p['hatch_back']['premium_wash'];
      } else if (widget.package == 2) {
        return p['hatch_back']['standard_wash'];
      } else if (widget.package == 3) {
        return p['hatch_back']['interior_wash'];
      } else if (widget.package == 4) {
        return p['hatch_back']['exterior_wash'];
      } else if (widget.package == 5) {
        return p['hatch_back']['premium_bike'];
      } else if (widget.package == 6) {
        return p['hatch_back']['standard_bike'];
      } else if (widget.package == 7) {
        return p['hatch_back']['two_premium'];
      } else if (widget.package == 8) {
        return p['hatch_back']['four_premium'];
      }
    } else if (carType == 2) {
      if (widget.package == 1) {
        return p['sedan']['premium_wash'];
      } else if (widget.package == 2) {
        return p['sedan']['standard_wash'];
      } else if (widget.package == 3) {
        return p['sedan']['interior_wash'];
      } else if (widget.package == 4) {
        return p['sedan']['exterior_wash'];
      } else if (widget.package == 5) {
        return p['sedan']['premium_bike'];
      } else if (widget.package == 6) {
        return p['sedan']['standard_bike'];
      } else if (widget.package == 7) {
        return p['sedan']['two_premium'];
      } else if (widget.package == 8) {
        return p['sedan']['four_premium'];
      }
    } else if (carType == 3) {
      if (widget.package == 1) {
        return '100';
      } else if (widget.package == 2) {
        return p['compact_suv']['premium_wash'];
      } else if (widget.package == 3) {
        return p['compact_suv']['interior_detailing'];
      } else if (widget.package == 4) {
        return p['compact_suv']['exterior_wash'];
      }
    } else if (carType == 4) {
      if (widget.package == 1) {
        return p['suv']['premium_wash'];
      } else if (widget.package == 2) {
        return p['suv']['standard_wash'];
      } else if (widget.package == 3) {
        return p['suv']['interior_wash'];
      } else if (widget.package == 4) {
        return p['suv']['exterior_wash'];
      } else if (widget.package == 5) {
        return p['suv']['premium_bike'];
      } else if (widget.package == 6) {
        return p['suv']['standard_bike'];
      } else if (widget.package == 7) {
        return p['suv']['two_premium'];
      } else if (widget.package == 8) {
        return p['suv']['four_premium'];
      }
    } else if (carType == 5) {
      if (widget.package == 1) {
        return '100';
      } else if (widget.package == 2) {
        return p['muv']['premium_wash'];
      } else if (widget.package == 3) {
        return p['muv']['interior_detailing'];
      } else if (widget.package == 4) {
        return p['muv']['exterior_wash'];
      }
    }
    return '';
  }

  DatePickerController _controller = DatePickerController();

  DateTime _selectedDate = DateTime.now();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  String _pickedTime;

  var _carModel = 1;

  @override
  Widget build(BuildContext context) {
    print(carType);
    // final authProvider = Provider.of<AuthProvider>(context);
    final authProvider = Provider.of<LoginStore>(context);

    final order = Provider.of<List<OrderItem>>(context)
        .where((element) =>
            element.date == formatter.format(_selectedDate).toString())
        .toList();
    // ignore: missing_return
    Widget showButton(String time) {
      var taken = false;
      for (var i = 0; i < order.length; i++) {
        if (time == order[i].time && order[i].status != 'Cancel') {
          taken = true;
        }
      }
      double getTime(time) {
        if (time == '9 AM') {
          return 9;
        }
        if (time == '10:30 AM') {
          return 10.5;
        }
        if (time == '12 PM') {
          return 12;
        }
        if (time == '2 PM') {
          return 14;
        }
        if (time == '3:30 PM') {
          return 15.5;
        }
        if (time == '5 PM') {
          return 17;
        }
      }

      if (formatter.format(DateTime.now()).toString() ==
              formatter.format(_selectedDate).toString() &&
          DateTime.now().hour.toDouble() + 0.5 > getTime(time)) {
        taken = true;
      }

      if (_selectedDate == null || taken == true) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(5)),
            width: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Text(
                time,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            padding: EdgeInsets.all(0),
          ),
        );
      }
      if (_pickedTime == null || _pickedTime != time) {
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(0, 127, 219, 1), width: 2),
                  borderRadius: BorderRadius.circular(5)),
              width: 80,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              padding: EdgeInsets.all(0),

              //callback when button is clicke
            ),
          ),
          onTap: () {
            setState(() {
              _pickedTime = time;
            });
          },
        );
      }
      if (_pickedTime == time)
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 127, 219, 1),
                  border: Border.all(
                      color: Color.fromRGBO(0, 127, 219, 1), width: 2),
                  borderRadius: BorderRadius.circular(5)),
              width: 80,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text(
                  time,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              padding: EdgeInsets.all(0),

              //callback when button is clicke
            ),
          ),
          onTap: () {
            setState(() {
              _pickedTime = time;
            });
          },
        );
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Pick Date And Time',
                    style: TextStyle(fontSize: 30, fontFamily: 'Alegreya'),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      // Text(
                      //   'CHOOSE DATE',
                      //   style:
                      //       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      // ),

                      Container(
                          height: 130,
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: DatePicker(
                                  DateTime.now(),
                                  width: 60,
                                  height: 80,
                                  controller: _controller,
                                  initialSelectedDate: DateTime.now(),
                                  selectionColor:
                                      Color.fromRGBO(0, 127, 219, 1),
                                  selectedTextColor: Colors.white,
                                  // inactiveDates: [
                                  //   DateTime.now().add(Duration(days: 3)),
                                  //   DateTime.now().add(Duration(days: 4)),
                                  //   DateTime.now().add(Duration(days: 7))
                                  // ],
                                  onDateChange: (date) {
                                    // New date selected
                                    setState(() {
                                      _pickedTime = null;
                                      _selectedDate = date;
                                      // ignore: unused_local_variable
                                      final DateFormat formatter =
                                          DateFormat('dd-MM-yyyy');
                                      //  final String formatted = formatter.format(_selectedDate);
                                    });
                                  },
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.all(20),
                              // ),
                              // // Text("You Selected:"),
                              // // Padding(
                              // //   padding: EdgeInsets.all(10),
                              // // ),
                              // // Text(formatter.format(_selectedDate).toString()),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      // Text(
                      //   'CHOOSE TIME',
                      //   style:
                      //       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          showButton('9 AM'),
                          showButton('10:30 AM'),
                          showButton('12 PM'),
                          // showButton('12 PM'),
                          // showButton('1 PM'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          showButton('2 PM'),
                          showButton('3:30 PM'),
                          showButton('5 PM'),
                          // showButton('5 PM'),
                          // showButton('6 PM'),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Card(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         _pickedTime == null
                //             ? ''
                //             : 'BOOK WASH ON: ' +
                //                 DateFormat.MMMEd().format(_selectedDate) +
                //                 ' AT ' +
                //                 _pickedTime,
                //         style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       SizedBox(
                //         height: 10,
                //       ),
                //       Text(
                //         _pickedTime == null
                //             ? ''
                //             : 'NET AMOUNT: ' + price(carType),
                //         style:
                //             TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //       )
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                GestureDetector(
                  onTap: () {
                    // _carModel == null ||
                    _selectedDate == null || _pickedTime == null

                        // ignore: unnecessary_statements
                        ? null
                        :
                        //     : orderProvider.setName(authProvider.userModel.name);
                        // var orderDetails = OrderItem(
                        //   address: _address.text,
                        //   carModel: _carModel.toString(),
                        //   date: formatter.format(_selectedDate).toString(),
                        //   name: authProvider.userModel.name,
                        //   orderId: " ",
                        //   phoneNum: _phoneNum.text,
                        //   status: 'Pending',
                        //   time: _pickedTime,
                        //   userId: authProvider.user.uid,
                        // );
                        //     print("md");
                        // print(authProvider.userModel.address);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    // DetailsOfBooking(
                                    //     orderDetails,
                                    //     price(carType).toString(),
                                    //     authProvider.userModel.email)
                                    TakingUserDetails(
                                        authProvider.userModel.address,
                                        authProvider.userModel.email,
                                        authProvider.userModel.name,
                                        authProvider.userModel.landmark,
                                        price(carType).toString(),
                                        formatter
                                            .format(_selectedDate)
                                            .toString(),
                                        _pickedTime,
                                        carType.toString(),
                                        widget.package.toString())));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              // _address == null ||
                              // _carModel == null ||
                              _selectedDate == null || _pickedTime == null
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
              ],
            ),
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
        selectedItemColor: Colors.grey[600],
        onTap: _onItemTapped,
      ),
    );
  }
}
