// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_app/components/icon.dart';

import '../../components/widgets/sidemenu.dart';
import '../Settings/notificationspage.dart';
import 'twitter_drawer.dart';

import '../../model/tweetBoxWidget.dart';
import '../../model/tweet_model.dart';
// ignore: unused_import
import '../../state/drawer_for_icon.dart';

class TimelinePage extends StatelessWidget {
  TimelinePage({Key key}) : super(key: key);
  final scrollController = ScrollController();
  var scaffoldkey = GlobalKey<ScaffoldState>();

  bool scaffoldKey = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            elevation: 1,
            backgroundColor: Colors.white,
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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationsPage(),
                      ),
                    );
                  },
                  icon: FaIcon(FontAwesomeIcons.star, color: Colors.black),
                  iconSize: 20.0,
                ),
              ],
            ),
          ),
          key: scaffoldkey,
          body: SingleChildScrollView(
            controller: scrollController,
            child:
                TweetBoxWidgety(), /* Column(
                children: /* Tweets.map((tweetaya) {
                return tweetBoxWidget(Tweets, true, () {}, 30);
              }).toList(),*/
      
                    [
                  
                ]), */
          ),
          drawer: SideMenu(),
          bottomNavigationBar: BottomNavigationBar(
            //backgroundColor: Colors.indigo,
            fixedColor: Colors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home),
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
      ),
    );
  }

  void scrollUp() {
    final double start = 0;
    scrollController.animateTo(start,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
  }
}
