import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/modules/user/porfile_screen.dart';
import 'package:summer_app/modules/search_screen/search_screen.dart';
import 'package:summer_app/shared/app_style.dart';

import 'user/mytrips_screen.dart';

class BottomNavi extends StatefulWidget
{
  const BottomNavi({Key? key}) : super(key: key);
  @override
  _BottomNaviState createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi>
{

  final List<Widget> _widgetoption = <Widget> [
    const SearchScreen(),
    const TripsScreen(),
    const ProfileScreen(),
  ];


  late int _selectedIndex=0 ;


  void _onItemTapped (int index){
    setState(() {
      _selectedIndex = index ;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar:  SizedBox(
        height: 70.0,
        child: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          selectedLabelStyle: const TextStyle(
            color: tittleTextColor,
          ),
          unselectedLabelStyle:const TextStyle(
            color: primaryColor,
          ) ,
          showUnselectedLabels: true,
          currentIndex:_selectedIndex ,
          unselectedItemColor: tittleTextColor,
          selectedItemColor:primaryColor ,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                size: 30,
              ),
              label: "Trips",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetoption.elementAt(_selectedIndex),
      ),
    );
  }
}
