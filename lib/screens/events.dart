import 'package:flutter/material.dart';

import 'package:TamilSangam/constants/Theme.dart';

//widgets
import 'package:TamilSangam/widgets/navbar.dart';
import 'package:TamilSangam/widgets/drawer.dart';

class Events extends StatelessWidget {
  // final GlobalKey _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "Events",
        // searchBar: true,
        // categoryOne: "Beauty",
        // categoryTwo: "Fashion",
      ),
      backgroundColor: ArgonColors.bgColorScreen,
      // key: _scaffoldKey,
      drawer: ArgonDrawer(currentPage: "events"),
      body: Center(
        /** Card Widget **/
        child: Text("Events page in progressing",
            style: TextStyle(
                color: ArgonColors.text,
                fontWeight: FontWeight.w600,
                fontSize: 16)),
      ),
    );
  }
}
