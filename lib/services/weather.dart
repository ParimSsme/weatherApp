import 'location.dart';
import '../utilities/constants.dart';
import 'networking.dart';

class Weather{

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?units=metric&lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey");

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