import 'package:flutter/material.dart';
import 'package:payment_methode/presentation/screens/layout/layout.dart';
import 'package:payment_methode/presentation/shared/local/constance.dart';
import 'package:payment_methode/presentation/widget/Buttons/text_button.dart';
import 'package:payment_methode/presentation/widget/form_field_text/text_form_field.dart';
import 'package:payment_methode/presentation/widget/navigattion/navigation.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _nameController = TextEditingController();
    var _userNameController = TextEditingController();
    var _locationController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Account',
          style: TextStyle(
            color: mostUsedColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 9.0),
            child: CustomeTButton(
              pressed: () {
                navigatTo(context, const LayoutScreen());
              },
              text: 'Update',
              color: const Color.fromRGBO(0, 59, 117, 1),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                CircleAvatar(
                  radius: 64.0,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: const CircleAvatar(
                    radius: 65.0,
                    // backgroundImage:
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.blueAccent,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            DefaultFormField(
              controller: _nameController,
              validate: (value) {
                if (value.isEmpty || value == null) {
                  return 'Email Can\'t be Empty';
                }
              },
              type: TextInputType.name,
              label: const Text('Name'),
              hint: 'your Name',
            ),
            const SizedBox(height: 25),
            DefaultFormField(
              controller: _userNameController,
              validate: (value) {
                if (value.isEmpty || value == null) {
                  return 'Email Can\'t be Empty';
                }
              },
              type: TextInputType.name,
              label: const Text('User Name'),
              hint: 'your User Name',
            ),
            const SizedBox(height: 25),
            DefaultFormField(
              controller: _locationController,
              validate: (value) {
                if (value.isEmpty || value == null) {
                  return 'Email Can\'t be Empty';
                }
              },
              type: TextInputType.name,
              label: const Text('Location'),
              hint: 'Location',
            ),
          ],
        ),
      ),
    );
  }
}
