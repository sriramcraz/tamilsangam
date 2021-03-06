import 'package:flutter/material.dart';
import 'package:TamilSangam/constants/Theme.dart';

class CardProfile extends StatelessWidget {
  CardProfile(
      {this.title = "Placeholder Title",
      this.cta = "",
      this.image = "https://via.placeholder.com/200",
      this.tap = defaultFunc,
      this.subtitle});

  final String cta;
  final dynamic image;
  final Function tap;
  final String subtitle;
  final String title;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Card(
          elevation: 3.4,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.0),
                    topRight: Radius.circular(6.0)),
                child: Image.network(
                  image,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(image); //do something
                  },
                  loadingBuilder: (BuildContext context, Widget child,
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
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, bottom: 0.0, left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            color: ArgonColors.header,
                            fontWeight: FontWeight.bold,
                            fontSize: 13)),
                    Text(subtitle,
                        style:
                            TextStyle(color: ArgonColors.header, fontSize: 13)),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
