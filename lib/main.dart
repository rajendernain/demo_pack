import 'package:api_projects/bloc/employee/bloc/employee_list_bloc.dart';
import 'package:api_projects/bloc/login_bloc.dart' as login_bloc;
import 'package:api_projects/bloc/logout_bloc.dart';
import 'package:api_projects/bloc/products_bloc.dart';
import 'package:api_projects/repo/employee_repo.dart';
import 'package:api_projects/repo/login_repo.dart';
import 'package:api_projects/repo/products_repo.dart';
import 'package:api_projects/screens/home_screen.dart';
import 'package:api_projects/screens/login_screen.dart';
import 'package:api_projects/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/shared_pref.dart';
import 'constants/routes.dart';


void main() {
  runApp(RepositoryProvider(
    create: (context) =>  ProductsRepo(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  late Future<bool>loggedIn;

  @override
  void initState() {
    super.initState();
    loggedIn = isAuthenticated();
  }

  Future<bool> isAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(SharedPref.authTokenKey);
    if(token!='' && token !=null){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: loggedIn,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show loader while checking state
        } else {
          final bool isAuthenticated = snapshot.data ?? false;
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ProductsBloc(ProductsRepo())),
              BlocProvider(create: (context) => LogoutBloc()),
              BlocProvider(create: (context) => EmployeeListBloc(EmployeeListRepo())),
              BlocProvider(create: (context) => login_bloc.LoginBloc(login_bloc.PageLoading())),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primaryColor: Colors.blue),
              initialRoute: isAuthenticated ? Routes.homeRoute : Routes.loginRoute,
              navigatorKey: MyApp.navigatorKey,
              routes: <String, WidgetBuilder>{
                Routes.loginRoute: (context) => LoginScreen(),
                Routes.homeRoute: (context) => HomeScreen(),
                Routes.productRoute: (context) => ProductScreen(),
              },
            ),
          );
        }
      }
    );
  }
}
