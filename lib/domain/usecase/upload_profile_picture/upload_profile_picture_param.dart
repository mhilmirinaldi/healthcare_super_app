import 'dart:io';

import 'package:super_app_telemedicine/domain/entity/user.dart';

class UploadProfilePictureParam {
  final File imageFile;
  final User user;

  UploadProfilePictureParam({required this.imageFile, required this.user});
}