import 'package:TamilSangam/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:TamilSangam/constants/Theme.dart';

import 'package:TamilSangam/widgets/drawer-tile.dart';

class ArgonDrawer extends StatelessWidget {
  final String currentPage;

  ArgonDrawer({this.currentPage});

  _launchURL() async {
    const url = 'https://creative-tim.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: ArgonColors.white,
      child: Column(children: [
        Container(
            // height: MediaQuery.of(context).size.height * 0.1,
            height: 110,
            width: MediaQuery.of(context).size.width * 0.95,
            // width: 130,
            child: SafeArea(
              bottom: false,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, top: 10),
                  // child: Text('Tamil sangam'),
                  child: Image.asset("assets/img/tamil.png"),
                ),
              ),
            )),
        Expanded(
          flex: 2,
          child: ListView(
            padding: EdgeInsets.only(top: 24, left: 16, right: 16),
            children: [
              DrawerTile(
                  icon: Icons.home,
                  onTap: () {
                    if (currentPage != "Home")
                      Navigator.pushReplacementNamed(context, '/home');
                  },
                  iconColor: ArgonColors.primary,
                  title: "Home",
                  isSelected: currentPage == "Home" ? true : false),
              DrawerTile(
                  icon: Icons.pie_chart,
                  onTap: () {
                    if (currentPage != "Profile")
                      // Navigator.pushReplacementNamed(context, '/profile');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                  },
                  iconColor: ArgonColors.warning,
                  title: "Profile",
                  isSelected: currentPage == "Profile" ? true : false),
              DrawerTile(
                  icon: Icons.apps,
                  onTap: () {
                    if (currentPage != "commitee")
                      Navigator.pushReplacementNamed(context, '/commitee');
                  },
                  iconColor: ArgonColors.primary,
                  title: "Commitee",
                  isSelected: currentPage == "commitee" ? true : false),
              DrawerTile(
                  icon: Icons.apps,
                  onTap: () {
                    if (currentPage != "events")
                      Navigator.pushReplacementNamed(context, '/events');
                  },
                  iconColor: ArgonColors.primary,
                  title: "Events",
                  isSelected: currentPage == "events" ? true : false),
              DrawerTile(
                  icon: Icons.apps,
                  onTap: () {
                    if (currentPage != "membership")
                      Navigator.pushReplacementNamed(context, '/membership');
                  },
                  iconColor: ArgonColors.primary,
                  title: "MemberShip Benifits",
                  isSelected: currentPage == "membership" ? true : false),

              DrawerTile(
                  icon: Icons.apps,
                  onTap: () {
                    if (currentPage != "gallery")
                      Navigator.pushReplacementNamed(context, '/gallery');
                  },
                  iconColor: ArgonColors.primary,
                  title: "Gallery",
                  isSelected: currentPage == "gallery" ? true : false),
              DrawerTile(
                  icon: Icons.apps,
                  onTap: () {
                    if (currentPage != "aboutus")
                      Navigator.pushReplacementNamed(context, '/aboutus');
                  },
                  iconColor: ArgonColors.primary,
                  title: "About Us",
                  isSelected: currentPage == "aboutus" ? true : false),
              DrawerTile(
                  icon: Icons.apps,
                  onTap: () {
                    if (currentPage != "contactus")
                      Navigator.pushReplacementNamed(context, '/contactus');
                  },
                  iconColor: ArgonColors.primary,
                  title: "Contact Us",
                  isSelected: currentPage == "contactus" ? true : false),
              // DrawerTile(
              //     icon: Icons.account_circle,
              //     onTap: () {
              //       if (currentPage != "Account")
              //         Navigator.pushReplacementNamed(context, '/account');
              //     },
              //     iconColor: ArgonColors.info,
              //     title: "Account",
              //     isSelected: currentPage == "Account" ? true : false),
              // DrawerTile(
              //     icon: Icons.settings_input_component,
              //     onTap: () {
              //       if (currentPage != "Elements")
              //         Navigator.pushReplacementNamed(context, '/elements');
              //     },
              //     iconColor: ArgonColors.error,
              //     title: "Elements",
              //     isSelected: currentPage == "Elements" ? true : false),
              // DrawerTile(
              //     icon: Icons.apps,
              //     onTap: () {
              //       if (currentPage != "Articles")
              //         Navigator.pushReplacementNamed(context, '/articles');
              //     },
              //     iconColor: ArgonColors.primary,
              //     title: "Article",
              //     isSelected: currentPage == "Articles" ? true : false),
            ],
          ),
        ),
        // Expanded(
        //   flex: 1,
        //   child: Container(
        //       padding: EdgeInsets.only(left: 8, right: 16),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Divider(height: 4, thickness: 0, color: ArgonColors.muted),
        //           Padding(
        //             padding:
        //                 const EdgeInsets.only(top: 16.0, left: 16, bottom: 8),
        //             child: Text("DOCUMENTATION",
        //                 style: TextStyle(
        //                   color: Color.fromRGBO(0, 0, 0, 0.5),
        //                   fontSize: 15,
        //                 )),
        //           ),
        //           DrawerTile(
        //               icon: Icons.airplanemode_active,
        //               onTap: _launchURL,
        //               iconColor: ArgonColors.muted,
        //               title: "Getting Started",
        //               isSelected:
        //                   currentPage == "Getting started" ? true : false),
        //         ],
        //       )),
        // ),
      ]),
    ));
  }
}
