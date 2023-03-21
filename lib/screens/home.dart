import 'package:clima/components/error_message.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../components/details_view.dart';
import '../components/loading_widget.dart';
import '../models/weather_model.dart';
import '../utilities/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  LocationPermission? permission;
  double? longitude, latitude;
  bool isDataLoaded = false;
  bool isErrorOccured = false;
  WeatherModel? weatherModel;
  int code = 0;
  Weather weather = Weather();
  dynamic weatherData;
  String? title, message;

  @override
  void initState() {
    super.initState();
    getPermission();
  }

  void getPermission() async {
    permission = await geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.unableToDetermine) {
      permission = await geolocatorPlatform.requestPermission();
      if (permission != LocationPermission.denied) {
        if (permission == LocationPermission.deniedForever) {
          setState((){
            isDataLoaded = true;
            isErrorOccured = true;
            title = 'Permission permanently denied';
            message = 'Please provide permission to the app from device settings';
          });
        } else {
          updateUI();
        }
      } else {
        updateUI(cityName: 'herat');
      }
    } else {
      updateUI();
    }
  }

  void updateUI({String? cityName}) async {
    weatherData = null;
    if(cityName==null || cityName==''){
      if (!await geolocatorPlatform.isLocationServiceEnabled()) {
        setState(() {
          isErrorOccured = true;
          isDataLoaded = true;
          title = 'Location is turned off';
          message =
          'Please enable the location service to see weather condition for your location';
        });
        return;
      }
      weatherData = await weather.getLocationWeather();
    } else {
      weatherData = await weather.getCityWeather(cityName);
    }

    if (weatherData==null){
      setState((){
        title = 'City not found';
        message = 'Please make sure you have entered the right city name';
        isDataLoaded = true;
        isErrorOccured = true;
        return;
      });
    }
    code = weatherData["weather"][0]["id"];

    weatherModel = WeatherModel(
        location: weatherData["name"] + ', ' + weatherData['sys']['country'],
        description: weatherData['weather'][0]['description'],
        temperature: weatherData['main']['temp'],
        feelsLike: weatherData['main']['feels_like'],
        humidity: weatherData['main']['humidity'],
        wind: weatherData['wind']['speed'],
        icon:
            'images/weather-icons/${getIconPrefix(code)}${kWeatherIcons[code.toString()]!["icon"]}.svg');
    setState(() {
      isDataLoaded = true;
      isErrorOccured = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isDataLoaded) {
      return const LoadingWidget();
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kOverLayColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        decoration: textFieldInputDecoration,
                        onSubmitted: (String typedName) {
                          setState((){
                            isDataLoaded = false;
                            updateUI(cityName: typedName);
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          setState((){
                            isDataLoaded = false;
                            getPermission();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: SizedBox(
                          height: 67,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'My Location',
                                style: kTextFieldTextStyle,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const Icon(Icons.my_location),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              isErrorOccured
                  ? ErrorMessage(title: title!, message: message!)
                  : Expanded(
                      child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_city,
                            ),
                            Text(
                              weatherModel!.location!,
                              style: kLocationTextStyle,
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          weatherModel!.icon!,
                          color: kLightColor,
                          height: 180,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          "${weatherModel != null ? weatherModel!.temperature! : 0}\u00B0",
                          style: kTempTextStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            weatherModel!.description!,
                            style: kLocationTextStyle,
                          ),
                        ),
                      ],
                    )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: kOverLayColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SizedBox(
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: DetailsWidgets(
                              value:
                                  '${weatherModel != null ? weatherModel!.feelsLike!.round() : 0}°',
                              title: 'FEELS LIKE'),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: VerticalDivider(
                            thickness: 1,
                          ),
                        ),
                        Expanded(
                          child: DetailsWidgets(
                              value:
                              '${weatherModel != null ? weatherModel!.humidity! : 0}%',
                              title: 'HUMIDITY'),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: VerticalDivider(
                            thickness: 1,
                          ),
                        ),
                        Expanded(
                          child: DetailsWidgets(
                              value:
                                  '${weatherModel != null ? weatherModel!.wind!.round() : 0}',
                              title: 'WIND'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
