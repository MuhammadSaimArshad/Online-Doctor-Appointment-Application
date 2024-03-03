import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Ratingscreen extends StatefulWidget {
  const Ratingscreen({super.key});

  @override
  State<Ratingscreen> createState() => _RatingscreenState();
}

class _RatingscreenState extends State<Ratingscreen> {
  double fullrating = 0;
  double halfrating = 0;
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height * 0.09,
          width: width * 0.07,
          color: Colors.white,
          child: Column(
            children: [
              //fullrating
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                "Full Rating",
                style: TextStyle(
                    fontSize: width * 0.04, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  unratedColor: Colors.grey,
                  itemCount: 5,
                  itemSize: 30,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  updateOnDrag: true,
                  itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Color(0xff0EBE7F),
                        size: width * 0.03,
                      ),
                  onRatingUpdate: (ratingvalue) {
                    setState(() {
                      fullrating = ratingvalue;
                    });
                  }),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                "Rating : $fullrating",
                style: TextStyle(
                    fontSize: width * 0.03, fontWeight: FontWeight.bold),
              ),
              // halfrating
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                "Half & Full Rating",
                style: TextStyle(
                    fontSize: width * 0.03, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              RatingBar.builder(
                  initialRating: 0,
                  allowHalfRating: true,
                  minRating: 1,
                  unratedColor: Colors.grey,
                  itemCount: 5,
                  itemSize: 30,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  updateOnDrag: true,
                  itemBuilder: (context, index) => Icon(
                        Icons.star,
                        size: width * 0.03,
                        color: Color(0xff0EBE7F),
                      ),
                  onRatingUpdate: (ratingvalue) {
                    setState(() {
                      halfrating = ratingvalue;
                    });
                  }),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                "Rating : $halfrating",
                style: TextStyle(
                    fontSize: width * 0.03, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
