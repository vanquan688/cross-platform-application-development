import 'package:lap1_i_am_rich/services/location.dart';
import 'package:lap1_i_am_rich/services/networking.dart';

// Sử dụng Open-Meteo API - Hoàn toàn miễn phí, không cần API key
const openMeteoURL = 'https://api.open-meteo.com/v1/forecast';
const geocodingURL = 'https://geocoding-api.open-meteo.com/v1/search';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    // Bước 1: Lấy tọa độ từ tên thành phố
    NetworkHelper geoHelper = NetworkHelper(
      '$geocodingURL?name=$cityName&count=1&language=vi&format=json',
    );
    
    var geoData = await geoHelper.getData();
    if (geoData == null || geoData['results'] == null || geoData['results'].isEmpty) {
      return null;
    }
    
    double lat = geoData['results'][0]['latitude'];
    double lon = geoData['results'][0]['longitude'];
    String name = geoData['results'][0]['name'];
    String? country = geoData['results'][0]['country'];
    
    // Bước 2: Lấy dữ liệu thời tiết từ tọa độ
    NetworkHelper weatherHelper = NetworkHelper(
      '$openMeteoURL?latitude=$lat&longitude=$lon&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m&timezone=auto',
    );
    
    var weatherData = await weatherHelper.getData();
    if (weatherData != null) {
      weatherData['name'] = name;
      weatherData['country'] = country;
    }
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    if (location.latitude == null || location.longitude == null) {
      return null;
    }

    // Lấy dữ liệu thời tiết
    NetworkHelper weatherHelper = NetworkHelper(
      '$openMeteoURL?latitude=${location.latitude}&longitude=${location.longitude}&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m&timezone=auto',
    );
    
    var weatherData = await weatherHelper.getData();
    
    // Lấy tên thành phố từ reverse geocoding
    if (weatherData != null) {
      NetworkHelper geoHelper = NetworkHelper(
        '$geocodingURL?latitude=${location.latitude}&longitude=${location.longitude}&count=1&language=vi&format=json',
      );
      var geoData = await geoHelper.getData();
      if (geoData != null && geoData['results'] != null && geoData['results'].isNotEmpty) {
        weatherData['name'] = geoData['results'][0]['name'];
        weatherData['country'] = geoData['results'][0]['country'];
      } else {
        weatherData['name'] = 'Unknown Location';
      }
    }
    
    return weatherData;
  }

  String getWeatherIcon(int weatherCode) {
    // Open-Meteo Weather codes: https://open-meteo.com/en/docs
    if (weatherCode == 0) {
      return '☀️'; // Clear sky
    } else if (weatherCode <= 3) {
      return '☁️'; // Partly cloudy
    } else if (weatherCode <= 49) {
      return '🌫'; // Fog
    } else if (weatherCode <= 59) {
      return '🌧'; // Drizzle
    } else if (weatherCode <= 69) {
      return '☔️'; // Rain
    } else if (weatherCode <= 79) {
      return '☃️'; // Snow
    } else if (weatherCode <= 84) {
      return '🌧'; // Rain showers
    } else if (weatherCode <= 99) {
      return '🌩'; // Thunderstorm
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Thời tiết nóng, hãy uống nhiều nước!';
    } else if (temp > 20) {
      return 'Thời tiết dễ chịu';
    } else if (temp < 10) {
      return 'Thời tiết lạnh, hãy mặc ấm!';
    } else {
      return 'Thời tiết mát mẻ';
    }
  }
}
