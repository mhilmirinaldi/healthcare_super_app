import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/get_resep_obat/get_resep_obat.dart';
import 'package:super_app_telemedicine/ui/provider/repository/obat_repository/obat_repository_provider.dart';

part 'get_resep_obat_provider.g.dart';

@riverpod
GetResepObat getResepObat(GetResepObatRef ref){
  return GetResepObat(obatRepository: ref.watch(obatRepositoryProvider));
}