import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ideamagix_ecommerce_flutter_app/utils/fetch.dart';

import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService extends GetxService {
  final Fetch fetch = Fetch(); //instance of Fetch

  Future<void> login({required String username, required String password, dynamic onLogin}) async {
    final String? response = await fetch.post(
        path: '/auth/login',
        data: ({
          "username": "$username",
          "password": "$password"
        }));

    print(response);

    if (response == null) {
      return;
    }

    if (jsonDecode(response)['token'] != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(jsonDecode(response)['token']);

      print(decodedToken);

      onLogin(decodedToken);
    } else {
      Fluttertoast.showToast(msg: 'Invalid Login Details');
    }
  }
}
