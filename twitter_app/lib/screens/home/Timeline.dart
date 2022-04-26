// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return (SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 45,
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
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              IconButton(
                onPressed: () {
                  scrollUp();
                },
                icon: Image.asset(
                  "assests/images/FInalLogowhite.png",
                ),
                iconSize: 70.0,
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
    ));
  }

  void scrollUp() {
    final double start = 0;
    scrollController.animateTo(start,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
  }
}
