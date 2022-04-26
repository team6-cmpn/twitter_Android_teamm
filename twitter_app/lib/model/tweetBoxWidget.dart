// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../components/greyLine_seperator.dart';
import 'tweet_model.dart';

class TweetBoxWidgety extends StatefulWidget {
  const TweetBoxWidgety({
    Key key,
    Tweets,
    isLiked,
    function,
    comments,
  }) : super(key: key);

  @override
  State<TweetBoxWidgety> createState() => _TweetBoxWidgetyState();
}

class _TweetBoxWidgetyState extends State<TweetBoxWidgety> {
  final List<TweetModel> Tweets = [
    TweetModel(
      username: " Ammar",
      tweetmessg: "my name is ammar",
      twitterHandle: "@Ammar1",
      time: "7h",
      date: DateTime.now(),
      comments: 23,
      isCommented: true,
      isLiked: true,
      isReTweet: true,
      loves: 77,
      retweets: 99,
    ),
    TweetModel(
      username: " lord",
      tweetmessg: "my name is mohamed",
      twitterHandle: "@lxrd",
      time: "3h",
      date: DateTime.now(),
      comments: 23,
      isCommented: false,
      isLiked: false,
      isReTweet: false,
      loves: 27,
      retweets: 22,
    ),
    /* TweetModel(
      username: " Ammar",
      tweetmessg: "my name is ammar",
      twitterHandle: "@Ammar1",
      time: "7h",
      date: DateTime.now(),
      comments: 23,
      isCommented: true,
      isLiked: true,
      isReTweet: true,
      loves: 77,
      retweets: 99,
    ),
    TweetModel(
      username: " Ammar",
      tweetmessg: "my name is ammar",
      twitterHandle: "@Ammar1",
      time: "7h",
      date: DateTime.now(),
      comments: 23,
      isCommented: true,
      isLiked: true,
      isReTweet: true,
      loves: 77,
      retweets: 99,
    ),
    TweetModel(
      username: " Ammar",
      tweetmessg: "my name is ammar",
      twitterHandle: "@Ammar1",
      time: "7h",
      date: DateTime.now(),
      comments: 23,
      isCommented: true,
      isLiked: true,
      isReTweet: true,
      loves: 77,
      retweets: 99,
    ),
    TweetModel(
      username: " Ammar",
      tweetmessg: "my name is ammar",
      twitterHandle: "@Ammar1",
      time: "7h",
      date: DateTime.now(),
      comments: 23,
      isCommented: true,
      isLiked: true,
      isReTweet: true,
      loves: 77,
      retweets: 99,
    ),
    TweetModel(
      username: " Ammar",
      tweetmessg: "my name is ammar",
      twitterHandle: "@Ammar1",
      time: "7h",
      date: DateTime.now(),
      comments: 23,
      isCommented: true,
      isLiked: true,
      isReTweet: true,
      loves: 77,
      retweets: 99,
    ),
    TweetModel(
      username: " Ammar",
      tweetmessg: "my name is ammar",
      twitterHandle: "@Ammar1",
      time: "7h",
      date: DateTime.now(),
      comments: 23,
      isCommented: true,
      isLiked: true,
      isReTweet: true,
      loves: 77,
      retweets: 99,
    ), */

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

/*   @override
  void setState(VoidCallback setliked) {
    // TODO: implement setState
    //setState(setliked);
    Widget build(BuildContext context) {
      return tweetBoxWidget(Tweets, false, () {}, 30);
    }
  } */

  Widget tweetBoxWidget(
    Tweets,
    isLiked,
    function,
    comments,
  ) =>
      Container(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            ...Tweets.map(
              (tweetaya) {
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
                              backgroundImage: NetworkImage(
                                  'https://abs.twimg.com/sticky/default_profile_images/default_profile_400x400.png'),
                              radius: 20,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "${tweetaya.username} ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "${tweetaya.twitterHandle} . ",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              "${tweetaya.time}",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              "  ${tweetaya.date}",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            tweetaya.tweetmessg,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.all(8),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: FaIcon(
                                      FontAwesomeIcons.comment,
                                      size: 17,
                                    ),
                                  ),
                                  TextSpan(text: "  $comments"),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: tweetaya.isReTweet
                                          ? FaIcon(
                                              FontAwesomeIcons.retweet,
                                              size: 17,
                                            )
                                          : FaIcon(
                                              FontAwesomeIcons.heart,
                                              size: 17,
                                            ),
                                    ),
                                    TextSpan(
                                      text: '  ${tweetaya.retweets.toString()}',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                if (tweetaya.isCommented == false) {
                                  tweetaya.isCommented = true;
                                  tweetaya.retweets += 1;
                                } else {
                                  tweetaya.isCommented = false;
                                  tweetaya.retweets -= 1;
                                }
                              });
                            },
                          ),
                          InkWell(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: tweetaya.isLiked
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
                                  TextSpan(
                                      text: '  ${tweetaya.loves.toString()}')
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                if (tweetaya.isLiked == false) {
                                  tweetaya.isLiked = true;
                                  tweetaya.loves += 1;
                                } else {
                                  tweetaya.isLiked = false;
                                  tweetaya.loves -= 1;
                                }
                              });
                            }, //function,
                          )
                        ],
                      ),
                      GreyLineSeperator(),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return tweetBoxWidget(Tweets, true, () {}, 30);
  }
}
