import 'package:flutter/material.dart';
import 'package:ru_hacks/constants.dart';

class CustomMenuButton extends StatefulWidget {
  final String buttonLabel;
  final Function whenPressed;

  CustomMenuButton({this.buttonLabel, this.whenPressed});

  @override
  _CustomMenuButtonState createState() => _CustomMenuButtonState();
}

class _CustomMenuButtonState extends State<CustomMenuButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.whenPressed,
      child: Container(
        width: MediaQuery.of(context).size.width / kMenuButtonWidth,
        height: MediaQuery.of(context).size.height / kMenuButtonHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.blue[900],
          //     offset: Offset(1, 2),
          //     blurRadius: 4,
          //   )
          // ],
          color: kBlueyWhite,
        ),
        child: Center(
          child: Text(
            "${widget.buttonLabel}",
            style: TextStyle(
                fontSize: 45,
                color: kDarkBlue,
                letterSpacing: 2,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
