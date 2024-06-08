import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/upload_profile_picture/upload_profile_picture.dart';
import 'package:super_app_telemedicine/ui/provider/repository/user_repository/user_repository_provider.dart';

part 'upload_profile_picture_provider.g.dart';

@riverpod
UploadProfilePicture uploadProfilePicture(UploadProfilePictureRef ref){
  return UploadProfilePicture(userRepository: ref.watch(userRepositoryProvider));
}