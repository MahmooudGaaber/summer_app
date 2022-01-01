import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/models/filter_screen_model/filter_screen_model.dart';
import 'package:summer_app/shared/app_style.dart';

class FilterScreen extends StatefulWidget
{
  const FilterScreen({Key? key}) : super(key: key);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen>
{

  RangeValues currentRangeValues = const RangeValues(300, 800);
  RangeLabels currentLabelsValues =  const RangeLabels("300\$", "800\$");
  double currentSliderValue = 2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Filter",
          style: TextStyle(
            fontFamily: 'Metropolis_Black',
            color: tittleTextColor,
            fontSize: 20.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              const Text( "Price",  style: TextStyle(
                fontFamily: metropolisExtraBold ,
                fontSize: 17.0,
                color: Colors.grey ,
              ), ),
              const SizedBox(height: 20.0,),
              RangeSlider(
                values: currentRangeValues,
                activeColor: primaryColor,
                inactiveColor: Colors.grey,
                max: 1000,
                min: 100,
                labels:currentLabelsValues,
                onChanged: ( values) {
                setState(() {
                  currentRangeValues = values;
                  currentLabelsValues = RangeLabels(
                      values.start.round().toString(),
                      values.end.round().toString()
                  );
                });
                },

              ),
              const SizedBox(height: 10.0,),
              const Divider(
                height: 2.0,
                color: Colors.grey,
                thickness: 0.5,
              ),
              const SizedBox(height: 20.0,),
              const Text( "Popular Filters",  style: TextStyle(
                fontFamily: metropolisExtraBold ,
                fontSize: 17.0,
                color: Colors.grey ,
              ), ),
              const SizedBox(height: 20.0,),
              SizedBox(
                height: 130.0,
                width: MediaQuery.of(context).size.width ,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:filterScreenCheckBoxModel.length ,
                    gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:  2 ,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 9),
                    ),
                    itemBuilder:(context , index)=> checkBoxBuildItem(index),
                ),
              ),
              const SizedBox(height: 10.0,),
              const Divider(
                height: 2.0,
                color: Colors.grey,
                thickness: 0.5,
              ),
              const SizedBox(height: 20.0,),
              const Text( "Distance from the city center",  style: TextStyle(
                fontFamily: metropolisExtraBold ,
                fontSize: 17.0,
                color: Colors.grey ,
              ), ),
              const SizedBox(height: 20.0,),
              Row(
                children: const [
                  Spacer(),
                  Text(
                    "Less than 2 km",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15.0,
                      fontFamily: metropolisExtraBold,
                    ),
                  ),
                  Spacer(),

                ],
              ),
              const SizedBox(height: 10.0,),
              Slider(
                value: currentSliderValue,
                max: 15,
                activeColor: primaryColor,
                inactiveColor: Colors.grey  ,
                label: currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    currentSliderValue = value;
                  });
                },
              ),
              const SizedBox(height: 10.0,),
              const Divider(
                height: 2.0,
                color: Colors.grey,
                thickness: 0.5,
              ),
              const SizedBox(height: 20.0,),
              const Text( "Type of Accommodation",  style: TextStyle(
                fontFamily: metropolisExtraBold ,
                fontSize: 17.0,
                color: Colors.grey ,
              ), ),
              const SizedBox(height: 20.0,),
              SizedBox(
                height:350.0 ,
                child: ListView.builder(
                    itemBuilder: (context , index)=>switchBuildItem(index),
                    itemCount:filterScreenSwitchModel.length ,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget checkBoxBuildItem(index){
    return  InkWell(
      onTap: (){
        setState(() {
          filterScreenCheckBoxModel[index].checkBoxValue =!filterScreenCheckBoxModel[index].checkBoxValue ;
        });
      },
      child: SizedBox(
        height: 20.0,
        width: MediaQuery.of(context).size.width/2,
        child: Row(
          children: [
            Container(
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.5,
                  )
              ),
              child: filterScreenCheckBoxModel[index].checkBoxValue ?  const Icon(
                Icons.check,
                size: 25.0,
                color: Colors.grey,
              )  :const Text("") ,
            ),
            const SizedBox(width: 8.0,),
            Text(
              filterScreenCheckBoxModel[index].checkBoxTittle,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 15.0,
                fontFamily: metropolisExtraBold,
              ),
            ),
          ],
        ),
      ),
    ) ;
  }

  Widget switchBuildItem(index){
    return SwitchListTile(
      title:   Text(
        filterScreenSwitchModel[index].switchTittle,
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 15.0,
          fontFamily: metropolisExtraBold,
        ),
      ),
      value: filterScreenSwitchModel[index].switchValue,
      activeColor: primaryColor,
      onChanged: (bool value) {
        setState(() {
          filterScreenSwitchModel[index].switchValue = !filterScreenSwitchModel[index].switchValue;
        });
      },
    );
  }

}

