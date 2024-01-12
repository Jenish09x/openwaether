import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openwaether/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/check_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  NetworkConnection networkConnection = NetworkConnection();

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getData();
    networkConnection.checkConnection(context);
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Weather App",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "manage");
              },
              icon: const Icon(
                Icons.list_alt,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "setting");
              },
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: providerW!.isOnline
            ? providerR!.homeModel == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/image/bg1.jpg",
                          height: MediaQuery.sizeOf(context).height,
                          width: MediaQuery.sizeOf(context).width,
                          fit: BoxFit.fill,
                        ),
                        Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white24.withOpacity(0.4),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: SearchBar(
                                  trailing: const [
                                    Icon(Icons.search_rounded)
                                  ],
                                  onSubmitted: (value) {
                                    providerR!.searchData(value);
                                    providerR!.getData();
                                  },
                                ),
                              ),
                              Text(
                                "${providerW!.homeModel!.name}",
                                style: const TextStyle(
                                    fontSize: 45, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "Today",
                                style: TextStyle(fontSize: 25),
                              ),
                              Text(
                                "${providerW!.homeModel!.clouds!.all}°C",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.sizeOf(context).height * 0.10,
                                    color: Colors.blue.shade300),
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.40,
                                child: const Divider(height: 10, thickness: 2),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Sunny",
                                style: TextStyle(fontSize: 25),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${providerW!.homeModel!.coord!.lat}/",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.blueAccent.shade200),
                                  ),
                                  Text(
                                    "${providerW!.homeModel!.coord!.lon}",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.blue.shade300),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AnimatedContainer(
                                duration: const Duration(seconds: 5),
                                curve: Curves.fastOutSlowIn,
                                padding: const EdgeInsets.all(10),
                                height: MediaQuery.sizeOf(context).height * 0.30,
                                width: MediaQuery.sizeOf(context).width * 0.85,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Forecast for today",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height:
                                              MediaQuery.sizeOf(context).height *
                                                  0.23,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("Now"),
                                              const Icon(Icons.settings_outlined),
                                              Text("${providerW!.homeModel!.main!.temp}"),
                                              const Icon(Icons.air_outlined),
                                              Text("${providerW!.homeModel!.wind!.speed} km/h"),
                                              Icon(
                                                CupertinoIcons.umbrella_fill,
                                                color: Colors.blue.shade300,
                                              ),
                                              Text(
                                                "${providerW!.homeModel!.main!.humidity} %",
                                                style: TextStyle(
                                                    color: Colors.blue.shade300),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              MediaQuery.sizeOf(context).height *
                                                  0.23,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("pressure"),
                                              const Icon(Icons.speed),
                                              Text("${providerW!.homeModel!.main!.pressure}"),
                                              const Icon(Icons.thermostat_auto),
                                              Text("${providerW!.homeModel!.main!.temp_min}"),
                                              Icon(
                                                CupertinoIcons.airplane,
                                                color: Colors.blue.shade300,
                                              ),
                                              Text(
                                                "${providerW!.homeModel!.wind!.deg}",
                                                style: TextStyle(
                                                    color: Colors.blue.shade300),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              MediaQuery.sizeOf(context).height *
                                                  0.23,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("Country"),
                                              const Icon(Icons.location_city),
                                               Text("${providerW!.homeModel!.sys!.country}"),
                                              const Icon(Icons.sunny),
                                               Text("${providerW!.homeModel!.sys!.sunrise}"),
                                              Icon(
                                                CupertinoIcons.sunset,
                                                color: Colors.blue.shade300,
                                              ),
                                              Text(
                                                "${providerW!.homeModel!.sys!.sunset}",
                                                style: TextStyle(
                                                    color: Colors.blue.shade300),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              MediaQuery.sizeOf(context).height *
                                                  0.23,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("weather"),
                                              const Icon(Icons.cloud),
                                              Text("${providerW!.homeModel!.weather![0].main}"),
                                              const Icon(Icons.add_chart),
                                              Text("${providerW!.homeModel!.weather![0].description}"),
                                              Icon(
                                                CupertinoIcons.time,
                                                color: Colors.blue.shade300,
                                              ),
                                              Text(
                                                "${providerW!.homeModel!.timezone}",
                                                style: TextStyle(
                                                    color: Colors.blue.shade300),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
            : Center(
                child: Image.asset(
                  "assets/image/No connection.gif",
                  height: 300,
                ),
              ),
      ),
    );
  }
}
