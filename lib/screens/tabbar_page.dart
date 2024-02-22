import 'package:flutter/material.dart';
import 'package:fluttersam/screens/dashboard_screen.dart';
import 'package:fluttersam/screens/login_page.dart';
import 'package:fluttersam/screens/profile_screen.dart';
import 'package:fluttersam/screens/tiktok_screen.dart';
import 'package:fluttersam/utils/share_preferences.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});
  @override
  _TabbarScreenState createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Widget userScreen = LoginScreen();

  setUserScreen() async {
    String? userToken = await SharedPreferencesHelper.getUserToken();
    if (userToken != null) {
      userScreen = ProfileScreen();
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    setUserScreen();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const tabs = [
      Tab(
        icon: Icon(
          Icons.home,
          color: Colors.amber,
        ),
      ),
      Tab(
        icon: Icon(
          size: 30,
          Icons.video_call,
          color: Colors.red,
        ),
      ),
      Tab(
        icon: Icon(
          Icons.person,
          color: Colors.green,
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sam\'s Flutter App'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Add your tab views here
          DashboardScreen(),
          TikTokScreen(),
          userScreen
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: tabs,
      ),
    );
  }
}
