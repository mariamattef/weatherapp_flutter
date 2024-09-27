import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wather_app/models/weather_model.dart';
import 'package:wather_app/pages/search_page.dart';
import 'package:wather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    weather = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Future(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              });
            },
            icon: const Icon(Icons.search),
            color: Colors.white,
          )
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: weather == null
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'searching now 🔎',
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                weather!.getThemeColor(),
                weather!.getThemeColor()[300]!,
                weather!.getThemeColor()[100]!,
              ], begin: Alignment.topCenter)),
              // color: weather!.getThemeColor(),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Text(
                      Provider.of<WeatherProvider>(context).cityName ?? 'cairo',
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Updated at : ${weather!.date.hour}:${weather!.date.minute} ${weather!.date.hour > 12 ? 'AM' : 'PM'}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weather!.getImage()),
                        Text(
                          '${weather!.temp.toInt()}',
                          style: const TextStyle(fontSize: 25),
                        ),
                        Column(
                          children: [
                            Text('max ${weather!.maxTemp.toInt()}',
                                style: const TextStyle(fontSize: 20)),
                            Text('min ${weather!.minTemp.toInt()}',
                                style: const TextStyle(fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      weather!.weatherStateName,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(
                      flex: 8,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
