import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:payment_methode/presentation/screens/aboutus/aboutus.dart';
import 'package:payment_methode/presentation/screens/account/account.dart';
import 'package:payment_methode/presentation/screens/pesonalLogIn/personal_login.dart';
import 'package:payment_methode/presentation/shared/remote/cache_helper.dart';
import 'package:payment_methode/presentation/widget/navigattion/navigation.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image(
                image: AssetImage('assets/images/home/pana.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: const [
                Icon(
                  Icons.monetization_on_outlined,
                  color: Color.fromRGBO(0, 75, 125, 1),
                ),
                Text(
                  ' PayWme',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 75, 125, 1),
                    fontSize: 25,
                    fontFamily: 'DancingScript',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          ListTile(
            leading: const Icon(Icons.person, size: 24),
            title: const Text(
              'Profile',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 75, 125, 1),
              ),
            ),
            onTap: () => {
              navigatTo(
                context,
                const Account(),
              ),
            },
          ),
          ListTile(
            leading: const Icon(MdiIcons.information, size: 24),
            title: const Text(
              'About Us',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 75, 125, 1),
              ),
            ),
            onTap: () => {navigatTo(context, const AboutUs())},
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              child: Row(
                children: const [
                  RotatedBox(
                    quarterTurns: 2,
                    child: Icon(Icons.exit_to_app_rounded, size: 25),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'LogOut',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                CacheHelper.removeData(key: 'uId');
                navigateAndFinsh(context, const LogIn());
              },
            ),
          ),
        ],
      ),
    );
  }
}
