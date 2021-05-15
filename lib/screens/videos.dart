import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:humming_task/screens/drawer.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videos extends StatefulWidget {
  Videos({Key key}) : super(key: key);

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  DateTime now = DateTime.now();
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  List<bool> _isPlayerReady = [];

  List<String> images = [
    'assets/11.jpg',
    'assets/12.jpg',
    'assets/13.jpg',
    'assets/14.jpg',
    'assets/15.jpg',
  ];

  List<bool> bookmarked = [];
  List<bool> showInfo = [];

  List<String> Heading = [
    'This is Heading of the realted news or may be extended',
    'This is Heading of the realted news or may be extended',
    'This is Heading of the realted news or may be extended',
    'This is Heading of the realted news or may be extended',
    'This is Heading of the realted news or may be extended',
  ];

  List<String> SubHeading = [
    'This is heading of the realted new ws this is snother heading of',
    'This is heading of the realted new ws this is snother heading of',
    'This is heading of the realted new ws this is snother heading of',
    'This is heading of the realted new ws this is snother heading of',
    'This is heading of the realted new ws this is snother heading of',
  ];

  List<String> urls = [
    'wYlzBYSOphI',
    'z9TejjjXmlU',
    'dZOPAf4ibDA',
    '2M5buYRocsM',
    '7b2elEeS9S8'
  ];
  List<YoutubePlayerController> _controller = [];

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
            SizedBox(
              height: 15,
            ),
            Container(
              width: screenwidth * 0.95,
              child: Card(
                elevation: 1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Videos',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: screenheight * 0.75,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  void listener() {
                    if (_isPlayerReady[index] &&
                        mounted &&
                        !_controller[index].value.isFullScreen) {
                      setState(() {
                        _playerState = _controller[index].value.playerState;
                        _videoMetaData = _controller[index].metadata;
                      });
                    }
                  }

                  bookmarked.add(false);
                  _isPlayerReady.add(false);
                  _controller.add(YoutubePlayerController(
                    initialVideoId: urls[index],
                    flags: const YoutubePlayerFlags(
                      mute: false,
                      // autoPlay: true,
                      disableDragSeek: false,
                      loop: false,
                      isLive: false,
                      forceHD: false,
                      enableCaption: false,
                    ),
                  )..addListener(listener));
                  return InkWell(
                    onTap: () {
                      setState(() {
                        int i = 0;
                        bookmarked = bookmarked.map((e) {
                          if (i == index) {
                            i++;
                            return !e;
                          } else {
                            i++;
                            return false;
                          }
                        }).toList();

                        if (bookmarked[index] == false) {
                          _controller[index].pause();
                        }
                      });
                    },
                    child: bookmarked[index] == false
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(20, 35, 40, 20),
                            child: Container(
                              height: screenheight * 0.12,
                              child: InkWell(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                      flex: 7,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // color: Colors.green,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Heading[index],
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.calendar_today),
                                                    Text(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(now)),
                                                  ],
                                                ),
                                                Container(
                                                  height: 25,
                                                  width: screenwidth * 0.2,
                                                  decoration: BoxDecoration(
                                                      color: Colors.deepOrange),
                                                  child: Center(
                                                    child: Text('Sports'),
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
                          )
                        : Container(
                            padding: EdgeInsets.all(5.0),
                            width: screenwidth,
                            height: screenheight * 0.52,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                YoutubePlayer(
                                  aspectRatio: 16 / 9,
                                  controller: _controller[index],
                                  showVideoProgressIndicator: true,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      Text(
                                        DateFormat('dd-MM-yyyy').format(now),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        SubHeading[index],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyle(
                                          fontSize: 15.5,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  width: screenwidth * 0.95,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        int i = 0;
                                        bookmarked = bookmarked.map((e) {
                                          if (i == index) {
                                            i++;
                                            return !e;
                                          } else {
                                            i++;
                                            return false;
                                          }
                                        }).toList();

                                        if (bookmarked[index] == false) {
                                          _controller[index].pause();
                                        }
                                      });
                                    },
                                    child: Card(
                                      elevation: 5,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'Information',
                                            style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
