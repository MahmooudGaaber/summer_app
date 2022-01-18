import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/models/hotel_model/hotel_model.dart';
import 'package:summer_app/models/search_model/search_model.dart';
import 'package:summer_app/shared/app_style.dart';

class PopularDestination extends StatefulWidget
{
  const PopularDestination({Key? key}) : super(key: key);
  @override
  _PopularDestinationState createState() => _PopularDestinationState();
}

class _PopularDestinationState extends State<PopularDestination>
{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
      ) ,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount:hotelModel[0].photos.length,
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemBuilder:(context,index){
          return popularDestinationBuildItem(index);
        } ,
      ),
    );
  }
  Widget popularDestinationBuildItem(int index){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Stack(
        children: [
          Container(
            width: 250.0 ,
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(hotelModel[index].mainImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            child: Text(
              hotelModel[index].location,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: metropolisBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
