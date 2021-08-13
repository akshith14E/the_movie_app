import 'package:flutter/material.dart';
import 'package:flutter_task/routes/router.gr.dart';
import 'package:flutter_task/widgets/custom_text_field.dart';
import 'package:flutter_task/widgets/submit_button.dart';
import 'package:auto_route/auto_route.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final GlobalKey<FormState> key = GlobalKey();
  final String string = 'enterapp';
  final FocusNode _focusNode = FocusNode();
  String veriString = '';
  String? valildate(value) {
    if (value != string) {
      return 'you are a robot, anyways lets try again';
    }
  }

  handleChange(value) {
    setState(() {
      veriString = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("verify your not a robot"),
          Text('Type enterapp'),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Form(
                key: key,
                child: Column(
                  children: [
                    custumTextField(context, Icons.verified, 'verify', false,
                        valildate, handleChange, 1, _focusNode),
                    submitButton(context, () {
                      if (key.currentState!.validate()) {
                        context.router.replace(HomePageRoute());
                      }
                    }, 'verify')
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
