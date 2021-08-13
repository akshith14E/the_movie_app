import 'package:auto_route/auto_route.dart';
import 'package:flutter_task/pages/home_page.dart';
import 'package:flutter_task/pages/login_page.dart';
import 'package:flutter_task/pages/logo_page.dart';
import 'package:flutter_task/pages/movie_feed.dart';
import 'package:flutter_task/pages/movie_info.dart';
import 'package:flutter_task/pages/sign_in_page.dart';
import 'package:flutter_task/pages/user_profile.dart';
import 'package:flutter_task/pages/verify.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(page: LogoPage, initial: true),
  AutoRoute(page: SignInPage),
  AutoRoute(page: HomePage),
  AutoRoute(page: LoginPage),
  AutoRoute(page: MovieFeed),
  AutoRoute(page: UserProfile),
  AutoRoute(page: MovieInfo),
  AutoRoute(
    page: Verify,
  ),
])
class $AppRouter {}
