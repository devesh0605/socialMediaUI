import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/widgets/following_users.dart';
import 'package:social_media_ui/widgets/post_carousal.dart';

class LatestScreen extends StatefulWidget {
  @override
  _LatestScreenState createState() => _LatestScreenState();
}

class _LatestScreenState extends State<LatestScreen> {
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.8,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          FollowingUsers(),
          PostCarousal(
            pageController: _pageController,
            title: 'Posts',
            posts: posts,
          ),
        ],
      ),
    );
  }
}
