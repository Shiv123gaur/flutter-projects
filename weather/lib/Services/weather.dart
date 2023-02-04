import 'package:weather/Services/location.dart';
import 'package:weather/Services/networking.dart';
class WeatherModel{
   Future<dynamic> citylocation(String cityName)async{
     NetworkingData networkingdata = NetworkingData("https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=084f115c36ec899bd81b98125d9e975c&units=metric");
     var data = await networkingdata.networking();
     print(data);
     return data;
   }
    Future<dynamic> getLocationWeather() async{
      Locationn loc  = Locationn();
      await loc.getCurrentLocation();
      NetworkingData networkingdata = NetworkingData('https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=084f115c36ec899bd81b98125d9e975c&units=metric');
      var weatherData =  await networkingdata.networking();
      return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';

    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}