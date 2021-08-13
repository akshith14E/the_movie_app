import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/exceptions/auth_exception.dart';
import 'package:flutter_task/models/user_model.dart';
import 'package:flutter_task/providers/box_providers.dart';

abstract class BaseAuthRepository {
  Future<void> signIn(User user);
  Future<bool> getCurrentAuthState();
  Future<void> login({required String email, required String password});
  Future<void> signOut();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.read);
});

class AuthRepository implements BaseAuthRepository {
  final Reader _reader;
  AuthRepository(this._reader);
  @override
  Future<User?> login({required String email, required String password}) async {
    final user = _reader(boxProvider('Users')).get(email) as User?;
    if (user == null || user.password != password) {
      throw AuthException('Invalid Credentials');
    }
    _reader(boxProvider('Auth')).put('AuthState', true);
    _reader(boxProvider('currentUser')).put('user', user.email);
  }

  @override
  Future<void> signIn(User user) async {
    final userDoesNotExist = _reader(boxProvider('Users')).get(user.email);
    if (userDoesNotExist != null)
      throw AuthException('user with ${user.email} already exists');
    _reader(boxProvider('Auth')).put('AuthState', true);
    _reader(boxProvider('Users')).put(user.email, user);

    _reader(boxProvider('currentUser')).put('user', user.email);
  }

  @override
  Future<void> signOut() async {
    _reader(boxProvider('Auth')).put('AuthState', false);
  }

  @override
  Future<bool> getCurrentAuthState() async {
    final authState = _reader(boxProvider('Auth')).get('AuthState');
    return authState == null ? false : authState;
  }

  User getCurrentUser() {
    final email = _reader(boxProvider('currentUser')).get('user');
    return _reader(boxProvider('Users')).get(email);
  }
}
