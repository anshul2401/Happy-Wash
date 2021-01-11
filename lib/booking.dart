// import 'package:flutter/material.dart';
// import 'package:happy_wash/date_time_picker.dart';

// import 'screens/about.dart';
// import 'screens/contact_us.dart';
// import 'screens/faq.dart';
// import 'screens/gallery.dart';
// import 'screens/how_it_works.dart';
// import 'screens/services.dart';
// import 'package:intl/intl.dart';

// import 'selcct_package.dart';

// class BookWash extends StatefulWidget {
//   final int carTypeID;
//   BookWash(this.carTypeID);
//   @override
//   _BookWashState createState() => _BookWashState(carTypeID);
// }

// class _BookWashState extends State<BookWash> {
//   final int carTypeID;
//   _BookWashState(this.carTypeID);
//   final _aa = FocusNode();
//   final _ab = FocusNode();
//   final _ac = FocusNode();
//   final _form = GlobalKey<FormState>();
//   var name;
//   var address;
//   var carModel;
//   var mobileNO;
//   DateTime _selectedDate;
//   void _presentDatePicker() {
//     showDatePicker(
//             context: context,
//             initialDate: DateTime.now(),
//             firstDate: DateTime.now(),
//             lastDate: DateTime.now().add(Duration(days: 30)))
//         .then((pickedDate) {
//       if (pickedDate == null) {
//         return;
//       }
//       setState(() {
//         _selectedDate = pickedDate;
//       });
//     });
//   }

//   String _pickedTime;
//   Widget showButton(String time) {
//     if (_selectedDate == null) {
//       return Container(
//         width: 60,
//         child: OutlineButton(
//             child: Text(
//               time,
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15,
//                   color: Colors.grey),
//             ),
//             padding: EdgeInsets.all(0),
//             onPressed: () {},
//             //callback when button is clicked
//             borderSide: BorderSide(
//               color: Colors.grey, //Color of the border
//               style: BorderStyle.solid, //Style of the border
//               width: 2,
//             )),
//       );
//     }
//     return Container(
//       width: 60,
//       child: OutlineButton(
//           splashColor: Color.fromRGBO(0, 127, 219, 1),
//           child: Text(
//             time,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//           ),
//           padding: EdgeInsets.all(0),
//           onPressed: () {
//             setState(() {
//               _pickedTime = time;
//             });
//           },
//           //callback when button is clicked
//           borderSide: BorderSide(
//             color: Color.fromRGBO(0, 127, 219, 1), //Color of the border
//             style: BorderStyle.solid, //Style of the border
//             width: 2,
//           )),
//     );
//   }

//   void _saveForm() {
//     final isValid = _form.currentState.validate();
//     if (!isValid) {
//       return;
//     }
//     _form.currentState.save();
//   }

