import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/customBlueButton.dart';
import '../../dashboard/main_home_screen.dart';
import '../../profile/setup_pin.dart';
import '../../profile/verifyEmail.dart';
import '../../profile/verify_number.dart';
import '../../profile/verify_phoneNumber.dart';
import '../API/auth.dart';
import '../brain/auth.dart';
import '../data/auth.dart';

class AuthFunctions extends ChangeNotifier {
  check({required BuildContext context}) async {
    AuthData authData = Provider.of<AuthData>(context, listen: false);
    await SharedPreferences.getInstance().then((prefs) {
      String? user = prefs.getString(
        "user",
      );
      String? token = prefs.getString(
        "token",
      );
      // if (user != null) {
      //   authData.user = User.fromJson(
      //     jsonDecode(user),
      //     userToken: token!,
      //   );
      //   Navigation.replaceAll(
      //     const Homepage(),
      //     context,
      //   );
      // } else {
      //   Navigation.replaceAll(
      //     const Onboarding(),
      //     context,
      //   );
      // }
    });
  }

  Future<void> login({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    FocusScope.of(context).unfocus();
    AuthAPI api = Provider.of<AuthAPI>(context, listen: false);
    await api
        .login(
      context: context,
      username: username.trim(),
      password: password.trim(),
    )
        .then((value) async {
      if (value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainHomeScreen(),
          ),
          (route) => false,
        );
      }
    });
  }

  Future<void> register({
    required BuildContext context,
    required String username,
    required String firstName,
    required String lastName,
    required String emailAddress,
    required String password,
  }) async {
    FocusScope.of(context).unfocus();
    AuthAPI api = Provider.of<AuthAPI>(context, listen: false);
    await api
        .register(
      context: context,
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      emailAddress: emailAddress.trim(),
      password: password.trim(),
      username: username.trim(),
    )
        .then((value) async {
      if (value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyEmail(),
          ),
        );
      }
    });
  }

  Future<void> basicDetails({
    required BuildContext context,
    // required String countryCallingCode,
    // required String phoneNumber,
    // required String firstName,
    // required String lastName,
    // required String email,
    required String country,
    required String state,
    required String zipCode,
    required String city,
    required String addressLine1,
    required String addressLine2,
    // required String addressLine3,
    required String photoUrl,
    required String dateOfBirth,
    // required String gender,
  }) async {
    FocusScope.of(context).unfocus();
    AuthAPI api = Provider.of<AuthAPI>(context, listen: false);
    await api
        .basicDetails(
      context: context,
      country: country,
      state: state,
      zipCode: zipCode,
      city: city,
      addressLine1: addressLine1,
      addressLine2: addressLine2,
      dateOfBirth: dateOfBirth,
      photoUrl: photoUrl,
    )
        .then((value) async {
      if (value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainHomeScreen(),
          ),
          (route) => route.isFirst,
        );
      }
    });
  }

  Future<void> verifyEmail({
    required BuildContext context,
    required String code,
  }) async {
    FocusScope.of(context).unfocus();
    AuthAPI api = Provider.of<AuthAPI>(context, listen: false);
    await api
        .verifyEmail(
      context: context,
      code: code,
    )
        .then((value) async {
      if (value) {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 16,
                child: Container(
                  width: 300,
                  height: 400,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                        child: Center(
                          child: Image.asset(
                            'assets/images/congratulations.png',
                            width: 150,
                          ),
                        ),
                      ),
                      const Text(
                        'Email Verified!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Color.fromRGBO(1, 31, 120, 1)),
                      ),
                      //Spacer(),
                      const Text(
                        'Your email has been successfully verified',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                        child: CustomBlueButton(
                            text: 'Proceed',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const VerifyPhoneNumber(),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              );
            });
      }
    });
  }

  Future<void> addPhoneNumber({
    required BuildContext context,
    required String countryCode,
    required String phoneNumber,
  }) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerifyNumber(
          countryCode: countryCode,
          phoneNumber: phoneNumber,
        ),
      ),
    );
    // FocusScope.of(context).unfocus();
    // AuthAPI api = Provider.of<AuthAPI>(context, listen: false);
    // await api
    //     .addPhoneNumber(
    //   context: context,
    //   countryCode: countryCode,
    //   phoneNumber: phoneNumber,
    // )
    //     .then((value) async {
    //   if (value) {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => VerifyNumber(
    //           countryCode: countryCode,
    //           phoneNumber: phoneNumber,
    //         ),
    //       ),
    //     );
    //   }
    // });
  }

  Future<void> verifyPhoneNumber({
    required BuildContext context,
    required String countryCode,
    required String phoneNumber,
    required String code,
  }) async {
    FocusScope.of(context).unfocus();
    AuthAPI api = Provider.of<AuthAPI>(context, listen: false);
    await api
        .verifyPhoneNumber(
      context: context,
      countryCode: countryCode,
      phoneNumber: phoneNumber,
      code: code,
    )
        .then((value) async {
      if (value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SetupPin()));
      }
    });
  }

  Future<void> addPIN({
    required BuildContext context,
    required String newPIN,
    required String confirmNewPIN,
  }) async {
    FocusScope.of(context).unfocus();
    AuthAPI api = Provider.of<AuthAPI>(context, listen: false);
    await api
        .addPIN(
      context: context,
      newPIN: newPIN,
      confirmNewPIN: confirmNewPIN,
    )
        .then((value) async {
      if (value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SetupPin(),
          ),
        );
      }
    });
  }
}
