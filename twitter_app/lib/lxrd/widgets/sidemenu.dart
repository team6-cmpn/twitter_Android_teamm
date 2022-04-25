import 'package:flutter/material.dart';

import '../pages/settingspage.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Drawer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DrawerHeader(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 70,
                          height: 70,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://previews.123rf.com/images/koblizeek/koblizeek2001/koblizeek200100050/138262629-usuario-miembro-de-perfil-de-icono-de-hombre-vector-de-s%C3%ADmbolo-perconal-sobre-fondo-blanco-aislado-.jpg'),
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Text(
                          'Mr.Ahmed hassan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          '@ammarhunter0',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Text(
                              '31 ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Following',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              '2 ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Followers',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.list_alt),
                  title: Text('Lists'),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Topics'),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.bookmark_border),
                  title: Text('Bookmarks'),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.bolt),
                  title: Text('Moments'),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.money_outlined),
                  title: Text('Monetization'),
                  onTap: () => null,
                ),
                Divider(
                  height: 2,
                ),
                ListTile(
                  leading: Icon(Icons.rocket_launch_outlined),
                  title: Text('Twitter for Professionals'),
                  onTap: () => null,
                ),
                Divider(
                  height: 2,
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings and Pirvacy'),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage())),
                ),
                ListTile(
                  leading: Icon(Icons.help_outline_outlined),
                  title: Text('Help Center'),
                  onTap: () => null,
                ),
                Divider(
                  height: 2,
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  onTap: () => null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
