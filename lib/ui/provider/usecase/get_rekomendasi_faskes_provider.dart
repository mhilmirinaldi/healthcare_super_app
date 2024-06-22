import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/get_rekomendasi_faskes/get_rekomendasi_faskes.dart';
import 'package:super_app_telemedicine/ui/provider/repository/faskes_repository/faskes_repository_provider.dart';

part 'get_rekomendasi_faskes_provider.g.dart';

@riverpod
GetRekomendasiFaskes getRekomendasiFaskes(GetRekomendasiFaskesRef ref){
  return GetRekomendasiFaskes(faskesRepository: ref.watch(faskesRepositoryProvider));
}