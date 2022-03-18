import 'package:flutter/material.dart';
import 'package:payment_methode/presentation/shared/local/constance.dart';
import 'package:payment_methode/presentation/widget/Buttons/elvated_button.dart';
import 'package:payment_methode/presentation/widget/form_field_text/text_form_field.dart';

class PaymentServcies extends StatelessWidget {
  const PaymentServcies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _process = TextEditingController();
    var _details = TextEditingController();
    var _amount = TextEditingController();
    var _paymentfees = TextEditingController();
    var _total = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Payment',
          style: TextStyle(
            color: mostUsedColor,
          ),
        ),
        iconTheme: IconThemeData(color: mostUsedColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              DefaultFormField(
                controller: _process,
                validate: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Password Can\'t be Empty';
                  }
                },
                type: TextInputType.text,
                label: const Text('Process Name'),
                hint: 'Process',
              ),
              const SizedBox(height: 30),
              DefaultFormField(
                controller: _details,
                validate: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Password Can\'t be Empty';
                  }
                },
                type: TextInputType.text,
                label: const Text('Details'),
                hint: 'details',
              ),
              const SizedBox(height: 30),
              DefaultFormField(
                controller: _amount,
                validate: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Password Can\'t be Empty';
                  }
                },
                type: TextInputType.text,
                label: const Text('Amount'),
                hint: 'amount',
              ),
              const SizedBox(height: 30),
              DefaultFormField(
                controller: _paymentfees,
                validate: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Password Can\'t be Empty';
                  }
                },
                type: TextInputType.text,
                label: const Text('Payment Fees'),
                hint: 'fees',
              ),
              const SizedBox(height: 30),
              DefaultFormField(
                controller: _total,
                validate: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Password Can\'t be Empty';
                  }
                },
                type: TextInputType.text,
                label: const Text('Total'),
                hint: 'total',
              ),
              const SizedBox(height: 100),
              DefaultElevatedButton(
                pressed: () {},
                text: 'Pay',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
