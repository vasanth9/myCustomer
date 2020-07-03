import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mycustomers/app/locator.dart';
import 'package:mycustomers/app/router.dart';
import 'package:mycustomers/core/exceptions/auth_exception.dart';
import 'package:mycustomers/core/services/auth/auth_service.dart';
import 'package:mycustomers/core/utils/logger.dart';
import 'package:mycustomers/ui/views/home/sigin/signin_view.dart';
import 'package:pedantic/pedantic.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'business/business_view.dart';

class SignUpViewModel extends BaseViewModel {
  String phoneNumber;
  bool obscureText = true;
  bool btnColor = false;

  bool passValid = false;
  bool phoneValid = false;

  bool get valid => passValid && phoneValid;

  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  void togglePassword() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void activeBtn() {
    btnColor = valid;
    notifyListeners();
  }

  void getPhoneNumber(String phoneNumber) async {}

  Future onInputChange() async {}

  final NavigationService _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  // Navigation
  Future navigateToLogin() async {
    await _navigationService.replaceWithTransition(SignInView(),
        opaque: true, transition: 'lefttorightwithfade', duration: Duration(seconds: 1));
  }

  Future completeSignup() async {
    await _navigationService.replaceWithTransition(BusinessView(),
        opaque: true, transition: 'rotate', duration: Duration(seconds: 1));
  }


  Future<void> signUp(String phoneNumber, String password) async {
    setBusy(true);
    try {
      await _authService.signUpWithPhoneNumber(phoneNumber, password);
      unawaited(completeSignup());
    } on AuthException catch (e) {
      Logger.e(e.message);
    } on Exception catch (e, s) {
      Logger.e('Unknown Error', e: e, s: s);
    }
    setBusy(false);
  }
}
