import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:TamilSangam/constants/Theme.dart';

//widgets
import 'package:TamilSangam/widgets/navbar.dart';
import 'package:TamilSangam/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Know your Rent',
      // headerValue: 'Panel $index',
      // expandedValue: 'This is item number $index',
      expandedValue:
          '10% off Tuesdays, Wednesdays and Thursdays Lunch and DinnerOn sale more than 25 Excludes Special Offers(Family pack, Combo, BOGO etc)',
    );
  });
}

class Membership extends StatefulWidget {
  // final GlobalKey _scaffoldKey = new GlobalKey();
  @override
  _MembershipState createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  List<Item> _data = generateItems(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "Membership",
        // searchBar: true,
        // categoryOne: "Beauty",
        // categoryTwo: "Fashion",
      ),
      backgroundColor: ArgonColors.bgColorScreen,
      // key: _scaffoldKey,
      drawer: ArgonDrawer(currentPage: "membership"),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("membershipBenifits")
              .snapshots(),
          builder: (context, snapshot) {
            // print("${snapshot.data.docs} into");
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: List.generate(snapshot.data.docs.length,
                      (index) => carditem(index, snapshot.data.docs)),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

//dummy
  Widget carditem(index, List<QueryDocumentSnapshot> membershipData) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(membershipData[index].data()["title"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(membershipData[index].data()["offer"]),
                          membershipData[index].data()["contact"] != ""
                              ? SizedBox(
                                  height: 10,
                                )
                              : SizedBox.shrink(),
                          membershipData[index].data()["contact"] != ""
                              ? Text(membershipData[index].data()["contact"])
                              : SizedBox.shrink(),
                        ]),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 10, 10),
                      child:
                          Image.network(membershipData[index].data()['imglink'],
                              errorBuilder: (context, error, stackTrace) {
                        return Image.network(membershipData[index]
                            .data()['imglink']); //do something
                      }, loadingBuilder: (BuildContext context, Widget child,
                                  ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      }, width: 120, height: 120))
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
              child: InkWell(
                onTap: () async {
                  if (await canLaunch(membershipData[index].data()['link'])) {
                    await launch(membershipData[index].data()['link']);
                  }
                },
                child: Row(
                  children: [
                    Text(
                      "Explore",
                      style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.teal,
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = true,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}
