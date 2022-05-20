// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:twitter_app/API/userdata.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../components/greyLine_seperator.dart';
import '../../components/widgets/sidemenu.dart';
import '../../model/tweet_model.dart';
import '../Settings/notificationspage.dart';

const TextStyle _textStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);

class TimelinePage extends StatefulWidget {
  final String token;
  final String userName;
  final String nameOfUser;

  TimelinePage({
    Key key,
    @required this.token,
    this.userName,
    this.nameOfUser,
  }) : super(key: key);

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  final scrollController = ScrollController();
  var scaffoldkey = GlobalKey<ScaffoldState>();
  final messgController = TextEditingController();
  bool scaffoldKey = false;
  //final Function addNewPosting;

  var idOfPost = '';
  var token = '';
  List listOfTweets = [];
  //List infoOfPosts = [];
  // List URLss = [];
  // var URLs;
  Future<String> countFuture;

  Duration constantSuperDuration;

  @override
  void initState() {
    super.initState();
    countFuture = getTweetId(userdata.token);
  }

  Future getTweet(tokenpassed) async {
    //await Future.delayed(const Duration(seconds: 2));
    var response = await http.get(
      Uri.parse(
        ('http://twi-jay.me:8080/tweets/lookup/1/50'),
      ),
      headers: {
        'x-access-token': tokenpassed,
      },
    );
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      List info = items;
      setState(
        () {
          listOfTweets = info;
        },
      );
    } else {
      setState(
        () {
          print('take care cause the list of Tweets is empty');
          listOfTweets = [];
        },
      );
    }
  }

  Future<String> getTweetId(token) async {
    var response = await http.get(
      Uri.parse(
        ('http://twi-jay.me:8080/tweets/lookup/1/50'),
      ),
      headers: {
        'x-access-token': token,
      },
    );

    // print('md5l444444444');
    //print(response.statusCode);
    if (response.statusCode == 200) {
      var posts = json.decode(response.body)[0];
      var infoOfPosts = json.decode(response.body)[0]['tweet'];
      var infoOfUser = json.decode(response.body)[0]['user'];
      idOfPost = infoOfPosts['_id'];
    } else if (response.statusCode == 400) {
      print('bad request');
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else if (response.statusCode == 404) {
      print('Not Found');
    } else if (response.statusCode == 500) {
      print('Internal Server Error');
    }
    return idOfPost;
  }

  /* final List<TweetModel> Tweets = [
    /* TweetModel(
      name: " Ammar",
      tweetmessg: "my name is ammar",
      twitterHandle: "@Ammar1",
      time: "7h",
      date: DateTime.now(),
      comments: 7,
      isCommented: true,
      isLiked: true,
      isReTweet: true,
      loves: 9,
      retweets: 15,
    ),
    TweetModel(
      name: " lord",
      tweetmessg: "my name is mohamed",
      twitterHandle: "@lxrd",
      time: "3h",
      date: DateTime.now(),
      comments: 5,
      isCommented: false,
      isLiked: false,
      isReTweet: false,
      loves: 2,
      retweets: 22,
    ),
    TweetModel(
      name: " hassan",
      tweetmessg: "here is my first tweet",
      twitterHandle: "@hassan",
      time: "3h",
      date: DateTime.now(),
      comments: 2,
      isCommented: false,
      isLiked: false,
      isReTweet: false,
      loves: 13,
      retweets: 0,
    ),
    TweetModel(
      name: " Gemy",
      tweetmessg: "we Don't need memories ",
      twitterHandle: "@gemmmy",
      time: "7h",
      date: DateTime.now(),
      comments: 9,
      isCommented: false,
      isLiked: false,
      isReTweet: true,
      loves: 0,
      retweets: 9,
    ),
    TweetModel(
      name: " Eren",
      tweetmessg: "Keep moving forward all the time",
      twitterHandle: "@Eren00",
      time: "2h",
      date: DateTime.now(),
      comments: 3,
      isCommented: false,
      isLiked: true,
      isReTweet: false,
      loves: 7,
      retweets: 8,
    ),
    TweetModel(
      name: " Ammar",
      tweetmessg: "my name is ammar",
      twitterHandle: "@Ammar1",
      time: "7h",
      date: DateTime.now(),
      comments: 1,
      isCommented: false,
      isLiked: true,
      isReTweet: true,
      loves: 9,
      retweets: 15,
    ),
    TweetModel(
      name: " lord",
      tweetmessg: "my name is mohamed",
      twitterHandle: "@lxrd",
      time: "3h",
      date: DateTime.now(),
      comments: 0,
      isCommented: false,
      isLiked: false,
      isReTweet: false,
      loves: 2,
      retweets: 22,
    ),
    TweetModel(
      name: " hassan",
      tweetmessg: "here is my first tweet",
      twitterHandle: "@hassan",
      time: "3h",
      date: DateTime.now(),
      comments: 0,
      isCommented: false,
      isLiked: false,
      isReTweet: false,
      loves: 13,
      retweets: 0,
    ),
    TweetModel(
      name: " Gemy",
      tweetmessg: "we Don't need memories ",
      twitterHandle: "@gemmmy",
      time: "7h",
      date: DateTime.now(),
      comments: 0,
      isCommented: false,
      isLiked: false,
      isReTweet: true,
      loves: 0,
      retweets: 9,
    ),
    TweetModel(
      name: " Eren",
      tweetmessg: "Keep moving forward all the time",
      twitterHandle: "@Eren00",
      time: "2h",
      date: DateTime.now(),
      comments: 23,
      isCommented: false,
      isLiked: true,
      isReTweet: false,
      loves: 7,
      retweets: 8,
    ), */
  ];
 */

  void scrollUp() {
    final double start = 0;
    scrollController.animateTo(start,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

  Future addPostPage() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Add Tweet',
          ),
          content: TextField(
            controller: messgController,
            decoration: InputDecoration(
              hintText: "What's happening?",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                addPostt(
                  messgController.text,
                  20,
                );
              },
              child: Text('Tweet'),
            ),
          ],
        ),
      );

