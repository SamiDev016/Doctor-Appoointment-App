
import 'package:appointment_application/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus { Upcoming, Complete, Cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.Upcoming;
  Alignment _alignment = Alignment.centerLeft;

  List<dynamic> schedules = [
    {
      "doctor_name": "Aouf Rayan",
      "doctor_profile": "assets/doctor3.jpg",
      "category": "Dental",
      "status": FilterStatus.Upcoming
    },
    {
      "doctor_name": "Khaldi Mouhamed",
      "doctor_profile": "assets/doctor4.jpg",
      "category": "Cardiology",
      "status": FilterStatus.Cancel
    },
    {
      "doctor_name": "Baamara Redouane",
      "doctor_profile": "assets/doctor1.jpg",
      "category": "General",
      "status": FilterStatus.Complete
    },
    {
      "doctor_name": "Toumi Zakaria",
      "doctor_profile": "assets/doctor2.jpg",
      "category": "Respiration",
      "status": FilterStatus.Cancel
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<dynamic> filttredSchedules = schedules.where((var schedule) {
      /*switch (schedule["status"]) {
        case "upcomping":
          schedule['status'] = FilterStatus.upComing;
          break;
        case "complete":
          schedule['status'] = FilterStatus.complete;
          break;
        case "cancel":
          schedule['status'] = FilterStatus.cancel;
          break;
      }*/
      return schedule["status"] == status;
    }).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Appointment Schedule",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.Upcoming) {
                                  status = FilterStatus.Upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.Complete) {
                                  status = FilterStatus.Complete;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.Cancel) {
                                  status = FilterStatus.Cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(filterStatus.name),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filttredSchedules.length,
                itemBuilder: ((context,index){
                  var _schedule = filttredSchedules[index];
                  bool isLastElement = filttredSchedules.length + 1 == index;
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: !isLastElement ? const EdgeInsets.only(bottom: 20) : EdgeInsets.zero ,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(

                                backgroundImage: AssetImage(
                                  _schedule["doctor_profile"]
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    " ${_schedule["doctor_name"]}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(
                                    " ${_schedule["category"]}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 15,),

                          const ScheduleCard(),

                          const SizedBox(height: 15,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  child: const Text("Cancel"),
                                  onPressed: (){},
                                ),
                              ),
                              const SizedBox(width: 20,),

                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Config.primaryColor.shade100
                                  ),
                                  child: Text("Reschedule"),
                                  onPressed: (){},
                                ),
                              ),


                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.calendar_today,
            color: Colors.black,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Monday, 02/08/2024',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.black,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            "2:00 AM",
            style: TextStyle(color: Colors.black),
          ))
        ],
      ),
    );
  }
}
