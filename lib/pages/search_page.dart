import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wather_app/models/weather_model.dart';
import 'package:wather_app/providers/weather_provider.dart';
import 'package:wather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  static String id = 'SearchPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Search a City',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel weather =
                  await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context, listen: false).weathetData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              hintText: 'Enter a city name',
              suffixIcon: InkWell(
                  onTap: () async {
                    WeatherService service = WeatherService();
                    WeatherModel weather =
                        await service.getWeather(cityName: cityName!);

                    Provider.of<WeatherProvider>(context, listen: false)
                        .weathetData = weather;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;

                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
              border: OutlineInputBorder(),
              label: Text('Search'),
            ),
          ),
        ),
      ),
    );
  }
}
