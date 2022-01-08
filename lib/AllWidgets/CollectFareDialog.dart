import 'package:taxi_rouge_app/Assistants/assistantMethods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollectFareDialog extends StatelessWidget{

  final String paymentMethod;
  final int fareAmount;

  CollectFareDialog({required this.paymentMethod, required this.fareAmount});
  @override
  Widget build(BuildContext context)
  {
    return Dialog(
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

            Text("Trip Fare"),

            SizedBox(height: 22.0,),

            Divider(height: 2.0, thickness: 2.0,),

            SizedBox(height: 16.0,),

            Text("$fareAmount\D\H", style:  TextStyle(fontSize: 55.0, fontFamily: "Brand-Bold"),),

            SizedBox(height: 16.0,),SizedBox(height: 16.0,),

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
                  Navigator.pop(context, "close");
                },
                color: Colors.pink,
                child: Padding(
                  padding: EdgeInsets.all(17.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pay Cash",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.white),),
                      Icon(Icons.attach_money, color: Colors.white, size: 26.0,),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0,),
          ],
        ),
      ),
    );
  }
}