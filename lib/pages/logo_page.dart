import 'package:flutter/material.dart';
import 'package:flutter_task/routes/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:auto_route/auto_route.dart';

class LogoPage extends StatefulWidget {
  LogoPage({
    Key? key,
  }) : super(key: key);

  @override
  _LogoPageState createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    print('init');
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 2), () {
        final b = Hive.box('Auth').get('AuthState');
        print(b);
        if (b == null ? false : b) {
          context.router.replace(VerifyRoute());
        } else {
          context.router.replace(SignInPageRoute());
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
            child: Text(
          'The Movie App',
          style: GoogleFonts.dancingScript(
              textStyle: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).scaffoldBackgroundColor)),
        )),
      )),
    );
  }
}
