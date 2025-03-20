import 'package:firebase_auth/firebase_auth.dart' as fir;

import '../../inputs/update_user_input.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final fir.FirebaseAuth _firebaseAuth = fir.FirebaseAuth.instance;

  @override
  Future<void> update(UpdateUserInput input) async {
    await _firebaseAuth.currentUser?.updateDisplayName(
      input.name,
    );
  }
}
