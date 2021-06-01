import 'package:flutter/material.dart';
import 'package:social_media_ui/screens/latest_screen.dart';
import 'package:social_media_ui/screens/random_user.dart';
import 'package:social_media_ui/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TabController _tabController;
  // int currentIndex;
  //
  // @override
  // void initState() {
  //   _tabController = TabController(length: 2, vsync: this);
  //   currentIndex = _tabController.index;
  //
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
          ),
          brightness: Brightness.light,
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'FRENZY',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34.0,
              letterSpacing: 10,
              color: Theme.of(context).primaryColor,
            ),
          ),
          bottom: TabBar(
            indicatorWeight: 3.0,
            labelColor: Theme.of(context).primaryColor,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 18.0,
            ),
            tabs: [
              Tab(
                text: 'Latest',
              ),
              Tab(
                text: 'Trending',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LatestScreen(),
            RandomUser(),
          ],
        ),
      ),
    );
  }
}
