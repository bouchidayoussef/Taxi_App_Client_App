import 'package:firebase_database/firebase_database.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:taxi_rouge_app/Assistants/assistantMethods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configMaps.dart';

class RatingScreen extends StatefulWidget{
final String driverId;
RatingScreen({required this.driverId});

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: Colors.transparent,
        child: Container(
          margin: EdgeInsets.all(5.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 22.0,),

              Text(
                "Rate this Driver",
                style: TextStyle(fontSize: 20.0, fontFamily: "Brand bold", color: Colors.black54),
              ),

              SizedBox(height: 22.0,),

              Divider(height: 2.0, thickness: 2.0,),

              SizedBox(height: 16.0,),

              SmoothStarRating(
                rating: starCounter,
                color: Colors.yellowAccent,
                allowHalfRating: false,
                starCount: 5,
                size: 45,
                onRated: (value)
                {
                  starCounter = value;

                  if(starCounter == 1)
                    {
                      setState(() {
                        title = "Very Bad";
                      });
                    }
                  if(starCounter == 2)
                  {
                    setState(() {
                      title = " Bad";
                    });
                  }
                  if(starCounter == 3)
                  {
                    setState(() {
                      title = "Good";
                    });
                  }
                  if(starCounter == 4)
                  {
                    setState(() {
                      title = "Very Good";
                    });
                  }
                  if(starCounter == 5)
                  {
                    setState(() {
                      title = "Exellent";
                    });
                  }

                },

              ),

              SizedBox(height: 14.0,),

              Text(title, style: TextStyle(fontSize: 55.0, fontFamily: "Signatra", color: Colors.yellowAccent),),

              SizedBox(height: 16.0,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("This is the total trip amount, it has been charged to the rider.", textAlign:  TextAlign.center,),
              ),

              SizedBox(height: 20.0,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () async
                  {
                    DatabaseReference driverRatingRef = FirebaseDatabase.instance.reference()
                        .child("drivers")
                        .child(widget.driverId)
                        .child("ratings");

                    driverRatingRef.once().then((DataSnapshot snap)
                    {
                      if(snap.value != null)
                        {
                          double oldRatings = double.parse(snap.value.toString());
                          double addRatings = oldRatings + starCounter;
                          double averageRatings = addRatings/2;
                          driverRatingRef.set(averageRatings.toString());
                        }
                      else
                        {
                          driverRatingRef.set(starCounter.toString());
                        }
                    });
                    
                    Navigator.pop(context);
                  },
                  color: Colors.pink,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Submit",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
            ],
          ),
        ),
      ),
    );
  }
}