//   @override
//   void dispose() {
//     _aa.dispose();
//     _ab.dispose();
//     _ac.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(0, 127, 219, 1),
//         title: Text('HAPPY WASH'),
//         leading: Image(
//           image: AssetImage('images/logo4.png'),
//         ),
//         actions: [
//           PopupMenuButton(
//               onSelected: (int selectedValue) => {
//                     if (selectedValue == 0)
//                       {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => HowItWorks()))
//                       }
//                     else if (selectedValue == 1)
//                       {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Gallery()))
//                       }
//                     else if (selectedValue == 2)
//                       {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => About()))
//                       }
//                     else if (selectedValue == 3)
//                       {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Faq()))
//                       }
//                     else if (selectedValue == 4)
//                       {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ContactUs()))
//                       }
//                     else if (selectedValue == 5)
//                       {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Services()))
//                       }
//                   },
//               icon: Icon(Icons.menu),
//               itemBuilder: (_) => [
//                     PopupMenuItem(child: Text('How it works?'), value: 0),
//                     PopupMenuItem(child: Text('Gallery'), value: 1),
//                     PopupMenuItem(child: Text('About'), value: 2),
//                     PopupMenuItem(child: Text('FAQ\'s'), value: 3),
//                     PopupMenuItem(child: Text('Contact Us'), value: 4),
//                     PopupMenuItem(child: Text('Services'), value: 5),
//                     PopupMenuItem(child: Text('Log Out'), value: 6),
//                   ])
//         ],
//       ),
//       body: Form(
//         key: _form,
//         child: ListView(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
//                   child: Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 10.0),
//                           child: TextFormField(
//                             decoration: InputDecoration(
//                                 hintText: 'Name',
//                                 border: InputBorder.none,
//                                 icon: Icon(
//                                   Icons.create,
//                                   color: Colors.black,
//                                 )),
//                             textInputAction: TextInputAction.next,
//                             onFieldSubmitted: (_) {
//                               FocusScope.of(context).requestFocus(_aa);
//                             },
//                             onSaved: (value) {
//                               name = value;
//                             },
//                             validator: (value) {
//                               if (value.isEmpty) {
//                                 return 'Please fill this field';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 10.0),
//                           child: TextFormField(
//                             decoration: InputDecoration(
//                                 hintText: 'Address',
//                                 border: InputBorder.none,
//                                 icon: Icon(
//                                   Icons.home,
//                                   color: Colors.black,
//                                 )),
//                             textInputAction: TextInputAction.next,
//                             focusNode: _aa,
//                             onFieldSubmitted: (_) {
//                               FocusScope.of(context).requestFocus(_ab);
//                             },
//                             onSaved: (value) {
//                               address = value;
//                             },
//                             validator: (value) {
//                               if (value.isEmpty) {
//                                 return 'Please fill this field';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 10.0),
//                           child: TextFormField(
//                             decoration: InputDecoration(
//                                 hintText: 'Mobile Number',
//                                 border: InputBorder.none,
//                                 icon: Icon(
//                                   Icons.phone,
//                                   color: Colors.black,
//                                 )),
//                             keyboardType: TextInputType.phone,
//                             textInputAction: TextInputAction.next,
//                             focusNode: _ab,
//                             onFieldSubmitted: (_) {
//                               FocusScope.of(context).requestFocus(_ac);
//                             },
//                             onSaved: (value) {
//                               mobileNO = value;
//                             },
//                             validator: (value) {
//                               if (value.isEmpty) {
//                                 return 'Please fill this field';
//                               } else if (value.length != 10) {
//                                 return 'Enter Valid Mobile Number';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 10.0),
//                           child: TextFormField(
//                             decoration: InputDecoration(
//                                 hintText: 'Car Model',
//                                 border: InputBorder.none,
//                                 icon: Icon(
//                                   Icons.directions_car,
//                                   color: Colors.black,
//                                 )),
//                             focusNode: _ac,
//                             onSaved: (value) {
//                               carModel = value;
//                             },
//                             onFieldSubmitted: (_) {
//                               _saveForm();
//                             },
//                             validator: (value) {
//                               if (value.isEmpty) {
//                                 return 'Please fill this field';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             'CHOOSE DATE AND TIME',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 15),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 _selectedDate == null
//                                     ? 'No Date Chosen!'
//                                     : DateFormat.yMMMMEEEEd()
//                                         .format(_selectedDate),
//                                 style: TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.bold),
//                               ),
//                               FlatButton(
//                                 textColor: Color.fromRGBO(0, 127, 219, 1),
//                                 child: Text(
//                                   _selectedDate == null
//                                       ? 'Choose Date'
//                                       : 'Change',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15),
//                                 ),
//                                 onPressed: _presentDatePicker,
//                               )
//                             ],
//                           ),
//                           // PickTime(),
//                           Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   showButton('9 AM'),
//                                   showButton('10 AM'),
//                                   showButton('11 AM'),
//                                   showButton('12 PM'),
//                                   showButton('1 PM'),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   showButton('2 PM'),
//                                   showButton('3 PM'),
//                                   showButton('4 PM'),
//                                   showButton('5 PM'),
//                                   showButton('6 PM'),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Text(
//                                 _pickedTime == null
//                                     ? ''
//                                     : 'BOOK WASH ON: ' +
//                                         DateFormat.MMMEd()
//                                             .format(_selectedDate) +
//                                         ' AT ' +
//                                         _pickedTime,
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Column(
//                 //   children: [
//                 //     Text(
//                 //       'SELECT CAR MODEL',
//                 //       textAlign: TextAlign.center,
//                 //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 //     ),
//                 //     //here dropdown menu
//                 //   ],
//                 // ),
//                 // Row(children: [
//                 //   //select service or paclage
//                 // ]),
//                 RaisedButton(
//                   child: Text('Confirm'),
//                   textColor: Colors.white,
//                   color: _pickedTime == null ||
//                           name == '' ||
//                           address == '' ||
//                           mobileNO == '' ||
//                           carModel == ''
//                       ? Colors.grey
//                       : Color.fromRGBO(0, 127, 219, 1),
//                   onPressed: () {
//                     _pickedTime == null ||
//                             name == '' ||
//                             address == '' ||
//                             mobileNO == '' ||
//                             carModel == ''
//                         // ignore: unnecessary_statements
//                         ? null
//                         : Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => RadioWidget(
//                                     name,
//                                     address,
//                                     mobileNO,
//                                     carModel,
//                                     _selectedDate,
//                                     _pickedTime,
//                                     carTypeID)));
//                   },
//                 ),
//                 MyHomePage2(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
