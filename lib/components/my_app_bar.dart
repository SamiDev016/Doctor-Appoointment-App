import 'package:appointment_application/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, this.appTitle, this.route, this.icon, this.actions});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
  
  @override
  Size get preferredSize => const Size.fromHeight(60);

  final String? appTitle;
  final String? route;
  final FaIcon? icon;
  final List<Widget>? actions;


}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        widget.appTitle!,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      leading: widget.icon != null ? Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Config.primaryColor
        ),
        child: IconButton(
          onPressed: (){
            if(widget.route != null){
              Navigator.of(context).pushNamed(widget.route!);
            }else{
              Navigator.of(context).pop();
            }
          },
          icon: widget.icon!,
          iconSize: 16,
          color: Colors.white,

        ),
      ) : null,
      actions: widget.actions ?? null,
      
    );
  }
}