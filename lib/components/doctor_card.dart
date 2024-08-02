import 'package:appointment_application/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.routeName});
  
  final String routeName;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 180,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: Config.widthSize * 0.33,
                child: Image.asset(
                  "assets/doctor2.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              const Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr Kahloucha",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Dental",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          Spacer(flex: 1,),
                          Text("4.2"),
                          
                          Spacer(flex: 1,),
                          Text("Review"),
                          Spacer(flex: 1,),
                          Text("(20)"),
                          Spacer(flex: 7,)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: (){
          Navigator.of(context).pushNamed(routeName);
        },
      ),
    );
  }
}
