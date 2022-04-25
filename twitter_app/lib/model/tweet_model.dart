// ignore: unused_import
import 'package:flutter/material.dart';

class TweetModel {
  bool isLiked = false;
  bool isReTweet = false;
  bool isCommented = false;

  int comments, retweets, loves;

  String tweetmessg;
  String username;
  String time;
  String twitterHandle;

  DateTime date;

  TweetModel({
    this.username,
    this.tweetmessg,
    this.time,
    this.twitterHandle,
    this.isCommented,
    this.isLiked,
    this.isReTweet,
    this.comments,
    this.retweets,
    this.loves,
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
