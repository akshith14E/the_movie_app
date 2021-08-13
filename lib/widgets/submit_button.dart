import 'package:flutter/material.dart';

Container submitButton(
    BuildContext context, Function() onPressed, String name) {
  return Container(
    margin: EdgeInsets.all(16),
    height: 50,
    child: ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).accentColor)),
      onPressed: onPressed,
      child: Center(
          child: Text(
        name,
        style: TextStyle(color: Colors.black, fontSize: 22),
      )),
    ),
  );
}
