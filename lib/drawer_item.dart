import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key, required this.name, required this.onPressed})
      : super(key: key);

  final String name;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
          height: 40,
          child: Text(
            name,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          )),
    );
  }
}
