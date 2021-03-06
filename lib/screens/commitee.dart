import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:TamilSangam/constants/Theme.dart';

//widgets
import 'package:TamilSangam/widgets/drawer.dart';
import 'package:TamilSangam/widgets/navbar.dart';

class Commitee extends StatefulWidget {
  @override
  _CommiteeState createState() => _CommiteeState();
}

class _CommiteeState extends State<Commitee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Commitee",
          rightOptions: true,
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "commitee"),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("commiteeMembers")
                .orderBy("year", descending: true)
                .snapshots(),
            builder: (context, yearGetter) {
              if (yearGetter.hasData) {
                return Container(
                    padding: EdgeInsets.only(right: 24, left: 24, bottom: 0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(yearGetter.data.docs.length,
                            (index) => yearCardin(yearGetter.data.docs, index)),
                      ),
                    ));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }

  Widget yearCardin(List<QueryDocumentSnapshot> yearvalueGet, index) {
    String king = yearvalueGet[index].data()['year'].substring(2);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/commiteeList',
            arguments: yearvalueGet[index].data()['year']);
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6,
            child: Card(
              color: ArgonColors.primary,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width / 2, 16.5, 10, 16.5),
                  child: Text("20",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ArgonColors.white,
                          fontSize: 100)),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.height / 6,
              child: Card(
                color: ArgonColors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 16.5, 10, 16.5),
                    child: Text("$king",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ArgonColors.black,
                            fontSize: 40)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
