import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/models/hotel_model/hotel_rooms_model.dart';
import 'package:summer_app/shared/app_style.dart';

class HotelRoomsScreen extends StatefulWidget
{
  const HotelRoomsScreen({Key? key}) : super(key: key);
  @override
  _HotelRoomsScreenState createState() => _HotelRoomsScreenState();
}

class _HotelRoomsScreenState extends State<HotelRoomsScreen>
{
  bool favHotel = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading: defaultIconButton(
          buttonIconSize: 30.0,
          buttonIconColor: lightText,
          buttonIcon: Icons.keyboard_arrow_left,
          buttonColor: Colors.white,
          press:(){
            Navigator.pop(context);
          },
        ),
        actions: [
          defaultIconButton(
            buttonIconSize: 30.0,
            buttonIconColor: lightText,
            buttonIcon: favHotel ? Icons.favorite: Icons.favorite_border,
            buttonColor: Colors.white,
            press:(){
              setState(() {
                favHotel = !favHotel;
              });
            },
          ),
        ],
        title: const Text(
          "Grand Royal Hotel",
          style: TextStyle(
            fontFamily: 'Metropolis_Black',
            color: tittleTextColor,
            fontSize: 20.0,
          ),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context , index)=>hotelRoomItemBuild(index),
        itemCount: hotelRoomsModel.length,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }

  Widget hotelRoomItemBuild(index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200.0,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(hotelRoomsModel[index].roomPic),
              fit: BoxFit.cover,
            )
          ),
        ),
        const SizedBox(height: 10.0,),
        Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotelRoomsModel[index].roomType,
                        style: const TextStyle(
                          fontFamily: metropolisBold,
                          color: lightText,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Row(
                        children: [
                          Text(
                            hotelRoomsModel[index].roomPrice,
                            style: const TextStyle(
                              fontFamily: metropolisBold,
                              color: lightText,
                              fontSize: 16.0,
                            ),
                          ),
                          const Text(
                            " per night",
                            style: TextStyle(
                              fontFamily: metropolisExtraBold,
                              color: lightText,
                              fontSize: 14.0,
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: (){},
                    color: primaryColor,
                    child: const Text(
                      "Book Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: metropolisBold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    hotelRoomsModel[index].roomPeopleNum,
                    style: const TextStyle(
                      color: lightText ,
                      fontFamily: metropolisRegular ,
                      fontSize: 13.0,
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Room Detail > ",
                        style: TextStyle(
                          color: lightText,
                          fontSize: 13.0,
                          fontFamily: metropolisRegular,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
            ],
          ),
        ),
      ],
    );
  }
}
