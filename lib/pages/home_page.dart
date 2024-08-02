import 'package:appointment_application/components/appointment_card.dart';
import 'package:appointment_application/components/doctor_card.dart';
import 'package:appointment_application/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Config.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.black,
                      strokeAlign: 2,
                    )
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Adel Ibrahim Sami",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      SizedBox(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage('assets/profile_image.jpg'),
                        ),
                      )
                    ],
                  ),
                ),
                Config.spaceMedium,
                const Text(
                  'Category :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Divider(),
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
                  "Appointment :",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Divider(),
                Config.spaceSmall,
                const AppointmentCard(),
                Config.spaceSmall,
                const Text(
                  'Top Doctors :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Divider(),
                Config.spaceSmall,
                Column(
                  children: List.generate(8, (index) {
                    return const DoctorCard();
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
