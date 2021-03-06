import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:TamilSangam/constants/Theme.dart';

//widgets
import 'package:TamilSangam/widgets/navbar.dart';
import 'package:TamilSangam/widgets/drawer.dart';
import 'package:TamilSangam/widgets/card-profile.dart';

class CommiteeList extends StatefulWidget {
  @override
  _CommiteeListState createState() => _CommiteeListState();
}

class _CommiteeListState extends State<CommiteeList> {
  @override
  Widget build(BuildContext context) {
    String yearGet = ModalRoute.of(context).settings.arguments;
    // print('${yearGet} getting bk');
    return new SafeArea(
      child: Scaffold(
          // extendBodyBehindAppBar: true,
          appBar: Navbar(
            title: "Commitee List",
            // transparent: true,
          ),
          backgroundColor: ArgonColors.bgColorScreen,
          drawer: ArgonDrawer(currentPage: "commiteeList"),
          body: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("commiteeMembers/$yearGet/memberList")
                  .where("type", isEqualTo: "Executive")
                  .snapshots(),
              builder: (context, yearsnapshotExecutive) {
                return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("commiteeMembers/$yearGet/memberList")
                        .where("type", isEqualTo: "Advisory")
                        .snapshots(),
                    builder: (context, yearsnapshotAdvisory) {
                      if (yearsnapshotAdvisory.hasData &&
                          yearsnapshotExecutive.hasData) {
                        print(
                            "${yearsnapshotExecutive.data.docs} $yearGet ${yearsnapshotExecutive.data.docs}");
                        return Container(
                            padding: EdgeInsets.only(
                                top: 20, right: 24, left: 24, bottom: 36),
                            child: committeeBody(
                                yearsnapshotExecutive.data.docs,
                                yearsnapshotAdvisory.data.docs));
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    });
              })),
    );
  }

  Widget committeeBody(List<QueryDocumentSnapshot> executive,
      List<QueryDocumentSnapshot> advisory) {
    String yearGet = ModalRoute.of(context).settings.arguments;
    return SingleChildScrollView(
      child: Column(
        children: [
          ExpansionTile(
            initiallyExpanded: true,
            title: Text("$yearGet Executive Committee Members",
                style: TextStyle(
                    color: ArgonColors.text,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
            children: [
              Container(
                height: 260 * (executive.length / 1.6),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 15),
                    itemCount: executive.length,
                    itemBuilder: (context, index) {
                      return CardProfile(
                          cta: "View prof",
                          title: '${executive[index].data()["name"]}',
                          subtitle: "(${executive[index].data()["role"]})",
                          image: "${executive[index].data()["path"]}",
                          tap: () {
                            Navigator.pushNamed(context, '/home');
                          });
                    }),
              )
            ],
          ),
          ExpansionTile(
            initiallyExpanded: true,
            title: Text("$yearGet Advisory Committee Members",
                style: TextStyle(
                    color: ArgonColors.text,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
            children: [
              Container(
                height: 260 * (advisory.length / 1.6),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 15),
                    itemCount: advisory.length,
                    itemBuilder: (context, index) {
                      return CardProfile(
                          cta: "View prof",
                          title: '${advisory[index].data()["name"]}',
                          subtitle: "(${advisory[index].data()["role"]})",
                          image: "${advisory[index].data()["path"]}",
                          tap: () {
                            Navigator.pushNamed(context, '/home');
                          });
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }
}
