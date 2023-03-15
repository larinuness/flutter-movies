import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/login/login_repository.dart';
import 'login_services.dart';

class LoginServicesImpl implements LoginService {
  final LoginRepository _loginRepository;

  LoginServicesImpl({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;

  @override
  Future<UserCredential> login() => _loginRepository.login();

  @override
  Future<void> logout() => _loginRepository.logout();
}
