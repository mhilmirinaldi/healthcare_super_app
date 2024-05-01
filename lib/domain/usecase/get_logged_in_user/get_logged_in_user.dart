import 'package:super_app_telemedicine/data/repository/authentication.dart';
import 'package:super_app_telemedicine/data/repository/user_repository.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/entity/user.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class GetLoggedInUser implements UseCase<Result<User>, void> {
  final Authentication _authentication;
  final UserRepository _userRepository;

  GetLoggedInUser({required Authentication authentication, required UserRepository userRepository})
      : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(void _) async {
    String? userId = _authentication.getLoggedInUserId();

    if(userId != null){
      var user = await _userRepository.getUser(id: userId);

      if(user.isSuccess){
        return Result.success(user.resultValue!);
      } else {
        return Result.failed(user.errorMessage!);
      }
    } else{
      return const Result.failed("User not logged in");
    }
  }
}
