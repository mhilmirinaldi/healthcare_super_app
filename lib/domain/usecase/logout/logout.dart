import 'package:super_app_telemedicine/data/repository/authentication.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class Logout implements UseCase<Result<void>, void> {
  final Authentication _authentication;

  Logout({required Authentication authentication}) : _authentication = authentication;

  @override
  Future<Result<void>> call(void _) {
    return _authentication.logout();
  }
  
}