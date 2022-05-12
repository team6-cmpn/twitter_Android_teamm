import 'package:flutter/material.dart';
import '../../model/tweet_model.dart';
import 'package:get/get.dart';

class postController extends GetxController {
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

    update();
    // Tweets.add(newPost);
  }
}
