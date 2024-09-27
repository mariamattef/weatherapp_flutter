import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wather_app/pages/home_page.dart';
import 'package:wather_app/pages/search_page.dart';
import 'package:wather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    print(Provider.of<WeatherProvider>(context).weatherData);
    return MaterialApp(
      theme: ThemeData(
        // primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
        //     ? Colors.blue
        //     : Provider.of<WeatherProvider>(context)
        //         .weatherData!
        //         .getThemeColor(),
        appBarTheme: AppBarTheme(
          backgroundColor:
              Provider.of<WeatherProvider>(context).weatherData == null
                  ? Colors.blue
                  : Provider.of<WeatherProvider>(context)
                      .weatherData!
                      .getThemeColor(),
        ),

        // primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        SearchPage.id: (context) => SearchPage(),
        HomePage.id: (context) => HomePage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
