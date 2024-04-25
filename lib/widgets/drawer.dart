import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/login_bloc.dart';
import '../bloc/logout_bloc.dart';
import '../common/common.dart';
import '../common/shared_pref.dart';
import '../constants/routes.dart';

class MyDrawer extends StatefulWidget {
  // final String title;
  //
  // const MyAppBar({Key? key, required this.title}) : super(key: key);
  MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String? name;
  String? email;

  @override
  void initState() {
    super.initState();
    loadDataFromSharedPreferences();
  }

  Future<void> loadDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString(SharedPref.nameKey);
      email = prefs.getString(SharedPref.emailKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ Color(0xFF846AFF).withOpacity(0.2), Color(0xFF755EE8).withOpacity(0.9), Colors.purpleAccent.withOpacity(0.6),Colors.amber,],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(name ?? ''),
              accountEmail: Text(email ?? ''),
              otherAccountsPictures: const [
                Align(
                    alignment: Alignment.topRight,
                    // child: Icon(Icons.close,size: 30, weight: 20)
                    child: CloseButton(
                      style: ButtonStyle(),
                    )),
              ],
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    "https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png",
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            buildDrawerItems(
                text: 'Home',
                icon: Icons.home_outlined,
                tileColor: null,
                onTap: () {
                  Navigator.pushNamed(
                      context, Routes.homeRoute);
                }
            ),
            const Divider(
              color: Colors.grey,
            ),
            buildDrawerItems(
                text: 'Products',
                icon: Icons.production_quantity_limits_sharp,
                tileColor: null,
                onTap: () {
                  Navigator.pushNamed(
                      context, Routes.productRoute);
                }
            ),
            const Divider(
              color: Colors.grey,
            ),
            buildDrawerItems(
                text: 'Profile',
                icon: Icons.perm_contact_cal_outlined,
                tileColor: null,
                onTap: () {
                  Navigator.pushNamed(
                      context, Routes.profileRoute);
                }
            ),
            const Divider(
              color: Colors.grey,
            ),
            BlocListener<LogoutBloc, LogoutState>(
              listener: (context, state) {
               if(state is LogOutState){
                 toast('LogOut Successfully', Colors.green);
                 Navigator.pushReplacementNamed(context, Routes.loginRoute);
               }
              },
              child: buildDrawerItems(
                  text: 'Logout',
                  icon: Icons.exit_to_app,
                  onTap: () {
                    context.read<LogoutBloc>().add(const LogOutEvent());
                  }, tileColor: null
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItems({
    required String text,
    required IconData icon,
    required Color? tileColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      tileColor: tileColor,
      leading: Icon(icon, size: 30, color: Colors.orange,),
      title: Text(text, style: const TextStyle(
          color: Colors.orange,
          fontSize: 20,
          fontWeight: FontWeight.w600
      ),),
      onTap: onTap,
    );
  }
}
