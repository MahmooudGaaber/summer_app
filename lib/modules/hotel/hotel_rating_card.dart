import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/shared/app_style.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius:  BorderRadius.circular(15.0),
      elevation: 8.0,
      child: Container(
        height: 190.0,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children:  [
                  const Text(
                    "8.9",
                    style: TextStyle(
                      fontFamily: metropolisBold,
                      color: tittleTextColor,
                      fontSize: 40.0,
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        "Overall Rating",
                        style: TextStyle(
                          fontFamily: metropolisBold,
                          color: tittleTextColor,
                          fontSize: 13.0,
                        ),
                      ),
                      Row(
                        children:  const [
                          Icon(
                            Icons.star,
                            color: tittleTextColor,
                            size: 13.0,
                          ),
                          Icon(
                            Icons.star,
                            color: tittleTextColor,
                            size: 13.0,
                          ),
                          Icon(
                            Icons.star,
                            color: tittleTextColor,
                            size: 13.0,
                          ),
                          Icon(
                            Icons.star,
                            color: tittleTextColor,
                            size: 13.0,
                          ),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const Text(
                    "Rooms",
                    style: TextStyle(
                      fontFamily: metropolisBold,
                      color: tittleTextColor,
                      fontSize: 15.0,
                    ),
                  ),
                  Container(
                    height: 8.0,
                    width: MediaQuery.of(context).size.width/1.6,
                    decoration: BoxDecoration(
                      color:tittleTextColor ,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const Text(
                    "Rooms",
                    style: TextStyle(
                      fontFamily: metropolisBold,
                      color: tittleTextColor,
                      fontSize: 15.0,
                    ),
                  ),
                  Container(
                    height: 8.0,
                    width: MediaQuery.of(context).size.width/1.6,
                    decoration: BoxDecoration(
                      color:Colors.grey ,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const Text(
                    "Rooms",
                    style: TextStyle(
                      fontFamily: metropolisBold,
                      color: tittleTextColor,
                      fontSize: 15.0,
                    ),
                  ),
                  Container(
                    height: 8.0,
                    width: MediaQuery.of(context).size.width/1.6,
                    decoration: BoxDecoration(
                      color:tittleTextColor ,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const Text(
                    "Rooms",
                    style: TextStyle(
                      fontFamily: metropolisBold,
                      color: tittleTextColor,
                      fontSize: 15.0,
                    ),
                  ),
                  Container(
                    height: 8.0,
                    width: MediaQuery.of(context).size.width/1.6,
                    decoration: BoxDecoration(
                      color:tittleTextColor ,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
