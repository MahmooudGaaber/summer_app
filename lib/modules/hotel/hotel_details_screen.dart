import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/models/hotel_model/hotel_model.dart';
import 'package:summer_app/shared/app_style.dart';
import 'package:summer_app/shared/firebase_methods.dart';

import 'hotel_rating_card.dart';

class HotelsDetailsScreen extends StatefulWidget
{
  const HotelsDetailsScreen({Key? key}) : super(key: key);
  @override
  _HotelsDetailsScreenState createState() => _HotelsDetailsScreenState();
}

class _HotelsDetailsScreenState extends State<HotelsDetailsScreen>
{
  bool favHotel = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 350,
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
                        height: 35.0,
                        width: 35.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: defaultIconButton(
                          buttonIconSize: 17.5,
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.all( 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text(
                        hotelModel[0].name,
                        style: const TextStyle(
                          fontFamily: metropolisBold,
                          color: tittleTextColor,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0,),
                  Row(
                    children:  [
                      Text(
                        hotelModel[0].location,
                        style: const TextStyle(
                          fontFamily: metropolisBold,
                          color: lightText,
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
                      //     color: lightText,
                      //     fontSize: 11.0,
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 15.0,),
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
                  const SizedBox(height: 10.0,),
                  const Divider(height: 2.0,color: Colors.black,),
                  const SizedBox(height: 20.0,),
                  const Text(
                    "Summary",
                    style:TextStyle(
                      color: Colors.grey,
                      fontFamily: metropolisExtraBold ,
                    ) ,

                  ),
                  const SizedBox(height: 10.0,),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting , industry. Lorem Ipsum has been the industry's standard dummy , text ever since the 1500s, when an unknown printer took a galley , of type and scrambled it to make a type specimen book. It has",
                    maxLines: 10,
                    style:TextStyle(
                      color: Colors.black87,
                      fontFamily: metropolisExtraBold ,
                    ) ,

                  ),
                  const SizedBox(height: 10.0,),
                  InkWell(
                    onTap: (){},
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10.0 ,top: 10.0, bottom: 10.0),
                      child: Text(
                        "Read More... ",
                        style:  TextStyle(
                          color: primaryColor,
                          fontFamily: 'Metropolis_Bold',
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0,),
                  const RatingCard(),
                  const SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                          "Photos",
                        style: TextStyle(
                          fontFamily: metropolisBold ,
                          color: lightText ,
                          fontSize: 20.0 ,
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10.0 ,top: 10.0, bottom: 10.0),
                          child: Text(
                            "View All ",
                            style:  TextStyle(
                              color: primaryColor,
                              fontFamily: 'Metropolis_Bold',
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                    height: 130.0,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                    ) ,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount:hotelModel[0].photos.length,
                      shrinkWrap: false,
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(context,index){
                        return hotelPhotosBuildItem(index);
                      } ,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget hotelPhotosBuildItem(int index){
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        width: 130.0 ,
        height: 130.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
            image: NetworkImage(hotelModel[0].photos[index]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

}
