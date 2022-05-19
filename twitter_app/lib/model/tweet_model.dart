// ignore: unused_import
import 'package:flutter/material.dart';

class TweetModel {
  bool isLiked = false;
  bool isReTweet = false;
  bool isCommented = false;

  int comments, retweets, loves;

  String tweetmessg;
  String name;
  String time;
  String twitterHandle;

  DateTime date;

  TweetModel({
    @required this.name,
    @required this.tweetmessg,
    this.time,
    this.date,
    @required this.twitterHandle,
    @required this.isCommented,
    @required this.isLiked,
    @required this.isReTweet,
    @required this.comments,
    @required this.retweets,
    @required this.loves,
  });

  void setLike(val) {
    isLiked = val;
  }

  void setReTweet(val) {
    isReTweet = val;
  }

  void setComment(val) {
    isCommented = val;
  }

  bool getLike(val) {
    return isLiked;
  }
}

class AdminTweetModel {
  String username;
  String twitterHandle;

  AdminTweetModel({
    this.username,
    this.twitterHandle,
  });
}
