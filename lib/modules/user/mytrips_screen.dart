import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/models/user/trips_model.dart';
import 'package:summer_app/shared/app_style.dart';

class TripsScreen extends StatefulWidget
{
  const TripsScreen({Key? key}) : super(key: key);
  @override
  _TripsScreenState createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen>
{
  int selectedIndex = 0 ;
  List<String> categories = ["Upcoming", "Finished" , "Favourites"] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0,),
              const Text(
                "My Trips" ,
                style: TextStyle(
                  fontFamily: 'Metropolis_Black',
                  color: tittleTextColor,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(height: 30.0,),
              Container(
                height: 50.0,
                decoration:BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25.0),
                ) ,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount:categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context,index){
                    return Center(child: buildCategory(index));
                  } ,
                ),
              ),
              const SizedBox(height: 30.0,),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount:hotelsDetailModels.length,
                  itemBuilder:(context,index){
                    return buildTrips(index);
                  } ,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Text(
          categories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            color: selectedIndex == index ? primaryColor : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildTrips(int index){
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Text(
              "${hotelsDetailModels[index].tripStart} - ${hotelsDetailModels[index].tripEnd}, ${hotelsDetailModels[index].numOfRooms} - ${hotelsDetailModels[index].numOfPeople}",
              style: const TextStyle(
                fontFamily: metropolisBold ,
                color: Colors.black54,
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 15.0,),
        SizedBox(
          height: 270.0,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 150.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  image: DecorationImage(
                    image:AssetImage(hotelsDetailModels[index].hotelImg),
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
                  height: 120.0,
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Grand Royal\nPark Hotel",
                              style: TextStyle(
                                fontFamily: metropolisBold,
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              "    280\$\n/ per night",
                              style: TextStyle(
                                fontFamily: metropolisBold,
                                color: Colors.black54,
                                fontSize: 13.0,
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
                                color: Colors.black54,
                                fontSize: 11.0,
                              ),
                            ),
                            SizedBox(width: 5.0,),
                            Icon(
                              Icons.location_on,
                              color: primaryColor,
                              size: 10.0,
                            ),
                            SizedBox(width: 3.0,),
                            Text(
                              "2km from city center",
                              style: TextStyle(
                                fontFamily: metropolisBold,
                                color: Colors.black54,
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

        ),
        const SizedBox(height: 40.0,),
      ],
    );
  }


}
