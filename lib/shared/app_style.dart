import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const primaryColor =Color(0xff00BF9F);

const tittleTextColor = Color(0xff404A69);

const lightTittleTextColor = Color(0xff6C748C);

const lightText = Color(0xff535355);

const headText = Color(0xff343434);



const metropolisBlack = 'Metropolis_Black' ;

const metropolisExtraBold = 'Metropolis_ExtraBold';

const metropolisMedium ='Metropolis_Medium';

const metropolisRegular = 'Metropolis_Regular';

const metropolisSemiBold = 'Metropolis_SemiBold';

const metropolisBold='Metropolis_Bold';






Widget defaultMaterialButton({ buttonTextStyle ,buttonText , press , buttonPadding , buttonColor , buttonTextColor}) => Padding(
  padding: buttonPadding,
  child: SizedBox(
    height: 50.0,
    width: double.infinity,
    child: MaterialButton(
      onPressed: press,
      color: buttonColor,
      child:  Text(
        buttonText,
        style:  TextStyle(
          color: buttonTextColor,
          fontFamily: 'Metropolis_Bold',
          fontSize: 15.0,
        ),
      ),
    ),
  ),
);

Future defaultNavigator ( {context, page})=>Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context)=> page,
  ),
);

Widget defaultIconButton({buttonIcon , press ,  buttonColor , buttonIconColor , buttonIconSize}) => IconButton(
  onPressed: press,
  icon:  Icon(
    buttonIcon,
    color: buttonIconColor,
    size: buttonIconSize,

  ),
  color: buttonColor,
);

Widget defaultTextField({  bordColor ,  dynamic textFieldValidator ,iconButtonPadding, String? hintText , Color? fillColor ,  TextStyle? hintStyle ,  required TextEditingController controller , isPassword , keyboardType}) => Padding(
  padding: iconButtonPadding,
  child:   Container(
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
    child:   TextFormField(
      validator: textFieldValidator ,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isPassword,
      style:  TextStyle(
        color: bordColor,
      ),
      decoration: InputDecoration(
        hoverColor: bordColor,
        hintText: hintText,
        hintStyle:hintStyle,
        fillColor: fillColor ,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none),
        filled: true ,
        border:  const OutlineInputBorder(
            borderSide:  BorderSide.none,
        ),

      ),
    ),
  ),
);


