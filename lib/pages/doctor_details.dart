import 'package:appointment_application/components/button.dart';
import 'package:appointment_application/components/my_app_bar.dart';
import 'package:appointment_application/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyButton(
                width: 310,
                title: "Book Appointment",
                disable: false,
                onPressed: (){
                  Navigator.of(context).pushNamed("booking_page");
                },
              ),
      appBar: MyAppBar(
        appTitle: "Doctor Details",
        icon: const FaIcon(Icons.arrow_back),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            },
            icon:
                FaIcon(isFav ? Icons.favorite_rounded : Icons.favorite_outline),
            color: Colors.red,
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            AboutDoctor(),
            DetailBody(),
            Spacer(),
            
          ],
        ),
      ),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 65,
            backgroundImage: AssetImage("assets/doctor2.jpg"),
            backgroundColor: Colors.white,
          ),
          Config.spaceMedium,
          const Text(
            "Dr Kahloucha",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              "Univerité de Boumerdes Mayjematique et Informatique Technologie de l'information ,Informatique",
              style: TextStyle(fontSize: 15, color: Colors.grey),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              "Faculty De Science INIM",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Config.spaceSmall,
          const DoctorInfo(),
          Config.spaceMedium,
          const Text(
            "About Doctor",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          Config.spaceSmall,
          const Text(
            "Doctor Experiecelkqjsdl lkqsjdl qksjd lqsdlk qjsd jqlskdj lqskjdqslkdj qslkdj lqksjd qlskdj lqskjd sqdlkj qsldk jqsdlk jqs",
            style: TextStyle(
                fontWeight: FontWeight.w500, height: 1.5, color: Colors.grey),
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InfoCard(
          label: "Patients",
          value: "98",
        ),
        const SizedBox(
          width: 15,
        ),
        InfoCard(
          label: "Experience",
          value: "8 Years",
        ),
        const SizedBox(
          width: 15,
        ),
        InfoCard(
          label: "Rating",
          value: "3.8",
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  InfoCard({super.key, required this.label, required this.value});

  String label;
  String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Config.primaryColor),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
