import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const apiKey = 'f58ef0b6dc7c535f3283ee133ab734b7';
const openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather";

const KLightColor = Colors.white;
const KMidLightColor = Colors.white60;
const KOverLayColor = Colors.white10;
const KDarkColor = Colors.white24;
var KTextFieldTextStyle = GoogleFonts.monda(
  color: KMidLightColor,
  fontSize: 16,
);

var TextFieldInputDecoration = InputDecoration(
  fillColor: KOverLayColor,
  filled: true,
  hintText: 'Enter City Name',
  hintStyle: KTextFieldTextStyle,
  border: const OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  prefixIcon: const Icon(Icons.search),
);

var KLocationTextStyle = GoogleFonts.monda(
  fontSize: 25,
  color: Colors.white,
);

var DetailsTextStyle = GoogleFonts.monda(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: KLightColor,
);

var KTempTextStyle = GoogleFonts.daysOne(
  fontSize: 80,
  fontWeight: FontWeight.w900,
  color: KLightColor,
);

var KDetailsTitleTextStyle = GoogleFonts.monda(
  fontSize: 20,
  color: KDarkColor,
);

var KDetailsSuffixTextStyle = GoogleFonts.monda(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: KMidLightColor,
);
