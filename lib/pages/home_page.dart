import 'package:appointment_application/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> medCat = [
    {"icon": FontAwesomeIcons.userDoctor, "Category": "General"},
    {"icon": FontAwesomeIcons.heartPulse, "Category": "Cardiology"},
    {"icon": FontAwesomeIcons.lungs, "Category": "Respirations"},
    {"icon": FontAwesomeIcons.hand, "Category": "Dermatology"},
    {"icon": FontAwesomeIcons.personPregnant, "Category": "Gynecology"},
    {"icon": FontAwesomeIcons.teeth, "Category": "Dental"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Adel",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/profile_image.jpg'),
                    ),
                  )
                ],
              ),
              Config.spaceMedium,
              const Text(
                'Category',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Config.spaceSmall,
              SizedBox(
                height: Config.heightSize * 0.05,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(medCat.length, (index) {
                    return Card(
                      margin: const EdgeInsets.only(right: 20),
                      color: Config.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FaIcon(
                              medCat[index]["icon"],
                              color: Colors.white,
                            ),
                            Config.spaceSmall,
                            Text(
                              medCat[index]["Category"],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Config.spaceSmall,
              const Text(
                "Appointment",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Config.spaceSmall,

              
            ],
          ),
        ),
      ),
    );
  }
}
