import 'package:flutter/material.dart';
import 'package:payment_methode/presentation/screens/companylogin/company_login.dart';
import 'package:payment_methode/presentation/screens/pesonalLogIn/personal_login.dart';
import 'package:payment_methode/presentation/shared/local/constance.dart';
import 'package:payment_methode/presentation/widget/navigattion/navigation.dart';

class TypesOfAccoun extends StatelessWidget {
  const TypesOfAccoun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose From types of account',
          style: TextStyle(
            color: Color.fromRGBO(245, 7, 7, 1),
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 25),
            InkWell(
              onTap: () {
                navigatTo(context, const LogIn());
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      Hero(
                        tag: 'personal',
                        child: Container(
                          width: 200,
                          height: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[200],
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/login/personal.png'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Personal Account',
                        style: TextStyle(
                          color: mostUsedColor,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            InkWell(
              onTap: () {
                navigatTo(context, const CompanyLogin());
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      Hero(
                        tag: 'company',
                        child: Container(
                          width: 200,
                          height: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[200],
                            image: const DecorationImage(
                              image:
                                  AssetImage('assets/images/login/company.png'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Business Account',
                        style: TextStyle(
                          color: mostUsedColor,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
