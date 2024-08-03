import 'package:appointment_application/components/button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppointmentBooked extends StatelessWidget {
  const AppointmentBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Lottie.asset("assets/succesfule.json"),
            ),
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "Reservation DONE",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: MyButton(
                width: double.infinity,
                title: "Home Page",
                disable: false,
                onPressed: (){
                  Navigator.of(context).pushNamed("main");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
