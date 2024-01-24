class WeatherData {
  String name = '';
  String description = '';
  double temperature = 0;
  double perceived = 0;
  int pressure = 0;
  int humidity = 0;
  String country = '';

  // Constructor
  WeatherData(this.name, this.description, this.temperature, this.perceived,
      this.pressure, this.humidity, this.country);

  WeatherData.fromJson(Map<String, dynamic> weatherMap) {
    name = weatherMap['name'];
    // Farenheit
    // this.temperature = (weatherMap['main']['temp'] * (9 / 5) - 459.67 ?? 0);

    // Celsius
    temperature = (weatherMap['main']['temp'] - 273.15 ?? 0);
    perceived = (weatherMap['main']['feels_like'] - 273.15 ?? 0);
    pressure = weatherMap['main']['pressure'] ?? 0;
    humidity = weatherMap['main']['humidity'] ?? 0;
    country = weatherMap['sys']['country'] ?? '';

    description = weatherMap['weather'][0]['main'] ?? '';
  }
}
