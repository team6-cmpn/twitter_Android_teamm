import 'package:flutter/material.dart';
import '../pages/notificationspage.dart';
import '../widgets/sidemenu.dart';
import '../widgets/navigationbar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              "Dummy Page",
              style: TextStyle(fontSize: 100),
            ),
            ElevatedButton(
              child: Text("Notifications"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationsPage(),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
        key: scaffoldkey,
        drawer: SideMenu(),
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset('assets/applogov2.png',
              fit: BoxFit.cover, height: 50),
          leading: IconButton(
              onPressed: () {
                scaffoldkey.currentState?.openDrawer();
              },
              icon: Icon(Icons.person, color: Colors.black)),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