/* PostsIntegeration(String username, String name, String token) async {
    Map data = {'data': email, 'password': password};
    //var jsonData = null;
    Map mapResponse;
    Map dataResponse;
    String nameResponse;
    String userResponse;
    String idResponse;

    var response = await http
        .post(Uri.parse("http://twi-jay.me:8080/auth/signin"), body: data);
    if (response.statusCode == 200) {
      mapResponse = json.decode(response.body);
      dataResponse = mapResponse;
      nameResponse = mapResponse['user']['name'];
      userResponse = mapResponse['user']['username'];
      idResponse = mapResponse['user']['_id'];
      print('tez 3ez 7mra');
      print(nameResponse);
      token = dataResponse["accessToken"];

      setState(
        () {
          //dataResponse = mapResponse["data"];
          //dataResponse["role"].toString() == 'Admin'
          print('nooooooooooo');
          print(token);
          //print(dataResponse['user']);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) => TimelinePage(
                  token: token,
                  nameOfUser: nameResponse,
                  name: userResponse,
                ),
              ),
              (Route<dynamic> route) => false);
          dataResponse = mapResponse;
        },
      );
    } else if (response.statusCode == 400) {
      print('bad request');
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else if (response.statusCode == 404) {
      print('Not Found');
    } else if (response.statusCode == 500) {
      print('Internal Server Error');
    }
  } */

  Widget getTweetBody() {
    return ListView.builder(
      itemCount: listOfTweets.length,
      itemBuilder: (context, index) {
        return tweetBoxWidgety(listOfTweets[index]); //Text('index $index');
      },
    );
  }

  Widget tweetBoxWidgety(item) {
    var name = item['user']['name'];
    var userName = item['user']['username'];
    var userProfilePic = item['url'];
    var tweetMessg = item['tweet']['text'];
    var date = item['tweet']['created_at'];
    var isLoved = item['tweet']['hasImage'];
    var isRetweeted = item['user']['isAdmin'];
    // var isCommented = item['tweet']['date'];
    var countOfLoves = item['tweet']['favorites'].length;
    var countOfReteweeted = item['tweet']['retweetUsers'].length;
    var countOfComments = item['user']['__v'];

    constantSuperDuration =
        Duration(seconds: 00, hours: 0, microseconds: 0, days: 1);
    Duration myDuration1 = Duration(seconds: 15, days: 0);

    var timeParsed = DateTime.parse(date);
    var dateFormated = DateFormat.jm().format(timeParsed);

    // //List URLss = item['URLs'];
    // /* if (URLss.isEmpty) {
    //   URLs = 'URLss';
    // } else {
    //   URLs = URLss[0];
    // }

    /* print('here is the pictures');
    print(userdata.profileImage);
    print(userdata.profileImage.toString()); */
    return Container(
      //decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 0, 0, 0),width: 0)),
      padding: EdgeInsets.all(7),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(isRetweeted
                      ? userProfilePic.toString()
                      : 'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'),
                  radius: 20,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "${name} ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "${userName} . ",
                  style: TextStyle(fontSize: 18),
                  softWrap: true,
                ),
                Flexible(
                  child: Text(
                    //heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
                    "${(dateFormated).toString()}",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                /* Text(
                  "  ${date}",
                  style: TextStyle(fontSize: 10),
                ), */
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                tweetMessg,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: FaIcon(
                            FontAwesomeIcons.bookmark,
                            size: 17,
                          ),
                        ),
                        TextSpan(text: '  ${countOfComments}'),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  //addComment();
                },
              ),
              InkWell(
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: isRetweeted
                              ? FaIcon(
                                  FontAwesomeIcons.retweet,
                                  size: 17,
                                  color: Colors.green,
                                )
                              : FaIcon(
                                  FontAwesomeIcons.retweet,
                                  size: 17,
                                  //color: Colors.green,
                                ),
                        ),
                        TextSpan(text: '  ${countOfReteweeted}'),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    /* if (isRetweeted == false) {
                      isRetweeted = true;
                      countOfReteweeted += 1;
                    } else {
                      isRetweeted = false;
                      countOfReteweeted -= 1;
                    } */
                  });
                },
              ),
              InkWell(
                child: Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: isLoved
                            ? FaIcon(
                                FontAwesomeIcons.solidHeart,
                                size: 17,
                                color: Colors.redAccent,
                              )
                            : FaIcon(
                                FontAwesomeIcons.heart,
                                size: 17,
                              ),
                      ),
                      TextSpan(text: '  ${countOfLoves}')
                    ],
                  ),
                ),
                onTap: () {
                  /* setState(() {
                    if (isLoved == false) {
                      isLoved = true;
                      countOfLoves += 1;
                    } else {
                      isLoved = false;
                      countOfLoves -= 1;
                    }
                  }); */
                }, //function,
              )
            ],
          ),
          GreyLineSeperator(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //// print(widget.token);
    //print('we r in timeline');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 1,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          // scaffoldkey.currentState?.openDrawer();
          leading: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(userdata.profileImage),
                radius: 16,
              ),
            ),
            onTap: () {
              scaffoldkey.currentState?.openDrawer();
            },
          ),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(),
            IconButton(
              onPressed: () {
                scrollUp();
              },
              icon: Image.asset(
                "assests/images/FinalLogo.png",
                scale: 0.5,
              ),
              iconSize: 55.0,
              // color: Colors.blue,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationsPage(),
                  ),
                );
              },
              icon: FaIcon(
                FontAwesomeIcons.star,
              ),
              iconSize: 20.0,
            ),
          ]),
        ),
        key: scaffoldkey,
        body:
            // SingleChildScrollView(
            //   controller: scrollController,
            //   child: Column(
            //     children: [
            //       Text('zh2ttttttttttttttttt'),
            //       tweetBoxWidgety(),
            //     ],
            //   ),
            // ),
            FutureBuilder<String>(
                future: countFuture,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    idOfPost = snapshot.data;
                    getTweet(userdata.token);
                    //return SingleChildScrollView(child: TweetBoxWidgety());
                    return getTweetBody();
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })),
        drawer: SideMenu(),
        // bottomNavigationBar: MaterialYou(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            addPostPage();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future addComment() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Your comment',
          ),
          content: TextField(
            decoration: InputDecoration(
              hintText: "Enter your comment",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // addPostt('gggggggg', 23);
              },
              child: Text('submit'),
            ),
          ],
        ),
      );

  void addPostt(String post, int txamount) {
    /* final newPost = TweetModel(
      tweetmessg: post,
      comments: 0,
      isCommented: false,
      isLiked: false,
      isReTweet: false,
      loves: txamount,
      retweets: 0,
      name: userdata.name,
      date: DateTime.now(),
      twitterHandle: userdata.username,
      time: '1min',
    ); */
    addTweetIntergeration(
      post,
      userdata.token,
    );
    setState(() {
      //Tweets.add(newPost);
    });
  }

  addTweetIntergeration(String message, String token) async {
    Map data = {
      "text": message,
      "source": '',
      "mention": " ",
      "imageUrl": " ",
    };

    //var jsonData = null;

    const String BaseURL = "http://twi-jay.me:8080";
    final response = await http.post(
      Uri.parse("$BaseURL/tweets/update"),
      body: data,
      headers: {
        'x-access-token': token,
      },
    );
    //Map dataResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString(userdata.token, token);

      /*  setState(
        () {
          //dataResponse = mapResponse["data"];
          //dataResponse["role"].toString() == 'Admin'
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => TimelinePage()),
              (Route<dynamic> route) => false);
        },
      ); */

    } else if (response.statusCode == 400) {
      print('bad request');
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else if (response.statusCode == 404) {
      print('Not Found');
    } else if (response.statusCode == 500) {
      print('Internal Server Error');
    }
  }
}
