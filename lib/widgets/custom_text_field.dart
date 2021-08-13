import 'package:flutter/material.dart';

Container custumTextField(
    BuildContext context,
    IconData icon,
    String label,
    bool obscureText,
    String? Function(String?)? function,
    Function change,
    int n,
    FocusNode focusNode,
    {TextInputType? keyboard}) {
  return Container(
    margin: EdgeInsets.all(16),
    child: TextFormField(
      onChanged: (value) {
        change(n, value);
      },
      focusNode: focusNode,
      validator: function,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 22),
      cursorColor: Theme.of(context).accentColor,
      obscureText: obscureText,
      keyboardType: keyboard ?? null,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          prefixIcon: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          labelText: label,
          labelStyle: Theme.of(context).textTheme.bodyText1!,
          focusColor: Theme.of(context).primaryColor),
    ),
  );
}
