import 'location.dart';
import '../utilities/constants.dart';
import 'networking.dart';

class Weather{

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?units=metric&lat=${location.longitude}&lon=${location.longitude}&appid=$apiKey");

    // NetworkHelper networkHelper = NetworkHelper(
    //     "$openWeatherMapURL?units=metric&lat=${34.3548}&lon=${62.1744}&appid=$apiKey");
    networkHelper.getData();
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric'
    );

    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}