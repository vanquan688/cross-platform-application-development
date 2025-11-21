import 'package:flutter/material.dart';
import 'package:lap1_i_am_rich/services/weather_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherModel weatherModel = WeatherModel();
  int? temperature;
  String? weatherIcon;
  String? cityName;
  String? weatherMessage;
  String? weatherDescription;
  int? humidity;
  double? windSpeed;
  int? feelsLike;
  int? minTemp;
  int? maxTemp;
  bool isLoading = true;
  String searchCity = '';

  @override
  void initState() {
    super.initState();
    getLocationWeather();
  }

  void getLocationWeather() async {
    setState(() {
      isLoading = true;
    });

    var weatherData = await weatherModel.getLocationWeather();
    
    if (weatherData != null) {
      updateUI(weatherData);
    } else {
      setState(() {
        isLoading = false;
        cityName = 'Không thể lấy dữ liệu';
      });
    }
  }

  void getCityWeather(String cityName) async {
    setState(() {
      isLoading = true;
    });

    var weatherData = await weatherModel.getCityWeather(cityName);
    
    if (weatherData != null) {
      updateUI(weatherData);
    } else {
      setState(() {
        isLoading = false;
        this.cityName = 'Không tìm thấy thành phố';
      });
    }
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Không thể lấy dữ liệu thời tiết';
        cityName = '';
        isLoading = false;
        return;
      }

      // Open-Meteo API structure
      var current = weatherData['current'];
      
      double temp = current['temperature_2m'];
      temperature = temp.toInt();
      
      var weatherCode = current['weather_code'];
      weatherIcon = weatherModel.getWeatherIcon(weatherCode);
      weatherMessage = weatherModel.getMessage(temperature!);
      
      // Tên thành phố
      cityName = weatherData['name'] ?? 'Unknown';
      if (weatherData['country'] != null) {
        cityName = '$cityName, ${weatherData['country']}';
      }
      
      // Mô tả thời tiết dựa trên weather code
      weatherDescription = getWeatherDescription(weatherCode);
      
      humidity = current['relative_humidity_2m'];
      
      double wind = current['wind_speed_10m'];
      windSpeed = wind;
      
      double feels = current['apparent_temperature'];
      feelsLike = feels.toInt();
      
      // Open-Meteo không cung cấp min/max trong current, sử dụng giá trị hiện tại
      minTemp = temperature;
      maxTemp = temperature;
      
      isLoading = false;
    });
  }

  String getWeatherDescription(int code) {
    if (code == 0) return 'Clear sky';
    if (code <= 3) return 'Partly cloudy';
    if (code <= 49) return 'Foggy';
    if (code <= 59) return 'Drizzle';
    if (code <= 69) return 'Rain';
    if (code <= 79) return 'Snow';
    if (code <= 84) return 'Rain showers';
    if (code <= 99) return 'Thunderstorm';
    return 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: isLoading
          ? const Center(
              child: SpinKitDoubleBounce(
                color: Colors.blue,
                size: 100.0,
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Search Bar
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  searchCity = value;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Enter city name (e.g., Hanoi)',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                  prefixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.search, color: Colors.white),
                                onPressed: () {
                                  if (searchCity.isNotEmpty) {
                                    getCityWeather(searchCity);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Location Icon and City Name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.blue,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            cityName ?? 'Unknown',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      
                      // Date/Time placeholder
                      Center(
                        child: Text(
                          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Weather Icon
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            weatherIcon ?? '☁️',
                            style: const TextStyle(fontSize: 80),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Weather Description
                      Center(
                        child: Text(
                          weatherDescription ?? 'overcast clouds',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Temperature
                      Center(
                        child: Text(
                          '${temperature ?? 0}°C',
                          style: const TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Feels like ${feelsLike ?? 0}°C',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Weather Details Grid
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildWeatherDetail(
                            Icons.water_drop,
                            'Humidity',
                            '${humidity ?? 0}%',
                          ),
                          _buildWeatherDetail(
                            Icons.air,
                            'Wind Speed',
                            '${windSpeed?.toStringAsFixed(1) ?? 0} m/s',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildWeatherDetail(
                            Icons.thermostat,
                            'Min Temp',
                            '${minTemp ?? 0}°C',
                          ),
                          _buildWeatherDetail(
                            Icons.thermostat,
                            'Max Temp',
                            '${maxTemp ?? 0}°C',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildWeatherDetail(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.blue, size: 30),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
