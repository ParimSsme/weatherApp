import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const apiKey = 'f58ef0b6dc7c535f3283ee133ab734b7';
const openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather";

const kLightColor = Colors.white;
const kMidLightColor = Colors.white60;
const kOverLayColor = Colors.white10;
const kDarkColor = Colors.white24;
var kTextFieldTextStyle = GoogleFonts.monda(
  color: kMidLightColor,
  fontSize: 16,
);

var TextFieldInputDecoration = InputDecoration(
  fillColor: kOverLayColor,
  filled: true,
  hintText: 'Enter City Name',
  hintStyle: kTextFieldTextStyle,
  border: const OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  prefixIcon: const Icon(Icons.search),
);

var kLocationTextStyle = GoogleFonts.monda(
  fontSize: 25,
  color: Colors.white,
);

var DetailsTextStyle = GoogleFonts.monda(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: kLightColor,
);

var kTempTextStyle = GoogleFonts.daysOne(
  fontSize: 80,
  fontWeight: FontWeight.w900,
  color: kLightColor,
);

var KDetailsTitleTextStyle = GoogleFonts.monda(
  fontSize: 20,
  color: kDarkColor,
);

var kDetailsSuffixTextStyle = GoogleFonts.monda(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: kMidLightColor,
);
