import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { loggedIn, token, email }

class SharedPrefController {
  late SharedPreferences _sharedPreferences;

  static final SharedPrefController _instance = SharedPrefController._();

  factory SharedPrefController() {
    return _instance;
  }

  SharedPrefController._();

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required String token}) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);
    // await _sharedPreferences.setString(
    //     PrefKeys.email.toString(), reLoginModel.user.user.email);

    await _sharedPreferences.setString("token", token);
  }
  Future<void> saveBool({required bool admin}) async {
    await _sharedPreferences.setBool("isAdmin", admin);
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  String get token => _sharedPreferences.getString("token") ?? '';

  bool get isAdmin => _sharedPreferences.getBool("isAdmin") ?? false;

  Future<bool> clear() async => await _sharedPreferences.clear();
}
