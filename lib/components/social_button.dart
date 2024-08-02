import 'package:appointment_application/utils/config.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.social});

  final String social;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        side: const BorderSide(
          width: 1,color: Colors.black
        )
      ),
      onPressed: (){},
      child: SizedBox(
        width: Config.screenWidth!*0.302,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/$social.png',
              width: 20,
              height: 20,
            ),
            Text(
              social.toUpperCase(),
              style: const TextStyle(
                color: Colors.black
              ),
            )
          ],
        ),
      ),
    );
  }
}