import 'package:flutter/material.dart';

import 'package:TamilSangam/constants/Theme.dart';

//widgets
import 'package:TamilSangam/widgets/navbar.dart';
import 'package:TamilSangam/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Gallery extends StatelessWidget {
  // final GlobalKey _scaffoldKey = new GlobalKey();
  List<String> myList = ['US', 'SG', 'US'];

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Gallery",
          // searchBar: true,
          // categoryOne: "Beauty",
          // categoryTwo: "Fashion",
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "gallery"),
        body: ListView(
          children: ListTile.divideTiles(
              //          <-- ListTile.divideTiles
              context: context,
              tiles: [
                ListTile(
                  title: new GestureDetector(
                    onTap: () {
                      const url =
                          'https://www.facebook.com/media/set?vanity=NEOTamilSangam&set=a.3660842693995775';
                      launchURL(url);
                    },
                    child: new Text("2020 NEOTS Open Tennis Tournament"),
                  ),
                ),
                ListTile(
                  title: new GestureDetector(
                    onTap: () {
                      const url =
                          'https://www.facebook.com/media/set/?vanity=NEOTamilSangam&set=a.3285527981527250';
                      launchURL(url);
                    },
                    child: new Text("2020 NEOTS Cricket Tournament"),
                  ),
                ),
                ListTile(
                  title: new GestureDetector(
                    onTap: () {
                      const url =
                          'https://www.facebook.com/media/set/?vanity=NEOTamilSangam&set=a.2799125416834178';
                      launchURL(url);
                    },
                    child: new Text("2020 Pongal Vizha Event"),
                  ),
                ),
                ListTile(
                  title: new GestureDetector(
                    onTap: () {
                      const url =
                          'https://www.facebook.com/NEOTamilSangam/photos/?tab=album&album_id=2576105909136131&type=3';
                      launchURL(url);
                    },
                    child: new Text("2019 NEOTS Deepavali Concert"),
                  ),
                ),
                ListTile(
                  title: new GestureDetector(
                    onTap: () {
                      const url =
                          'https://www.facebook.com/media/set/?set=a.2509361912477198&type=3';
                      launchURL(url);
                    },
                    child: new Text("2019 NEOTS Tamizhodu Vilaiyadu"),
                  ),
                ),
                ListTile(
                  title: new GestureDetector(
                    onTap: () {
                      const url =
                          'https://www.facebook.com/552047951541947/posts/2392966730783384/';
                      launchURL(url);
                    },
                    child: new Text("2019 NEOTS Summer Picnic"),
                  ),
                ),
                ListTile(
                  title: new GestureDetector(
                    onTap: () {
                      const url =
                          'https://www.facebook.com/NEOTamilSangam/photos/?tab=album&album_id=2378969278849796';
                      launchURL(url);
                    },
                    child: new Text("2019 NEOTS Throwball"),
                  ),
                ),
                ListTile(
                  title: new GestureDetector(
                    onTap: () {
                      const url =
                          'https://www.facebook.com/NEOTamilSangam/photos/?tab=album&album_id=2361663087247082';
                      launchURL(url);
                    },
                    child: new Text("2019 NEOTS Open Tennis "),
                  ),
                ),
                ListTile(
                  title: new GestureDetector(
                    onTap: () {
                      const url =
                          'https://www.facebook.com/NEOTamilSangam/photos/?tab=album&album_id=2347015115378546';
                      launchURL(url);
                    },
                    child: new Text("2019 NEOTS Cricket Tournament"),
                  ),
                ),
                ListTile(
                  title: new GestureDetector(
                    onTap: () {
                      const url =
                          'https://www.facebook.com/NEOTamilSangam/photos/?tab=album&album_id=2227202980693094';
                      launchURL(url);
                    },
                    child: new Text(" 2019 NEOTS Chithirai Thiruvizha "),
                  ),
                ),
              ]).toList(),
        ));

    // Container(
    /** Card Widget **/
    // child:
    // Text("Gallery page in progressing",
    //     style: TextStyle(
    //         color: ArgonColors.text,
    //         fontWeight: FontWeight.w600,
    //         fontSize: 16)),
    // );
  }
}
