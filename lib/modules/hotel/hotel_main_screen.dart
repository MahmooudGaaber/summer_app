import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/models/hotel_model/hotel_model.dart';
import 'package:summer_app/shared/app_style.dart';

import 'hotel_details_screen.dart';
import 'hotels_rooms_screen.dart';

class HotelMainScreen extends StatefulWidget
{
  const HotelMainScreen({Key? key}) : super(key: key);
  @override
  _HotelMainScreenState createState() => _HotelMainScreenState();
}

class _HotelMainScreenState extends State<HotelMainScreen>
{
  bool favHotel = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children:  [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:  Image(
              image:NetworkImage( hotelModel[0].mainImage) ,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 10.0,
            right: 10.0,
            top: 80.0,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                defaultIconButton(
                  buttonIconSize: 40.0,
                  buttonIconColor: primaryColor,
                  buttonIcon: Icons.keyboard_arrow_left,
                  buttonColor: lightTittleTextColor,
                  press:(){
                    Navigator.pop(context);
                  },
                ),

                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: defaultIconButton(
                    buttonIconSize: 25.0,
                    buttonIconColor: primaryColor,
                    buttonIcon: favHotel ? Icons.favorite: Icons.favorite_border,
                    buttonColor: Colors.white,
                    press:(){
                     setState(() {
                       favHotel = !favHotel ;
                     });
                    },
                  ),
                ),


              ],
            ) ,
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
                            children:  [
                              Text(
                                hotelModel[0].name,
                                style: const TextStyle(
                                  fontFamily: metropolisBold,
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              // Text(
                              //   hotelModel[0].hotelPrice,
                              //   style: const TextStyle(
                              //     fontFamily: metropolisBold,
                              //     color: Colors.white,
                              //     fontSize: 15.0,
                              //   ),
                              // ),

                            ],
                          ),
                          const SizedBox(height: 15.0,),
                          Row(
                            children:  [
                              Text(
                                hotelModel[0].location,
                                style: const TextStyle(
                                  fontFamily: metropolisBold,
                                  color: Colors.white,
                                  fontSize: 11.0,
                                ),
                              ),
                              const SizedBox(width: 5.0,),
                              const Icon(
                                  Icons.location_on,
                                color: primaryColor,
                                size: 10.0,
                              ),
                              const SizedBox(width: 3.0,),
                              // Text(
                              //   hotelModel[0].hotelFarAway,
                              //   style: const TextStyle(
                              //     fontFamily: metropolisBold,
                              //     color: Colors.white,
                              //     fontSize: 11.0,
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 10.0,),
                          Row(
                            children:  const [
                              Icon(
                                Icons.star,
                                color: primaryColor,
                                size: 13.0,
                              ),
                              Icon(
                                Icons.star,
                                color: primaryColor,
                                size: 13.0,
                              ),
                              Icon(
                                Icons.star,
                                color: primaryColor,
                                size: 13.0,
                              ),
                              Icon(
                                Icons.star,
                                color: primaryColor,
                                size: 13.0,
                              ),
                              Icon(
                                Icons.star_border,
                                color: primaryColor,
                                size: 13.0,
                              ),
                              SizedBox(width: 5.0,),
                              // Text(
                              //   hotelModel[0].hotelNumOfReviews,
                              //   style: const TextStyle(
                              //     fontFamily: metropolisBold,
                              //     color: Colors.white,
                              //     fontSize: 11.0,
                              //   ),
                              // ),
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
                            press: (){
                              defaultNavigator(page:const HotelRoomsScreen(),context: context,);
                            },
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
                  onPressed: (){
                    defaultNavigator(page:const HotelsDetailsScreen(),context: context,);
                  },
                  disabledColor: Colors.transparent,
                  child:  Row(
                    children: const [
                      Text(
                        "More Details ",
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
