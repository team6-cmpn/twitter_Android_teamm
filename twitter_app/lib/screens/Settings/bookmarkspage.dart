import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../API/userdata.dart';

Future RemoveAllBookmarks(String token) async {
  final response = await http.delete(
    Uri.parse(userdata.BaseURL + "/bookmarks/removeAll"),
    headers: {
      'x-access-token': token,
    },
  );
  if (response.statusCode == 200) {
    print('love will increase by +++++1');
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

RemoveBookmark(String idOfTweetpassed, String token) async {
  final response = await http.delete(
    Uri.parse(userdata.BaseURL + "/bookmarks/remove/${idOfTweetpassed}"),
    headers: {
      'x-access-token': token,
    },
  );
  if (response.statusCode == 200) {
    print('love will increase by +++++2');
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

class BookmarksPage extends StatefulWidget {
  BookmarksPage({Key key}) : super(key: key);

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (value) {
                if (value == "Remove") {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Clear all Bookmarks?'),
                      content: const Text(
                          'This can"t be undone and you"ll remove all Tweets you"ve added to your Bookmarks'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                            onPressed: () {
                              RemoveAllBookmarks(userdata.token);
                              print("clicked");
                              Navigator.pop(context, 'Clear');
                            },
                            child: Text("Clear")),
                      ],
                    ),
                  );
                }
              },
              itemBuilder: (conetxt) => [
                PopupMenuItem(
                  value: "Remove",
                  child: Text('Clear all bookmarks'),
                ),
              ],
            ),
          ],
          toolbarHeight: 50,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 1,
          centerTitle: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bookmarks",
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
        body: Center(child: Row(children: [Text("Save Tweets for later")])),
      ),
    );
  }
}
