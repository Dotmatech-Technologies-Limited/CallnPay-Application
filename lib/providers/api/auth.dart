import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../brain/auth.dart';
import '../data/auth.dart';

class AuthAPI extends ChangeNotifier {
  String url = 'https://callnpayapi20230120085359.azurewebsites.net/api';
  Map<String, String> headers({String? token}) => {
        if (token != null) 'Authorization': 'Bearer $token',
        // 'Content-Type': 'application/json',
      };
  Future<bool> check(BuildContext context) async {
    bool success = false;
    AuthData authData = Provider.of<AuthData>(context, listen: false);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString(
      "user",
    );
    String? token = prefs.getString(
      "token",
    );
    if (user != null) {
      // authData.user = User.fromJson(
      //   jsonDecode(user),
      //   userToken: token!,
      // );
    }
    return success;
  }

  Future<bool> login({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    bool success = false;
    AuthData authData = Provider.of<AuthData>(context, listen: false);
    try {
      http.Response response = await http.post(
        Uri.parse('$url/api/identity/user/register'),
        body: {
          "username": username,
          "password": password,
        },
        headers: headers(),
      );
      dev.log('login body: ${response.body}');
      // if (response.statusCode < 300) {
      //   authData.user = User.fromJson(jsonDecode(response.body));
      //   success = true;
      // } else if (response.statusCode < 500) {
      //   await alert(
      //     content: jsonDecode(response.body)['error']['message'] ??
      //         'Internal Error, Try again',
      //   );
      // } else {
      //   dev.log('login error: ${jsonDecode(response.body)}');
      //   await alert(
      //     content: 'Internal Error, Try again',
      //   );
      // }
    } on Exception {
      dev.log('login exception');
      // alert(
      //   content: 'Check your internet connection',
      // );
    } catch (e) {
      dev.log('login error: $e');
      // alert(
      //   content: 'There was an error, please try again',
      // );
    }
    return success;
  }

  Future<bool> register({
    required BuildContext context,
    required String username,
    required String firstName,
    required String lastName,
    required String emailAddress,
    required String password,
  }) async {
    bool success = false;
    AuthData authData = Provider.of<AuthData>(context, listen: false);
    try {
      http.Response response = await http.post(
        Uri.parse('$url/api/identity/user/register'),
        body: {
          "email": emailAddress,
          "password": password,
          "firstName": firstName,
          "lastName": lastName,
          "username": username,
        },
        headers: headers(),
      );
      dev.log('register body: ${response.body}');
      dev.log('register statusCode: ${response.statusCode}');
      // if (response.statusCode < 300) {
      //   authData.user = User.fromJson(jsonDecode(response.body));
      //   success = true;
      // } else if (response.statusCode < 500) {
      //   await alert(
      //     content: jsonDecode(response.body)['error']['message'] ??
      //         'Internal Error, Try again',
      //   );
      // } else {
      //   dev.log('register error: ${jsonDecode(response.body)}');
      //   await alert(
      //     content: 'Internal Error, Try again',
      //   );
      // }
    } on Exception {
      dev.log('register exception');
      // alert(
      //   content: 'Check your internet connection',
      // );
    } catch (e) {
      dev.log('register error: $e');
      // alert(
      //   content: 'There was an error, please try again',
      // );
    }
    return success;
  }

  Future<bool> basicDetails({
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
    bool success = false;
    AuthData authData = Provider.of<AuthData>(context, listen: false);
    try {
      http.Response response = await http.post(
        Uri.parse('$url/api/identity/user/register'),
        body: {
          "countryCallingCode": 'countryCallingCode',
          "phoneNumber": 'phoneNumber',
          "firstName": 'firstName',
          "lastName": 'lastName',
          "email": 'email',
          "country": country,
          "state": state,
          "zipCode": zipCode,
          "city": city,
          "addressLine1": addressLine1,
          "addressLine2": addressLine2,
          // "addressLine3": addressLine3,
          "photoUrl": photoUrl,
          "dateOfBirth": dateOfBirth,
          // "gender": 0
        },
        headers: headers(),
      );
      dev.log('register body: ${response.body}');
      // if (response.statusCode < 300) {
      //   authData.user = User.fromJson(jsonDecode(response.body));
      //   success = true;
      // } else if (response.statusCode < 500) {
      //   await alert(
      //     content: jsonDecode(response.body)['error']['message'] ??
      //         'Internal Error, Try again',
      //   );
      // } else {
      //   dev.log('register error: ${jsonDecode(response.body)}');
      //   await alert(
      //     content: 'Internal Error, Try again',
      //   );
      // }
    } on Exception {
      dev.log('register exception');
      // alert(
      //   content: 'Check your internet connection',
      // );
    } catch (e) {
      dev.log('register error: $e');
      // alert(
      //   content: 'There was an error, please try again',
      // );
    }
    return success;
  }

  Future<bool> verifyEmail({
    required BuildContext context,
    required String code,
  }) async {
    bool success = false;
    AuthData authData = Provider.of<AuthData>(context, listen: false);
    try {
      http.Response response = await http.post(
        Uri.parse('$url/api/identity/account/confirmemail'),
        body: {
          "userId": 'userId',
          "code": code,
        },
        headers: headers(),
      );
      dev.log('verify email body: ${response.body}');
      // if (response.statusCode < 300) {
      //   authData.user = User.fromJson(jsonDecode(response.body));
      //   success = true;
      // } else if (response.statusCode < 500) {
      //   await alert(
      //     content: jsonDecode(response.body)['error']['message'] ??
      //         'Internal Error, Try again',
      //   );
      // } else {
      //   dev.log('verify email error: ${jsonDecode(response.body)}');
      //   await alert(
      //     content: 'Internal Error, Try again',
      //   );
      // }
    } on Exception {
      dev.log('verify email exception');
      // alert(
      //   content: 'Check your internet connection',
      // );
    } catch (e) {
      dev.log('verify email error: $e');
      // alert(
      //   content: 'There was an error, please try again',
      // );
    }
    return success;
  }

  Future<bool> addPhoneNumber({
    required BuildContext context,
    required String countryCode,
    required String phoneNumber,
  }) async {
    bool success = false;
    AuthData authData = Provider.of<AuthData>(context, listen: false);
    try {
      http.Response response = await http.post(
        Uri.parse('$url/api/identity/account/confirmemail'),
        body: {
          "userName": 'userName',
          "countryCallingCode": countryCode,
          "phoneNumber": phoneNumber
        },
        headers: headers(),
      );
      dev.log('add phone body: ${response.body}');
      // if (response.statusCode < 300) {
      //   authData.user = User.fromJson(jsonDecode(response.body));
      //   success = true;
      // } else if (response.statusCode < 500) {
      //   await alert(
      //     content: jsonDecode(response.body)['error']['message'] ??
      //         'Internal Error, Try again',
      //   );
      // } else {
      //   dev.log('add phone error: ${jsonDecode(response.body)}');
      //   await alert(
      //     content: 'Internal Error, Try again',
      //   );
      // }
    } on Exception {
      dev.log('add phone exception');
      // alert(
      //   content: 'Check your internet connection',
      // );
    } catch (e) {
      dev.log('add phone error: $e');
      // alert(
      //   content: 'There was an error, please try again',
      // );
    }
    return success;
  }

  Future<bool> verifyPhoneNumber({
    required BuildContext context,
    required String countryCode,
    required String code,
    required String phoneNumber,
  }) async {
    bool success = false;
    AuthData authData = Provider.of<AuthData>(context, listen: false);
    try {
      http.Response response = await http.post(
        Uri.parse('$url/api/identity/account/confirmemail'),
        body: {
          "userName": 'userName',
          "countryCallingCode": countryCode,
          "phoneNumber": phoneNumber,
          "code": code,
        },
        headers: headers(),
      );
      dev.log('verify phone body: ${response.body}');
      // if (response.statusCode < 300) {
      //   authData.user = User.fromJson(jsonDecode(response.body));
      //   success = true;
      // } else if (response.statusCode < 500) {
      //   await alert(
      //     content: jsonDecode(response.body)['error']['message'] ??
      //         'Internal Error, Try again',
      //   );
      // } else {
      //   dev.log('verify phone error: ${jsonDecode(response.body)}');
      //   await alert(
      //     content: 'Internal Error, Try again',
      //   );
      // }
    } on Exception {
      dev.log('verify phone exception');
      // alert(
      //   content: 'Check your internet connection',
      // );
    } catch (e) {
      dev.log('verify phone error: $e');
      // alert(
      //   content: 'There was an error, please try again',
      // );
    }
    return success;
  }

  Future<bool> addPIN({
    required BuildContext context,
    required String newPIN,
    required String confirmNewPIN,
  }) async {
    bool success = false;
    AuthData authData = Provider.of<AuthData>(context, listen: false);
    try {
      http.Response response = await http.post(
        Uri.parse('$url/api/identity/account/newpin'),
        body: {
          "newPIN": newPIN,
          "confirmNewPIN": confirmNewPIN,
        },
        headers: headers(),
      );
      dev.log('add pin body: ${response.body}');
      // if (response.statusCode < 300) {
      //   authData.user = User.fromJson(jsonDecode(response.body));
      //   success = true;
      // } else if (response.statusCode < 500) {
      //   await alert(
      //     content: jsonDecode(response.body)['error']['message'] ??
      //         'Internal Error, Try again',
      //   );
      // } else {
      //   dev.log('add pin error: ${jsonDecode(response.body)}');
      //   await alert(
      //     content: 'Internal Error, Try again',
      //   );
      // }
    } on Exception {
      dev.log('add pin exception');
      // alert(
      //   content: 'Check your internet connection',
      // );
    } catch (e) {
      dev.log('add pin error: $e');
      // alert(
      //   content: 'There was an error, please try again',
      // );
    }
    return success;
  }
}
