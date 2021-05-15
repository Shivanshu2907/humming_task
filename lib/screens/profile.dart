import 'package:flutter/material.dart';
import 'package:humming_task/screens/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  SharedPreferences prefs;

  callprefs() async {
    prefs = await SharedPreferences.getInstance();
    _location =
        TextEditingController(text: prefs.getString('Location') ?? null);
    _pincode = TextEditingController(text: prefs.getString('Pincode') ?? null);
    _dob =
        TextEditingController(text: prefs.getString('Date of birth') ?? null);
    _gender = TextEditingController(text: prefs.getString('Gender') ?? null);
    _whatsapp =
        TextEditingController(text: prefs.getString('Whatsapp') ?? null);
    _email = TextEditingController(text: prefs.getString('Email') ?? null);
  }

  TextEditingController _location = TextEditingController();
  TextEditingController _pincode = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _whatsapp = TextEditingController();
  TextEditingController _email = TextEditingController();

  DateTime date;
  TimeOfDay time;
  String name, email;
  String _hour, _minute, _time;
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  bool dateSelected = false;
  bool timeSelected = false;

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1930, 8),
        lastDate: DateTime(2022));
    if (picked != null && picked != selectedDate)
      setState(() {
        dateSelected = !dateSelected;
        selectedDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _dateController.text = date;
      });
  }

  @override
  void initState() {
    super.initState();
    callprefs();
  }

  void focusNextTextField(BuildContext context) {
    do {
      var foundFocusNode = FocusScope.of(context).nextFocus();
      if (!foundFocusNode) return;
    } while (
        FocusScope.of(context).focusedChild.context.widget is! EditableText);
  }

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(size: 55.0, color: Colors.white),
        toolbarHeight: screenheight * 0.12,
        // title: Text(widget.title),
        backgroundColor: Color(0xFF031c0a),
      ),
      body: SingleChildScrollView(
        // controller: controller,
        child: Column(
          children: [
            Center(
              child: Container(
                height: screenheight * 0.3,
                decoration: BoxDecoration(
                  color: Color(0xFFedf2ed),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: screenheight * 0.13,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('assets/logo.png', scale: 1.2),
                          fit: BoxFit.contain,
                        ),
                        border: Border.all(color: Colors.deepOrangeAccent),
                        shape: BoxShape.circle,
                        // color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Dinesh Yadhuvanshi',
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        focusNextTextField(context);
                      },
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Center(
              child: Container(
                width: screenwidth * 0.8,
                height: screenheight * 0.6,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      // Add TextFormFields and ElevatedButton here.
                      TextFormField(
                        controller: _location,
                        onFieldSubmitted: (s) async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('Location', s);
                        },
                        decoration: InputDecoration(labelText: 'Location'),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _pincode,
                        onFieldSubmitted: (s) async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('Pincode', s);
                        },
                        decoration: InputDecoration(labelText: 'Pincode'),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),

                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: _dob,
                            onFieldSubmitted: (s) async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('Date of birth', s);
                            },
                            onSaved: (val) {
                              date = selectedDate;
                              setState(() {
                                dateSelected = !dateSelected;
                              });
                            },
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              labelText: "Date of birth",
                              // suffixIcon: IconButton(
                              //   onPressed: () {},
                              //   icon: !dateSelected
                              //       ? Icon(Icons.calendar_today)
                              //       : Icon(Icons.check),
                              // ),
                              // icon: Icon(Icons.calendar_today),
                            ),
                            validator: (value) {
                              if (value.isEmpty)
                                return "Please enter a date for your task";
                              return null;
                            },
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _gender,
                        onFieldSubmitted: (s) async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('Gender', s);
                        },
                        decoration: InputDecoration(labelText: 'Gender'),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _whatsapp,
                        onFieldSubmitted: (s) async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('Whatsapp', s);
                        },
                        decoration: InputDecoration(labelText: 'Whatsapp'),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _email,
                        onFieldSubmitted: (s) async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('Email', s);
                        },
                        decoration: InputDecoration(labelText: 'Email'),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
