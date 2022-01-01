import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/shared/app_style.dart';

class HotelMainScreen extends StatefulWidget
{
  const HotelMainScreen({Key? key}) : super(key: key);
  @override
  _HotelMainScreenState createState() => _HotelMainScreenState();
}

class _HotelMainScreenState extends State<HotelMainScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
          leading:
          defaultIconButton(
            buttonIconSize: 40.0,
            buttonIconColor: tittleTextColor,
            buttonIcon: Icons.keyboard_arrow_left,
            buttonColor: lightTittleTextColor,
            press:(){},
          ),
        actions: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
            ),
            child: defaultIconButton(
            buttonIconSize: 30.0,
            buttonIconColor: tittleTextColor,
            buttonIcon: Icons.favorite_border,
            buttonColor: lightTittleTextColor,
            press:(){},
            ),
          ),
          ],
      ),
      body: Stack(
        children:  [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Image(
              image:AssetImage("assets/images/hotelmainscreen.jpg") ,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 80.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 10.0 ,sigmaX: 10.0),
                  child: Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all( 20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Grand Royal\nPark Hotel",
                                style: TextStyle(
                                  fontFamily: metropolisBold,
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                "    280\$\n/ per night",
                                style: TextStyle(
                                  fontFamily: metropolisBold,
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),

                            ],
                          ),
                          const SizedBox(height: 15.0,),
                          Row(
                            children: const [
                              Text(
                                "Barcelona, spain",
                                style: TextStyle(
                                  fontFamily: metropolisBold,
                                  color: Colors.white,
                                  fontSize: 11.0,
                                ),
                              ),
                              SizedBox(width: 5.0,),
                              Icon(
                                  Icons.location_on,
                                color: tittleTextColor,
                                size: 10.0,
                              ),
                              SizedBox(width: 3.0,),
                              Text(
                                "2km from city center",
                                style: TextStyle(
                                  fontFamily: metropolisBold,
                                  color: Colors.white,
                                  fontSize: 11.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0,),
                          Row(
                            children: const [
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
                              Icon(
                                Icons.star_border,
                                color: tittleTextColor,
                                size: 13.0,
                              ),
                              SizedBox(width: 5.0,),
                              Text(
                                "80 Reviews",
                                style: TextStyle(
                                  fontFamily: metropolisBold,
                                  color: Colors.white,
                                  fontSize: 11.0,
                                ),
                              ),
                            ],
                          ),
                          defaultMaterialButton(
                            buttonColor: primaryColor,
                            buttonTextColor: Colors.white,
                            buttonText: "Book Now",
                            buttonTextStyle: const TextStyle(
                              fontSize: 18.0,
                              fontFamily: metropolisBold ,

                            ),
                            press: (){},
                            buttonPadding: const EdgeInsets.only(top: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom:20.0 ,
            left: 0.0,
            right: 0.0,
            child: Row(
              children: [
                const Spacer(),
                MaterialButton(
                  onPressed: (){},
                  color: Colors.transparent,
                  disabledColor: Colors.transparent,
                  child:  Row(
                    children: const [
                      Text(
                        "More Fetails ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: metropolisBold ,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Icon(
                          Icons.keyboard_arrow_down,
                        size: 18.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ) ,
    ) ;
  }
}
