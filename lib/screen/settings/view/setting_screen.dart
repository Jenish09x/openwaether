import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/shared_helper.dart';
import '../../../utils/theme_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings",style: TextStyle(color: Colors.white),),
          automaticallyImplyLeading: false,
          leading: IconButton(onPressed: () {
              Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
        ),

        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Weather alerts"),
              Container(
                padding: const EdgeInsets.all(17),
                height: MediaQuery.sizeOf(context).height * 0.15,
                width: MediaQuery.sizeOf(context).width * 0.90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade900,
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Rain alerts",style: TextStyle(color: Colors.white),),
                            Text(
                              "6:00AM - 10:00PM",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.blue),
                            ),
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,color: Colors.white,)
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Theme",style: TextStyle(color: Colors.white),),
                            Text(
                              context.watch<ThemeProvider>().isLight?"dark":"light",
                              style:
                                  const TextStyle(fontSize: 10, color: Colors.blue),
                            ),
                          ],
                        ),
                        Consumer<ThemeProvider>(
                          builder: (context, value, child) => Switch(
                            value: value.isLight,
                            onChanged: (value1) {
                              ShareHelper shr = ShareHelper();
                              shr.setTheme(value1);
                              value.changeTheme();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Units"),
              Container(
                padding: const EdgeInsets.all(17),
                height: MediaQuery.sizeOf(context).height * 0.24,
                width: MediaQuery.sizeOf(context).width * 0.90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade900,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Temperature",style: TextStyle(color: Colors.white),),
                    Text(
                      "Celsius(`C)",
                      style: TextStyle(fontSize: 10, color: Colors.blue),
                    ),
                    Divider(),
                    Text("Wind",style: TextStyle(color: Colors.white),),
                    Text(
                      "Kilometers per hour(km/h)",
                      style: TextStyle(fontSize: 10, color: Colors.blue),
                    ),
                    Divider(),
                    Text("Air pressure",style: TextStyle(color: Colors.white),),
                    Text(
                      "Hectopascals(hPa)",
                      style: TextStyle(fontSize: 10, color: Colors.blue),
                    ),
                    Divider(),
                    Text("Visibility",style: TextStyle(color: Colors.white),),
                    Text(
                      "Miles(mi)",
                      style: TextStyle(fontSize: 10, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.sizeOf(context).height * 0.05,
                width: MediaQuery.sizeOf(context).width * 0.90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade900,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("About Weather",style: TextStyle(color: Colors.white),),
                    Icon(Icons.arrow_forward_ios,color: Colors.white,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
