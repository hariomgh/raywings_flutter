import 'package:flutter/material.dart';

import 'bottom_navigation.dart';
import 'my_course.dart';
import 'live_class.dart';
import 'my_drawer_header.dart';
import 'my_order.dart';
import 'my_bookmarks.dart';
import 'store.dart';
import 'settings.dart';
import 'about_us.dart';
import 'contact_us.dart';
import 'rate_us.dart';

class Navigation_Drawer extends StatelessWidget {
  const Navigation_Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationPage(),
    );
  }
}


class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  var currentPage = DrawerSections.Home;


  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.Home) {
      container = BottomNavigation();
    } else if (currentPage == DrawerSections.MyCourse) {
      container = my_course();
    } else if (currentPage == DrawerSections.LiveClass) {
      container = live_class();
    } else if (currentPage == DrawerSections.MyOrder) {
      container = my_order();
    } else if (currentPage == DrawerSections.MyBookmarks) {
      container = my_bookmarks();
    } else if (currentPage == DrawerSections.Store) {
      container = store();
    } else if (currentPage == DrawerSections.Settings) {
      container = settings();
    } else if (currentPage == DrawerSections.AboutUs) {
      container = about_us();
    } else if (currentPage == DrawerSections.ContactUs) {
      container = contact_us();
    } else if (currentPage == DrawerSections.RateUs) {
      container = rate_us();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff800000),
        // title: Text("Raywings"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", Icons.home,
              currentPage == DrawerSections.Home ? true : false),
          menuItem(2, "My Course", Icons.video_library_rounded,
              currentPage == DrawerSections.MyCourse ? true : false),
          menuItem(3, "Live Class", Icons.wifi,
              currentPage == DrawerSections.LiveClass ? true : false),
          menuItem(4, "My Order", Icons.golf_course,
              currentPage == DrawerSections.MyOrder ? true : false),
          menuItem(5, "My Bookmarks", Icons.bookmark,
              currentPage == DrawerSections.MyBookmarks ? true : false),
          menuItem(6, "Store", Icons.shopping_cart,
              currentPage == DrawerSections.Store ? true : false),
          Divider(),
          menuItem(7, "Settings", Icons.settings,
              currentPage == DrawerSections.Settings ? true : false),
          menuItem(8, "About Us", Icons.people,
              currentPage == DrawerSections.AboutUs ? true : false),
          menuItem(9, "Contact Us", Icons.location_on,
              currentPage == DrawerSections.ContactUs ? true : false),
          menuItem(10, "Rate Us", Icons.star_half,
              currentPage == DrawerSections.RateUs ? true : false),
          ListTile(
            leading: const Icon(Icons.exit_to_app,),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              tileColor: Colors.grey,
              leading: const Icon(Icons.numbers_rounded),
              title: const Text('V 0.1.6'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),

          SizedBox(height: 10,),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.Home;
            } else if (id == 2) {
              currentPage = DrawerSections.MyCourse;
            } else if (id == 3) {
              currentPage = DrawerSections.LiveClass;
            } else if (id == 4) {
              currentPage = DrawerSections.MyOrder;
            } else if (id == 5) {
              currentPage = DrawerSections.MyBookmarks;
            } else if (id == 6) {
              currentPage = DrawerSections.Store;
            } else if (id == 7) {
              currentPage = DrawerSections.Settings;
            } else if (id == 8) {
              currentPage = DrawerSections.AboutUs;
            } else if (id == 9) {
              currentPage = DrawerSections.ContactUs;
            } else if (id == 10) {
              currentPage = DrawerSections.RateUs;
            }

          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  Home,
  MyCourse,
  LiveClass,
  MyOrder,
  MyBookmarks,
  Store,
  Settings,
  AboutUs,
  ContactUs,
  RateUs,
}