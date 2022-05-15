// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:twitter_app/components/widgets/customnavbar.dart';
//import 'package:twitter_app/screens/Settings/settingspage.dart';
import '../../components/greyLine_seperator.dart';
import '../../components/widgets/sidemenu.dart';
import '../Settings/notificationspage.dart';
//import 'twitter_drawer.dart';
//import '../../model/tweetBoxWidgety.dart';
import '../../model/tweet_model.dart';
// ignore: unused_import
import '../../state/drawer_for_icon.dart';

const TextStyle _textStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);

class TimelinePage extends StatefulWidget {
  final String token;

  TimelinePage({
    Key key,
    this.token,
  }) : super(key: key);

  @override
  State<TimelinePage> createState() => _TimelinePageState(() {
        print('not here');
      });
}

class _TimelinePageState extends State<TimelinePage> {
  final scrollController = ScrollController();
  var scaffoldkey = GlobalKey<ScaffoldState>();
  bool scaffoldKey = false;
  final messgController = TextEditingController();
  final Function addNewPosting;

  _TimelinePageState(this.addNewPosting);

  /* Function addNewPost() {
    addPost;
    print('we r here');
  } */

  @override
  Widget build(BuildContext context) {
    print(widget.token);
    print('yayy2222222222');
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
                backgroundImage: NetworkImage(
                    'https://previews.123rf.com/images/koblizeek/koblizeek2001/koblizeek200100050/138262629-usuario-miembro-de-perfil-de-icono-de-hombre-vector-de-s%C3%ADmbolo-perconal-sobre-fondo-blanco-aislado-.jpg'),
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
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Text('Fuck off'),
              tweetBoxWidgety(),
            ],
          ),

          /* Column(
                children: /* Tweets.map((tweetaya) {
                return tweetBoxWidget(Tweets, true, () {}, 30);
              }).toList(),*/
      
                    [
                  
                ]), */
        ),
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

  void scrollUp() {
    final double start = 0;
    scrollController.animateTo(start,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

  /* Future addCommenet() => showDialog(
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
              onPressed: () {},
              child: Text('submit'),
            ),
          ],
        ),
      ); */

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
                addPostt(messgController.text, 20);
              },
              child: Text('Tweet'),
            ),
          ],
        ),
      );
  // Widget tweetBoxWidgety() => Container(
  //   padding: EdgeInsets.all(0),
  //   child: Column(
  //     children: [
  //       ...Tweets.map(
  //         (tweetaya) {
  //           return Container(
  //             //decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 0, 0, 0),width: 0)),
  //             padding: EdgeInsets.all(7),
  //             child: Column(
  //               children: [
  //                 Container(
  //                   padding: EdgeInsets.only(bottom: 7),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     children: [
  //                       CircleAvatar(
  //                         backgroundImage: NetworkImage(
  //                             'https://abs.twimg.com/sticky/default_profile_images/default_profile_400x400.png'),
  //                         radius: 20,
  //                       ),
  //                       SizedBox(
  //                         width: 7,
  //                       ),
  //                       Text(
  //                         "${tweetaya.username} ",
  //                         style: TextStyle(
  //                             fontWeight: FontWeight.bold, fontSize: 18),
  //                       ),
  //                       Text(
  //                         "${tweetaya.twitterHandle} . ",
  //                         style: TextStyle(fontSize: 18),
  //                       ),
  //                       Text(
  //                         "${tweetaya.time}",
  //                         style: TextStyle(fontSize: 17),
  //                       ),
  //                       /* Text(
  //                         "  ${tweetaya.date}",
  //                         style: TextStyle(fontSize: 10),
  //                       ), */
  //                     ],
  //                   ),
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       tweetaya.tweetmessg,
  //                       style: TextStyle(fontSize: 18),
  //                     ),
  //                   ],
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     InkWell(
  //                       child: Container(
  //                         margin: EdgeInsets.all(8),
  //                         child: Text.rich(
  //                           TextSpan(
  //                             children: [
  //                               WidgetSpan(
  //                                 child: FaIcon(
  //                                   FontAwesomeIcons.comment,
  //                                   size: 17,
  //                                 ),
  //                               ),
  //                               TextSpan(
  //                                   text:
  //                                       '  ${tweetaya.comments.toString()}'),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                       onTap: () {
  //                         addComment();
  //                       },
  //                     ),
  //                     InkWell(
  //                       child: Container(
  //                         child: Text.rich(
  //                           TextSpan(
  //                             children: [
  //                               WidgetSpan(
  //                                   child: tweetaya.isReTweet
  //                                       ? FaIcon(
  //                                           FontAwesomeIcons.retweet,
  //                                           size: 17,
  //                                           color: Colors.green,
  //                                         )
  //                                       : FaIcon(
  //                                           FontAwesomeIcons.retweet,
  //                                           size: 17,
  //                                           //color: Colors.green,
  //                                         )),
  //                               TextSpan(
  //                                 text: '  ${tweetaya.retweets.toString()}',
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                       onTap: () {
  //                         setState(() {
  //                           if (tweetaya.isReTweet == false) {
  //                             tweetaya.isReTweet = true;
  //                             tweetaya.retweets += 1;
  //                           } else {
  //                             tweetaya.isReTweet = false;
  //                             tweetaya.retweets -= 1;
  //                           }
  //                         });
  //                       },
  //                     ),
  //                     InkWell(
  //                       child: Text.rich(
  //                         TextSpan(
  //                           children: [
  //                             WidgetSpan(
  //                               child: tweetaya.isLiked
  //                                   ? FaIcon(
  //                                       FontAwesomeIcons.solidHeart,
  //                                       size: 17,
  //                                       color: Colors.redAccent,
  //                                     )
  //                                   : FaIcon(
  //                                       FontAwesomeIcons.heart,
  //                                       size: 17,
  //                                     ),
  //                             ),
  //                             TextSpan(
  //                                 text: '  ${tweetaya.loves.toString()}')
  //                           ],
  //                         ),
  //                       ),
  //                       onTap: () {
  //                         setState(() {
  //                           if (tweetaya.isLiked == false) {
  //                             tweetaya.isLiked = true;
  //                             tweetaya.loves += 1;
  //                           } else {
  //                             tweetaya.isLiked = false;
  //                             tweetaya.loves -= 1;
  //                           }
  //                         });
  //                       }, //function,
  //                     )
  //                   ],
  //                 ),
  //                 GreyLineSeperator(),
  //               ],
  //             ),
  //           );
  //         },
  //       ),
  //     ],
  //   ),
  // );

  void addPostt(String post, int txamount) {
    final newPost = TweetModel(
      tweetmessg: post,
      comments: 0,
      isCommented: false,
      isLiked: false,
      isReTweet: false,
      loves: txamount,
      retweets: 0,
      username: 'Mr.Ahmed hassan',
      date: DateTime.now(),
      twitterHandle: '@mr.gggg',
      time: '1min',
    );

    setState(() {
      Tweets.add(newPost);
    });
  }

  final List<TweetModel> Tweets = [
    TweetModel(
      username: " Ammar",
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
      username: " lord",
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
      username: " hassan",
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
      username: " Gemy",
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
      username: " Eren",
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
      username: " Ammar",
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
      username: " lord",
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
      username: " hassan",
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
      username: " Gemy",
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
      username: " Eren",
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
    ),
  ];
  Widget tweetBoxWidgety() => Container(
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
                            /* Text(
                              "  ${tweetaya.date}",
                              style: TextStyle(fontSize: 10),
                            ), */
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
                          InkWell(
                            child: Container(
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
                                    TextSpan(
                                        text:
                                            '  ${tweetaya.comments.toString()}'),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              addComment();
                            },
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
                                                color: Colors.green,
                                              )
                                            : FaIcon(
                                                FontAwesomeIcons.retweet,
                                                size: 17,
                                                //color: Colors.green,
                                              )),
                                    TextSpan(
                                      text: '  ${tweetaya.retweets.toString()}',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                if (tweetaya.isReTweet == false) {
                                  tweetaya.isReTweet = true;
                                  tweetaya.retweets += 1;
                                } else {
                                  tweetaya.isReTweet = false;
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

  /* void addPostt(String post, int txamount) {
    final newPost = TweetModel(
      tweetmessg: post,
      comments: 0,
      isCommented: false,
      isLiked: false,
      isReTweet: false,
      loves: txamount,
      retweets: 0,
      username: 'Mr.Ahmed hassan',
      date: DateTime.now(),
      twitterHandle: '@mr.gggg',
      time: '1min',
    );

    setState(() {
      Tweets.add(newPost);
    });
  } */

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

  /* Future addPost() => showDialog(
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
              onPressed: () {},
              child: Text('submit'),
            ),
          ],
        ),
      ); */

}
