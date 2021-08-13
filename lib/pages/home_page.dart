import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/movie_list_controller.dart';
import 'package:flutter_task/pages/movie_feed.dart';
import 'package:flutter_task/pages/user_profile.dart';
import 'package:flutter_task/providers/box_providers.dart';
import 'package:flutter_task/repositories/auth_repository.dart';
import 'package:flutter_task/routes/router.gr.dart';
import 'package:flutter_task/widgets/movie_list_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 1);
  late String username;
  int _index = 1;
  @override
  void initState() {
    username = context.read(boxProvider('currentUser')).get('user') ?? '';
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read(movieListProviderProvider.notifier).getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            _index = page;
          });
        },
        children: [
          UserProfile(),
          _Home(
            username: username,
          ),
          MovieFeed()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _index,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 100), curve: Curves.easeIn);
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'movies'),
        ],
      ),
    );
  }
}

class _Home extends StatelessWidget {
  final String username;
  const _Home({Key? key, required this.username}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Home',
            style: GoogleFonts.dancingScript(
                textStyle:
                    TextStyle(fontSize: 32, fontWeight: FontWeight.bold))),
        centerTitle: true,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Consumer(builder: (context, watch, child) {
              return watch(movieListProviderProvider).when(
                  data: (data) {
                    return MovieTile(movies: data);
                  },
                  loading: () => CircularProgressIndicator(),
                  error: (error, _) => Container());
            }),
          )),
    );
  }
}
