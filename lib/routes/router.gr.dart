// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../models/movie_model.dart' as _i11;
import '../pages/home_page.dart' as _i5;
import '../pages/login_page.dart' as _i6;
import '../pages/logo_page.dart' as _i3;
import '../pages/movie_feed.dart' as _i7;
import '../pages/movie_info.dart' as _i9;
import '../pages/sign_in_page.dart' as _i4;
import '../pages/user_profile.dart' as _i8;
import '../pages/verify.dart' as _i10;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LogoPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<LogoPageRouteArgs>(
              orElse: () => const LogoPageRouteArgs());
          return _i3.LogoPage(key: args.key);
        }),
    SignInPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SignInPageRouteArgs>(
              orElse: () => const SignInPageRouteArgs());
          return _i4.SignInPage(key: args.key);
        }),
    HomePageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<HomePageRouteArgs>(
              orElse: () => const HomePageRouteArgs());
          return _i5.HomePage(key: args.key);
        }),
    LoginPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<LoginPageRouteArgs>(
              orElse: () => const LoginPageRouteArgs());
          return _i6.LoginPage(key: args.key);
        }),
    MovieFeedRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<MovieFeedRouteArgs>(
              orElse: () => const MovieFeedRouteArgs());
          return _i7.MovieFeed(key: args.key);
        }),
    UserProfileRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<UserProfileRouteArgs>(
              orElse: () => const UserProfileRouteArgs());
          return _i8.UserProfile(key: args.key);
        }),
    MovieInfoRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<MovieInfoRouteArgs>();
          return _i9.MovieInfo(
              key: args.key, movie: args.movie, index: args.index);
        }),
    VerifyRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.Verify();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LogoPageRoute.name, path: '/'),
        _i1.RouteConfig(SignInPageRoute.name, path: '/sign-in-page'),
        _i1.RouteConfig(HomePageRoute.name, path: '/home-page'),
        _i1.RouteConfig(LoginPageRoute.name, path: '/login-page'),
        _i1.RouteConfig(MovieFeedRoute.name, path: '/movie-feed'),
        _i1.RouteConfig(UserProfileRoute.name, path: '/user-profile'),
        _i1.RouteConfig(MovieInfoRoute.name, path: '/movie-info'),
        _i1.RouteConfig(VerifyRoute.name, path: '/Verify')
      ];
}

class LogoPageRoute extends _i1.PageRouteInfo<LogoPageRouteArgs> {
  LogoPageRoute({_i2.Key? key})
      : super(name, path: '/', args: LogoPageRouteArgs(key: key));

  static const String name = 'LogoPageRoute';
}

class LogoPageRouteArgs {
  const LogoPageRouteArgs({this.key});

  final _i2.Key? key;
}

class SignInPageRoute extends _i1.PageRouteInfo<SignInPageRouteArgs> {
  SignInPageRoute({_i2.Key? key})
      : super(name, path: '/sign-in-page', args: SignInPageRouteArgs(key: key));

  static const String name = 'SignInPageRoute';
}

class SignInPageRouteArgs {
  const SignInPageRouteArgs({this.key});

  final _i2.Key? key;
}

class HomePageRoute extends _i1.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({_i2.Key? key})
      : super(name, path: '/home-page', args: HomePageRouteArgs(key: key));

  static const String name = 'HomePageRoute';
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key});

  final _i2.Key? key;
}

class LoginPageRoute extends _i1.PageRouteInfo<LoginPageRouteArgs> {
  LoginPageRoute({_i2.Key? key})
      : super(name, path: '/login-page', args: LoginPageRouteArgs(key: key));

  static const String name = 'LoginPageRoute';
}

class LoginPageRouteArgs {
  const LoginPageRouteArgs({this.key});

  final _i2.Key? key;
}

class MovieFeedRoute extends _i1.PageRouteInfo<MovieFeedRouteArgs> {
  MovieFeedRoute({_i2.Key? key})
      : super(name, path: '/movie-feed', args: MovieFeedRouteArgs(key: key));

  static const String name = 'MovieFeedRoute';
}

class MovieFeedRouteArgs {
  const MovieFeedRouteArgs({this.key});

  final _i2.Key? key;
}

class UserProfileRoute extends _i1.PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({_i2.Key? key})
      : super(name,
            path: '/user-profile', args: UserProfileRouteArgs(key: key));

  static const String name = 'UserProfileRoute';
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({this.key});

  final _i2.Key? key;
}

class MovieInfoRoute extends _i1.PageRouteInfo<MovieInfoRouteArgs> {
  MovieInfoRoute({_i2.Key? key, required _i11.Movie movie, required int index})
      : super(name,
            path: '/movie-info',
            args: MovieInfoRouteArgs(key: key, movie: movie, index: index));

  static const String name = 'MovieInfoRoute';
}

class MovieInfoRouteArgs {
  const MovieInfoRouteArgs(
      {this.key, required this.movie, required this.index});

  final _i2.Key? key;

  final _i11.Movie movie;

  final int index;
}

class VerifyRoute extends _i1.PageRouteInfo {
  const VerifyRoute() : super(name, path: '/Verify');

  static const String name = 'VerifyRoute';
}
