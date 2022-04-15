import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.buttonName,
    required this.lightcolor,
    required this.darkColor,
    required this.height,
    required this.onPressed,
  }) : super(key: key);
  final String buttonName;
  final Color lightcolor;
  final Color darkColor;
  final double height;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
              ),
            ),
            padding: MaterialStateProperty.all(const EdgeInsets.all(0.0))),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [lightcolor, darkColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              buttonName,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
