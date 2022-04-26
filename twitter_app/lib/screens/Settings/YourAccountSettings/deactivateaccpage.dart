import 'package:flutter/material.dart';
import 'package:twitter_app/screens/Settings/testpage.dart';
import '/integration/handeling.dart';

class DeactivateAccountPage extends StatelessWidget {
  RequestHandeling handeler;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () => {Navigator.of(context).pop()},
            ),
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            elevation: 1,
            centerTitle: false,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deactivate your account",
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          //padding: EdgeInsets.only(top: 60, left: 40, right: 40),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://previews.123rf.com/images/koblizeek/koblizeek2001/koblizeek200100050/138262629-usuario-miembro-de-perfil-de-icono-de-hombre-vector-de-s%C3%ADmbolo-perconal-sobre-fondo-blanco-aislado-.jpg'),
                        radius: 45,
                      ),
                      Text(
                        "  @Username",
                        style: TextStyle(fontSize: 35),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("This will deactivate your account",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                  Text(
                      "You're about to start the process of deactivating your Mockingjay account. Your display name, @username, and public profile will no longer be viewale on Mockingjay for Web or Android.",
                      style: TextStyle(fontWeight: FontWeight.w200)),
                  Divider(
                    thickness: 2,
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("What else you should know",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                  Text(
                      "You can restore your Twitter account if it was accidentally or wrongfully deactivated for up to 30 days after deactivation.",
                      style: TextStyle(fontWeight: FontWeight.w200)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Some account information may still be available in search engines,such as Google or Bing.",
                      style: TextStyle(fontWeight: FontWeight.w200)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      " If you just want to change your @username, you don't need to deactivate your account - edit it in your settings.",
                      style: TextStyle(fontWeight: FontWeight.w200)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "To use your current @username or email address with a different Twitter account, change them before you deactivate this account",
                      style: TextStyle(fontWeight: FontWeight.w200)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      " If you want to download your Twitter data, you'll need to complete both the request and download process before deactivating your account.",
                      style: TextStyle(fontWeight: FontWeight.w200)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      " Links to download your data cannot be sent to deactivated",
                      style: TextStyle(fontWeight: FontWeight.w200)),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 1,
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 60,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            // gradient: LinearGradient(
                            //   begin: Alignment.topLeft,
                            //   end: Alignment.bottomRight,
                            //   stops: [0.3, 1],
                            //   colors: [
                            //     Color.fromARGB(255, 216, 51, 10),
                            //     Color.fromARGB(255, 216, 14, 7),
                            //   ],
                            // ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(45),
                            ),
                          ),
                          child: SizedBox.expand(
                            child: TextButton(
                                child: Text(
                                  "Deactivate",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.red,
                                    fontSize: 19,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TestPage(),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
  // if (await handeler
 //     .deactivateaccount("TOKEN")) {}