import 'package:appointment_application/components/button.dart';
import 'package:appointment_application/utils/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLoginForm extends StatefulWidget {
  const MyLoginForm({super.key});

  @override
  State<MyLoginForm> createState() => _MyLoginFormState();
}

class _MyLoginFormState extends State<MyLoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  bool obsecuredPass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: "Email Adress",
              labelText: "Email",
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.primaryColor,
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _pwdController,
            obscureText: obsecuredPass,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            decoration: InputDecoration(
                hintText: "Password",
                labelText: "Password",
                alignLabelWithHint: true,
                prefixIcon: const Icon(Icons.lock_outline),
                prefixIconColor: Config.primaryColor,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obsecuredPass = !obsecuredPass;
                    });
                  },
                  icon: obsecuredPass
                      ? const Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.black38,
                        )
                      : const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Config.primaryColor,
                        ),
                )),
          ),
          Config.spaceSmall,
          MyButton(
            width: double.infinity,
            title: "Login",
            disable: false,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
