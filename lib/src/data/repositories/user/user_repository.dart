import '../../inputs/update_user_input.dart';

abstract interface class UserRepository {
  Future<void> update(UpdateUserInput input);
}
