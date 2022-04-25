// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../lxrd/pages/notificationspage.dart';
import 'twitter_drawer.dart';

import '../../model/tweetBoxWidget.dart';
import '../../model/tweet_model.dart';
import '../../state/drawer_for_icon.dart';
/* import 'package:whisper/models/tweet_model.dart';
import 'package:../modules/tweetBoxWidget.dart'; */

class TimelinePage extends StatelessWidget {
  TimelinePage({Key key}) : super(key: key);
  final scrollController = ScrollController();

  final List<TweetModel> Tweets = [
    TweetModel(
      username: " Ammar",
      tweetmessg: "my name is ammar",
      twitterHandle: "@Ammar1",
      time: "7h",
      //date: DateTime(),
      comments: 23,
      isCommented: true,
      isLiked: true,
      isReTweet: true,
      loves: 77,
      retweets: 99,
    ),
    /* TweetModel(
      username: "Ahmed",
      tweetmessg: "Hello world",
      time: "3m",
      twitterHandle: "@Ahmed28",
      comments: 23,
      isCommented: true,
      isLiked: true,
      isReTweet: true,
      loves: 77,
      retweets: 99,
    ), */

    /* TweetModel(
      username: " Kareem",
      tweet: "Lorem ipsum dolor sit amet",
      time: "7h",
      twitterHandle: "@Kareem1",
    ),
    TweetModel(
        username: "Ahmed",
        tweet: "Lorem ipsum dolor sit amet",
        time: "3m",
        twitterHandle: "@Ahmed28"),
    TweetModel(
        username: "Hassan",
        tweet: "Lorem ipsum dolor sit amet",
        time: "3m",
        twitterHandle: "@Hassan212"),
    TweetModel(
        username: "Ahmed",
        tweet: "Lorem ipsum dolor sit amet",
        time: "3m",
        twitterHandle: "@Ahmed28"),
    TweetModel(
        username: "Hassan",
        tweet: "Lorem ipsum dolor sit amet",
        time: "3m",
        twitterHandle: "@Hassan212"),
    TweetModel(
      username: " Kareem",
      tweet: "Lorem ipsum dolor sit amet",
      time: "7h",
      twitterHandle: "@Kareem1",
    ),
    TweetModel(
        username: "Ahmed",
        tweet: "Lorem ipsum dolor sit amet",
        time: "3m",
        twitterHandle: "@Ahmed28"),
    TweetModel(
      username: " Kareem",
      tweet: "Lorem ipsum dolor sit amet",
      time: "7h",
      twitterHandle: "@Kareem1",
    ),
    TweetModel(
        username: "Ahmed",
        tweet: "Lorem ipsum dolor sit amet",
        time: "3m",
        twitterHandle: "@Ahmed28"),
    TweetModel(
        username: "Hassan",
        tweet: "Lorem ipsum dolor sit amet",
        time: "3m",
        twitterHandle: "@Hassan212"),
    TweetModel(
        username: "Ahmed",
        tweet: "Lorem ipsum dolor sit amet",
        time: "3m",
        twitterHandle: "@Ahmed28"),
    TweetModel(
        username: "Hassan",
        tweet: "Lorem ipsum dolor sit amet",
        time: "3m",
        twitterHandle: "@Hassan212"), */
  ];
  bool scaffoldKey = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://previews.123rf.com/images/koblizeek/koblizeek2001/koblizeek200100050/138262629-usuario-miembro-de-perfil-de-icono-de-hombre-vector-de-s%C3%ADmbolo-perconal-sobre-fondo-blanco-aislado-.jpg'),
                        radius: 16,
                      ),
                    ),
                    onTap: () {
                      /* if (scaffoldKey.currentState.isDrawerOpen) {
                        scaffoldKey.currentState.openEndDrawer();
                      } else {
                        scaffoldKey.currentState.openDrawer();
                      } */
                      // myKey.currentState.openDrawer();
                      //Scaffold.of(context).openDrawer();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsPage(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      scrollUp();
                    },
                    icon: FaIcon(FontAwesomeIcons.twitter),
                    iconSize: 20.0,
                    color: Colors.blue,
                  ),
                  IconButton(
                    onPressed: () {
                      return Center(
                        child: Text('starred page'),
                      );
                    },
                    icon: FaIcon(FontAwesomeIcons.star),
                    iconSize: 20.0,
                  ),
                ],
              ),
              tweetBoxWidget(Tweets, false, () {}, 30)
            ],
          ),
        ),
        drawer: TwitterDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          //backgroundColor: Colors.indigo,
          fixedColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.home),
              label: 'News Feed',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.search, color: Colors.black),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.microphone, color: Colors.black),
              label: 'Spaces',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.bell, color: Colors.black),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.envelope, color: Colors.black),
              label: 'Inbox',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void scrollUp() {
    final double start = 0;
    scrollController.animateTo(start,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
  }
}
