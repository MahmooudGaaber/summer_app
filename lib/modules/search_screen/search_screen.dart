import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/models/hotel_model/hotel_model.dart';
import 'package:summer_app/models/search_model/search_model.dart';
import 'package:summer_app/modules/search_screen/widget/last_search_gridview.dart';
import 'package:summer_app/modules/search_screen/widget/popular_destination.dart';
import 'package:summer_app/modules/search_screen/widget/search_widget.dart';
import 'package:summer_app/shared/app_style.dart';

class SearchScreen extends StatefulWidget
{
  const SearchScreen({Key? key}) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
{

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height/1.4,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/2.3,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    image:AssetImage( hotelModel[0].hotelimg) ,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  bottom: 20.0,
                  left: 0.0,
                  right: 0.0,
                  child: SearchWidget(),
                ),
              ],
            ),
            const SizedBox(height: 30.0,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Last Search",
                style: TextStyle(
                  fontFamily: metropolisExtraBold,
                  color: Colors.black,
                  fontSize: 22.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0,),

            Container(
              height: 240.0,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ) ,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount:hotelImages.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder:(context,index){
                  return buildLastSearch(index);
                } ,
              ),
            ),
            const SizedBox(height: 30.0,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Popular Destinations",
                style: TextStyle(
                  fontFamily: metropolisExtraBold,
                  color: Colors.black,
                  fontSize: 22.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0,),
            const PopularDestination(),
            const SizedBox(height: 30.0,),
          ],
        ),
      ),
    );
  }

  Widget buildLastSearch(int index){
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
                      image:AssetImage(lastSearch[index].img),
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
                            lastSearch[index].city,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontFamily: metropolisBold,
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                          Text(
                            lastSearch[index].room,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                          const SizedBox(height: 5.0,),
                          Text(
                            lastSearch[index].date,
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
