import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/themeProvider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
              return Switch(
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  thumbColor: WidgetStatePropertyAll(Colors.orange),
                  inactiveTrackColor: Colors.transparent,
                  thumbIcon: WidgetStatePropertyAll(
                    themeProvider.isSelected
                        ? const Icon(Icons.nights_stay)
                        : const Icon(Icons.wb_sunny),
                  ),
                  value: themeProvider.isSelected,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  });
            }),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Paris Town',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return Icon(
                    themeProvider.isSelected
                        ? Icons.nights_stay
                        : Icons.wb_sunny,
                    color:
                        themeProvider.isSelected ? Colors.white : Colors.orange,
                    size: 250,
                  );
                },
              ),
              const SizedBox(height: 30),
              const Text(
                '20° c',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              const Text(
                'Good morning',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const Text(
                'NOIDA',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 50),
              const SizedBox(
                width: 50,
                child: Divider(
                  thickness: 3,
                ),
              ),
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.wb_twighlight),
                      Text('SUNRISE'),
                      Text('7:00'),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Column(
                    children: [
                      Icon(Icons.air),
                      Text('Wind'),
                      Text('4m/s'),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Column(
                    children: [
                      Icon(Icons.thermostat),
                      Text('Temperature'),
                      Text('23'),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
