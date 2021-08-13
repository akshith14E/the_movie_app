import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/models/user_model.dart';
import 'package:flutter_task/routes/router.gr.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox('Users');
  await Hive.openBox('Auth');
  await Hive.openBox('currentUser');
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppRouter _appRouter;
  @override
  void initState() {
    _appRouter = AppRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff073b4c),
          primaryColor: Color(0xff06d6a0),
          accentColor: Color(0xff06d6a0),
          textTheme: TextTheme().copyWith(
            bodyText1: TextStyle(color: Color(0xff06d6a0)),
            bodyText2: TextStyle(color: Colors.white),
          )),
    );
  }
}
