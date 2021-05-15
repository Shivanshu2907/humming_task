import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime now = DateTime.now();

  List<String> images = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/2.jpeg',
    'assets/3.png',
    'assets/4.jpg',
    'assets/5.png',
    'assets/6.jpg',
    'assets/7.jpg',
  ];

  List<bool> bookmarked = [];

  List<String> Heading = [
    'This is Heading of the realte news ws this is and go on',
    'This is Heading of the realte',
    'This is Heading of the realte news ws this is and go on',
    'This is Heading of the realte news ws this is and go on',
    'This is Heading of the realte news ws this is and go on',
    'This is Heading of the realte news ws this is and go on',
    'This is Heading of the realte news ws this is and go on',
    'This is Heading of the realte news ws this is and go on',
  ];
  List<String> SubHeading = [
    'This is heading of the realted new ws this is snother heading of the this will go like this when nothing is availabe for as long as nes is there',
    'This is heading of the realted new ws this is snother heading of the this will go like this when nothing is availabe for as long as nes is there',
    'This is heading of the realted new ws this is snother heading of the this will go like this when nothing is availabe for as long as nes is there',
    'This is heading of the realted new ws this is snother heading of the this will go like this when nothing is availabe for as long as nes is there',
    'This is heading of the realted new ws this is snother heading of the this will go like this when nothing is availabe for as long as nes is there',
    'This is heading of the realted new ws this is snother heading of the this will go like this when nothing is availabe for as long as nes is there',
    'This is heading of the realted new ws this is snother heading of the this will go like this when nothing is availabe for as long as nes is there',
    'This is heading of the realted new ws this is snother heading of the this will go like this when nothing is availabe for as long as nes is there',
  ];

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      // controller: controller,
      child: Column(
        children: [
          Container(
            height: screenheight * 0.82,
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                bookmarked.add(false);
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
                  child: Container(
                    height: screenheight * 0.138,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text('Card ${index + 1}'),
                                  content:
                                      Text('you pressed card ${index + 1}'),
                                ));
                      },
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // color: Colors.transparent,
                                image: DecorationImage(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // color: Colors.green,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Heading[index],
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Flexible(
                                    child: Text(
                                      SubHeading[index],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 15.5,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.calendar_today),
                                          Text(DateFormat('dd-MM-yyyy')
                                              .format(now)),
                                        ],
                                      ),
                                      Container(
                                        height: 25,
                                        width: screenwidth * 0.22,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color: Colors.deepOrangeAccent),
                                        child: Center(child: Text('Sports')),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            bookmarked[index] =
                                                !bookmarked[index];
                                          });
                                        },
                                        child: Icon(
                                          Icons.bookmark_border,
                                          color: bookmarked[index]
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
