/*
      .verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (
        AuthCredential authCredential,
      ) {
        FirebaseAuth.instance
            .signInWithCredential(authCredential)
            .then((result) {
          navigatTo(context, const HomeScreen());
          emit(RegisterVerifyPhoneSucess());
        }).catchError((error) {
          print(error.toString());
          emit(RegisterVerifyPhoneError(error));
        });
        print('phone number verified');
      },
      verificationFailed: (
        FirebaseAuthException exception,
      ) {
        print(exception.toString());
      },
      codeAutoRetrievalTimeout: (String verificationd) {
        verificationd = verificationd;
        print(verificationd);
        print('timeOut');
      },
      timeout: const Duration(seconds: 60),
      codeSent: (String verified, int? resendToken) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('Enter Code From TextMessage'),
            content: Column(
              children: [
                TextField(controller: codeController),
              ],
            ),
            actions: [
              TextButton(
                child: const Text(
                  'submit',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () {
                  var credential = PhoneAuthProvider.credential(
                      verificationId: verified,
                      smsCode: codeController.text.toString());
                  FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((result) {
                    navigatTo(context, const HomeScreen());
                    emit(RegisterVerifyPhoneSucess());
                  }).catchError((error) {
                    print(error.toString());
                    emit(RegisterVerifyPhoneError(error));
                  });
                },
              ),
            ],
          ),
        );
      },
    )
        
*/