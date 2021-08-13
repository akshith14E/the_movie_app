import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/models/user_model.dart';
import 'package:flutter_task/providers/box_providers.dart';
import 'package:flutter_task/repositories/auth_repository.dart';
import 'package:flutter_task/routes/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final User user = context.read(authRepositoryProvider).getCurrentUser();
    print(user);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'User Profile',
            style: GoogleFonts.dancingScript(
                fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image(
                        image: AssetImage('assets/images/movie.jfif'),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              style: GoogleFonts.actor(fontSize: 14),
                              children: [
                                TextSpan(text: 'Name: \n'),
                                TextSpan(text: user.name),
                                TextSpan(text: '\n\nEmail: \n'),
                                TextSpan(text: user.email),
                              ]))
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).accentColor)),
                    onPressed: () {
                      context.read(authRepositoryProvider).signOut();
                      context.router.replace(SignInPageRoute());
                    },
                    child: Text(
                      'Logout',
                      style:
                          GoogleFonts.actor(fontSize: 22, color: Colors.black),
                    )),
              )
            ],
          ),
        ));
  }
}
