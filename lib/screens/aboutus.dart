import 'package:flutter/material.dart';

import 'package:TamilSangam/constants/Theme.dart';

//widgets
import 'package:TamilSangam/widgets/navbar.dart';
import 'package:TamilSangam/widgets/drawer.dart';

class Aboutus extends StatelessWidget {
  // final GlobalKey _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "About us Page",
        // searchBar: true,
        // categoryOne: "Beauty",
        // categoryTwo: "Fashion",
      ),
      // backgroundColor: ArgonColors.bgColorScreen,
      // key: _scaffoldKey,
      drawer: ArgonDrawer(currentPage: "aboutus"),
      body: Center(
          // padding: EdgeInsets.only(left: 5.0, right: 5.0),
          /** Card Widget **/
          child: SingleChildScrollView(
              child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14.0, left: 2),
            child: Card(
              elevation: 5,
              // shadowColor: Colors.black,
              // color: Colors.greenAccent[100],
              child: SizedBox(
                width: 300,
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8.0,
                      ), //SizedBox
                      Text(
                        'North East Ohio Tamil Sangam (NEOTS)',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500), //Textstyle
                      ), //Text
                      SizedBox(
                        height: 8.0,
                      ), //SizedBox
                      Text(
                        'NEOTS is a membership based non-profit organization formed by the Tamil language speaking people of North East Ohio. NEOTS represents highly skilled professionals in various areas including Medical, Engineering and IT sectors hailing mainly from Tamil Nadu - India and Tamil Speaking expats from other parts of the world. The objectives of this organization are to promote the awareness of Tamil culture, Tamil heritage through social, cultural, literary, charitable and educational activities. As a non-profit organization, NEOTS will support andpromote such other exempt non-profit organizations (under section !',
                        style: TextStyle(
                          fontSize: 13,
                        ), //Textstyle
                      ), //Text
                      SizedBox(
                        height: 8.0,
                      ), //SizedBox
                    ],
                  ), //Column
                ), //Padding
              ), //SizedBox
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 7.0),
            child: Card(
              elevation: 5,
              // shadowColor: Colors.black,
              // color: Colors.greenAccent[100],
              child: SizedBox(
                width: 300,

                height: 510,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ), //SizedBox
                      Text(
                        'வடகிழக்கு ஒஹையோ தமிழ்ச் சங்கம்',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500), //Textstyle
                      ),
                      Text(
                        'வடகிழக்கு ஓஹையோ தமிழ்ச் சங்கம், க்ளீவ்லாந்து நகரைச் சார்ந்த பாரதி கலாச்சாரச் சங்கம் என்ற அமைப்பின் உருமாற்றம். க்ளீவ்லாந்து நகர் வாழ் புலம்பெயர்ந்த தமிழ் மக்களின் கலாச்சார வேட்கையைத் தணிக்கும் பணியை பாரதி கலாச்சாரச் சங்கம் பல வருடங்களாகச் செய்து வந்தது. பாரதி கலாச்சார சங்கத்தின் பயணத்தை வடகிழக்கு ஓஹையோ தமிழ்ச் சங்கம் தொடர்கிறது',
                      ),
                      SizedBox(
                        height: 10.0,
                      ), //SizedBox
                      Text(
                        'NEOTS is a membership based non-profit organization formed by the Tamil language speaking people of North East Ohio. NEOTS represents highly skilled professionals in various areas including Medical, Engineering and IT sectors hailing mainly from Tamil Nadu - India and Tamil Speaking expats from other parts of the world. The objectives of this organization are to promote the awareness of Tamil culture, Tamil heritage through social, cultural, literary, charitable and educational activities. As a non-profit organization, NEOTS will support andpromote such other exempt non-profit organizations (under section !',
                        style: TextStyle(
                          fontSize: 10,
                        ), //Textstyle
                      ), //Text
                      SizedBox(
                        height: 20.0,
                      ), //SizedBox
                    ],
                  ), //Column
                ), //Padding
              ), //SizedBox
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 7.0),
            child: Card(
              elevation: 5,
              // shadowColor: Colors.black,
              // color: Colors.greenAccent[100],
              child: SizedBox(
                width: 300,

                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ), //SizedBox
                      Text(
                        'அமைப்பின் குறிக்கோள்',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500), //Textstyle
                      ),
                      Text(
                        'வட கிழக்கு ஓஹையோ பகுதி வாழ் தமிழ் பேசும் உறுப்பினர்களைக் கொண்ட இலாப நோக்கற்ற அமைப்பாக சமுதாய மற்றும் கலை நிகழ்ச்சிகள், இலக்கிய, கல்வி மற்றும் பொதுத் தொண்டு போன்ற சேவைகள் வாயிலாக தமிழ் கலாச்சாரம், தமிழ் மரபு பற்றிய விழிப்புணர்வை மேம்படுத்த செயல்படும்.',
                      ),
                    ],
                  ), //Column
                ), //Padding
              ), //SizedBox
            ),
          )
        ],
      ))

          //Card
          ),
    );
  }
}
