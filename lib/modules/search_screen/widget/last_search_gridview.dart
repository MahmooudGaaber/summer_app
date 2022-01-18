import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/models/hotel_model/hotel_model.dart';
import 'package:summer_app/models/search_model/search_model.dart';
import 'package:summer_app/shared/app_style.dart';

class LastSearchGridView extends StatefulWidget
{
  const LastSearchGridView({Key? key}) : super(key: key);
  @override
  _LastSearchGridViewState createState() => _LastSearchGridViewState();
}

class _LastSearchGridViewState extends State<LastSearchGridView>
{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.0,
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
      ) ,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount:userSearchedHotels.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder:(context,index){
          return buildLastSearch(userSearchedHotels[index] , userSearchHistory[index]);
        } ,
      ),
    );
  }
  Widget buildLastSearch(HotelModel hotelModel , SearchModel searchModel ){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          SizedBox(
            height: 230.0,
            width: 120.0,
            child: Column(
              children: [
                Container(
                  height: 150.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    image: DecorationImage(
                      image:NetworkImage(hotelModel.mainImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Material(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  elevation: 7.0,
                  child: Container(
                    height: 80.0,
                    width:120.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hotelModel.location,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontFamily: metropolisBold,
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                          Text(
                            searchModel.numberOfRooms,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                          const SizedBox(height: 5.0,),
                          Text(
                            searchModel.tripDate,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ),
        ],
      ),
    );
  }
}
