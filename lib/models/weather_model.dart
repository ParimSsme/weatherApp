class WeatherModel {
  String? location, description, icon;
  dynamic temperature, feelsLike, humidity, wind;

  WeatherModel({
      this.location,
      this.description,
      this.icon,
      this.temperature,
      this.feelsLike,
      this.humidity,
      this.wind
  });
}
