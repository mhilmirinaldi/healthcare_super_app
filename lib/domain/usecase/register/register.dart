import 'package:super_app_telemedicine/data/repository/authentication.dart';
import 'package:super_app_telemedicine/data/repository/user_repository.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/entity/user.dart';
import 'package:super_app_telemedicine/domain/usecase/register/register_param.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class Register implements UseCase<Result<User>, RegisterParam> {
  final UserRepository _userRepository;
  final Authentication _authentication;

  Register(
      {required UserRepository userRepository,
      required Authentication authentication})
      : _userRepository = userRepository,
        _authentication = authentication;

  @override
  Future<Result<User>> call(RegisterParam params) async {
    var idResult = await _authentication.register(email: params.email, password: params.password);

    if(idResult.isSuccess){
      var userResult = await _userRepository.createUser(id: idResult.resultValue!, email: params.email, name: params.name, photoUrl: params.photoUrl);
      if(userResult.isSuccess){
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.errorMessage!);
      }
    } else {
      return Result.failed(idResult.errorMessage!);
    }
  }
}
