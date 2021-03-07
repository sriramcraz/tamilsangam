import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:TamilSangam/constants/Theme.dart';

//widgets
import 'package:TamilSangam/widgets/navbar.dart';
import 'package:TamilSangam/widgets/card-horizontal.dart';
import 'package:TamilSangam/widgets/card-small.dart';
import 'package:TamilSangam/widgets/card-square.dart';
import 'package:TamilSangam/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

final Map<String, Map<String, String>> homeCards = {
  "Ice Cream": {
    "title": "Ice cream is made with carrageenan …",
    "image":
        "https://images.unsplash.com/photo-1516559828984-fb3b99548b21?ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80"
  },
  "Makeup": {
    "title": "Is makeup one of your daily esse …",
    "image":
        "https://images.unsplash.com/photo-1519368358672-25b03afee3bf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2004&q=80"
  },
  "Coffee": {
    "title": "Coffee is more than just a drink: It’s …",
    "image":
        "https://images.unsplash.com/photo-1500522144261-ea64433bbe27?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2102&q=80"
  },
  "Fashion": {
    "title": "Fashion is a popular style, especially in …",
    "image":
        "https://images.unsplash.com/photo-1487222477894-8943e31ef7b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1326&q=80"
  },
  "Argon": {
    "title": "Argon is a great free UI packag …",
    "image":
        "https://images.unsplash.com/photo-1482686115713-0fbcaced6e28?fit=crop&w=1947&q=80"
  }
};

class Home extends StatefulWidget {
  // final GlobalKey _scaffoldKey = new GlobalKey();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Home",
          // searchBar: false,
          // categoryOne: "Beauty",
          // categoryTwo: "Fashion",
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        // key: _scaffoldKey,
        drawer: ArgonDrawer(currentPage: "Home"),
        body: Container(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("homeadvertisments")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            elevation: 5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 16, 40, 16),
                              child: Text(
                                "NorthEast Ohio Tamil Sangam 'NEOTS'",
                                style: TextStyle(
                                    color: Color(0xFFE91E63),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        CarouselSlider(
                          items: List.generate(
                              snapshot.data.docs.length,
                              (index) =>
                                  sliderImage(snapshot.data.docs, index)),
                          options: CarouselOptions(
                            height: 180.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            viewportFraction: 0.8,
                            onPageChanged: (index, cpcReason) {
                              setState(() {
                                _current = index;
                                print("${_current}");
                              });
                            },
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                snapshot.data.docs.length,
                                (index) => Container(
                                      width: 8.0,
                                      height: 8.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: _current == index
                                              ? Color.fromRGBO(0, 0, 0, 0.9)
                                              : Color.fromRGBO(0, 0, 0, 0.4)),
                                    ))),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: CardHorizontal(
                            cta: "Donate",
                            title: "Please click here to donate NEOTS",
                            img:
                                "https://firebasestorage.googleapis.com/v0/b/tamilsangam-4e5d3.appspot.com/o/otherImage%2Fdonate.png?alt=media&token=68566b63-fd9e-47fe-8f9c-0ff47676433a",
                            tap: () async {
                              if (await canLaunch(
                                  "https://www.paypal.com/donate?token=un_ktQFebs2_0wGI9J2YW4j1V4PKAeBrT8lf_mcZIFg_Ed3jnH7sOa7Ar1xYfbQ2K8Cf8qPfIRteWVI2")) {
                                await launch(
                                    "https://www.paypal.com/donate?token=un_ktQFebs2_0wGI9J2YW4j1V4PKAeBrT8lf_mcZIFg_Ed3jnH7sOa7Ar1xYfbQ2K8Cf8qPfIRteWVI2");
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 8.0),
                        CardHorizontal(
                          cta: "To buy",
                          title:
                              "Please support our community by buying NEOTS 2021 Membership",
                          img:
                              "https://firebasestorage.googleapis.com/v0/b/tamilsangam-4e5d3.appspot.com/o/otherImage%2Fmembership3.jpg?alt=media&token=6dca68c1-08b9-4832-9b9d-1cf93eea6687",
                          tap: () async {
                            if (await canLaunch(
                                "https://www.paypal.com/webapps/shoppingcart?mfid=1615091326762_1d69e05b518f9&flowlogging_id=1d69e05b518f9#/checkout/shoppingCart")) {
                              await launch(
                                  "https://www.paypal.com/webapps/shoppingcart?mfid=1615091326762_1d69e05b518f9&flowlogging_id=1d69e05b518f9#/checkout/shoppingCart");
                            }
                          },
                        ),
                        SizedBox(height: 18.0),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     CardSmall(
                        //         cta: "View article",
                        //         title: homeCards["Makeup"]['title'],
                        //         img: homeCards["Makeup"]['image'],
                        //         tap: () {
                        //           // Navigator.pushNamed(context, '/home');
                        //         }),
                        //     CardSmall(
                        //         cta: "View article",
                        //         title: homeCards["Coffee"]['title'],
                        //         img: homeCards["Coffee"]['image'],
                        //         tap: () {
                        //           // Navigator.pushNamed(context, '/home');
                        //         })
                        //   ],
                        // ),

                        // Padding(
                        //   padding: const EdgeInsets.only(bottom: 32.0),
                        //   child: CardSquare(
                        //       cta: "View article",
                        //       title: homeCards["Argon"]['title'],
                        //       img: homeCards["Argon"]['image'],
                        //       tap: () {
                        //         // Navigator.pushNamed(context, '/home');
                        //       }),
                        // )
                      ],
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }

  Widget sliderImage(advertise, index) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage(advertise[index].data()['image']),
            fit: BoxFit.fill,
          ),
        ),
      ),
      onTap: () async {
        if (await canLaunch(advertise[index].data()['link'])) {
          await launch(advertise[index].data()['link']);
        }
      },
    );
  }
}
