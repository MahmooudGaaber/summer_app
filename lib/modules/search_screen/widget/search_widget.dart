import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/modules/hotel/hotel_main_screen.dart';
import 'package:summer_app/shared/app_style.dart';

class SearchWidget extends StatefulWidget
{
  const SearchWidget({Key? key}) : super(key: key);
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget>
{
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Material(
        elevation: 8.0,
        child: Container(
          height: 250.0,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 2,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child:   TextField(
                    controller: searchController,
                    style:  const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search ,
                        size: 30.0,
                        color: primaryColor,),
                      hintText: "Try London",
                      hintStyle:TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontFamily: metropolisBold,
                      ),
                      fillColor: Colors.white ,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none),
                      filled: true ,
                      border:  OutlineInputBorder(
                        borderSide:  BorderSide.none,
                      ),

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Choose Date",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: metropolisExtraBold,
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        Text(
                          "23 Dec - 24 Dec",
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: metropolisExtraBold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50, child: VerticalDivider(color: Colors.black)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "No of Rooms",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: metropolisExtraBold,
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        Text(
                          "1 room - Double",
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: metropolisExtraBold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35.0,),
              defaultMaterialButton(
                buttonPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                press: (){
                  defaultNavigator(page:const HotelMainScreen(),context: context,);
                },
                buttonText: "Search Hotels",
                buttonTextColor: Colors.white,
                buttonColor: primaryColor,
                buttonTextStyle: const TextStyle(fontFamily: metropolisExtraBold,fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
