import 'package:get/get.dart';
import 'package:ideamagix_ecommerce_flutter_app/models/user.model.dart';
import 'package:ideamagix_ecommerce_flutter_app/services/auth.service.dart';

class AuthController extends GetxController {
  final authUser = Rx<User>;
  final authToken = '';
  dynamic authUserId = Rx<int>;

  AuthService authService = Get.find<AuthService>();

  login({required String username, required String password, dynamic onLogin}) async {
    await authService.login(
        username: username,
        password: password,
        onLogin: (token) {
          authUserId = token['sub'];
          onLogin();
        });

    // TODO: Set auth token and make login redirect to call back
  }
}
