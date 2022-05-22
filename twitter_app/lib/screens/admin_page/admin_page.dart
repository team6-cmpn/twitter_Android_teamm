// ignore_for_file: file_names, avoid_unnecessary_containers, non_constant_identifier_names, unnecessary_new, avoid_print, avoid_init_to_null, unused_local_variable, duplicate_import, prefer_typing_uninitialized_variables, camel_case_types, unused_element, unnecessary_brace_in_string_interps, prefer_is_empty, must_be_immutable

// import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:twitter_app/API/userdata.dart';
import 'package:twitter_app/components/widgets/CustomNavBar2.0.dart';
import 'dart:convert';

class AdminPage extends StatefulWidget {
  String token = userdata.token;
  final String adminToken;
  AdminPage({
    Key key,
    @required this.token,
    @required this.adminToken,
  }) : super(key: key);
  @override
  _AdminPage createState() => _AdminPage();
}

class _AdminPage extends State<AdminPage> {
  final blockDurationController = TextEditingController();
  List users = [];
  var countOfUsers = '';
  Future<int> noUserFuture;
  Future<int> getUserCountFuture;
  static const String BaseURL = "http://twi-jay.me:8080";
  @override
  void initState() {
    super.initState();
    getUserCountFuture = getNumberOfUsers(widget.token);
  }

  Future blockUserIntegeration(token, user_id, duration) async {
    Map dataDuration = {'end_date': duration, 'userid': user_id};
    var response = await http.post(
      Uri.parse(
        '${BaseURL}/adminBlock/create',
      ),
      body: dataDuration,
      headers: {
        'x-access-token': token, /* 'userid': user_id */
      },
    );
    setState(() {
      if (response.statusCode == 200) {
        print('The user was block succesfuly');
      } else {
        print('block not working');
      }
    });
  }

  Future unBlockUserIntegeration(token, adminToken, user_id) async {
    var response = await http.delete(
      Uri.parse(
        'http://10.0.2.2:8080/admins/${adminToken}/banning/${user_id}/',
      ),
      headers: {
        'x-auth-token': token,
      },
    );
    setState(() {
      if (response.statusCode == 200) {
        print('block was clicked');
      } else {
        print('block not working');
      }
    });
  }

  Future<int> getNumberOfUsers(token) async {
    var response = await http.get(
      Uri.parse(
        ('$BaseURL/admin/showUsers'),
      ),
      headers: {
        'x-access-token': token,
      },
    );
    setState(() {
      countOfUsers = json.decode(response.body).length;
      print('count of users is ');
      print(countOfUsers);
    });
    return countOfUsers;
  }

  Future getUsersIntegeration(token) async {
    var response = await http.get(
      Uri.parse(
        ('$BaseURL/admin/showUsers'),
      ),
      headers: {
        'x-access-token': token,
      },
    );
    if (response.statusCode == 200) {
      print('i am in user integeration');
      var items = json.decode(response.body);
      List info = items;
      setState(() {
        users = info;
      });
    } else {
      setState(() {
        users = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.token);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            //backgroundColor: Colors.white,
            primary: true,
            titleTextStyle: TextStyle(
              color: Colors.pink,
            ),
            title: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => CustomNavBar()),
                    );
                  },
                  icon: Image.asset(
                    "assests/images/FinalLogo.png",
                    scale: 10,
                  ),
                  iconSize: 20.0,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Admin Home Page",
                        style: TextStyle(fontSize: 25, color: Colors.pink),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "DashBoard",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Users",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Blocked Users",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(),
              Container(
                child: FutureBuilder<int>(
                  future: getUserCountFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      countOfUsers = snapshot.data;
                      getUsersIntegeration(widget.token);
                      return getBodyOfUsers();
                    } else {
                      getUsersIntegeration(widget.token);
                      return getBodyOfUsers();

                      /* const Center(
                        child: CircularProgressIndicator(),
                      ); */
                    }
                  },
                ),
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }


  Widget getBodyOfUsers() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) => getCardOfUsers(
        users[index],
      ),
    );
  }

  Widget getCardOfUsers(item) {
    var name = item['name'];
    var userName = item['username'];
    var profilePic = item['profile_image_url'];
    var user_id = item['_id'];
    return Container(
      height: 90,
      child: Card(
        elevation: 70,
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 134, 158, 209),
                  borderRadius: BorderRadius.circular(60 / 2),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(profilePic != null
                            ? profilePic.toString()
                            : 'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'
                        // "https://images.unsplash.com/photo-1644982647869-e1337f992828?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                        ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 22),
                    Text(
                      name.toString(),
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      userName.toString(),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                //height: 22,
                width: 87,
              ),
              MaterialButton(
                minWidth: 30,
                height: 30,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        'Duration',
                      ),
                      content: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              onSubmitted: (value) => blockUserIntegeration(
                                  widget.token,
                                  user_id,
                                  blockDurationController.toString()),
                              controller: blockDurationController,
                              decoration: InputDecoration(
                                hintText: "block duration in days",
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            blockUserIntegeration(widget.token, user_id,
                                blockDurationController.toString());
                          },
                          child: Text(
                            'Block',
                            style: TextStyle(
                              color: Colors.redAccent,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                color: Color.fromARGB(146, 206, 8, 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Ban",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
