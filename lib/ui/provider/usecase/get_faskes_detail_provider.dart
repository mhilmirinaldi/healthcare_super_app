import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/get_faskes_detail/get_faskes_detail.dart';
import 'package:super_app_telemedicine/ui/provider/repository/faskes_repository/faskes_repository_provider.dart';

part 'get_faskes_detail_provider.g.dart';

@riverpod
GetFaskesDetail getFaskesDetail(GetFaskesDetailRef ref){
  return GetFaskesDetail(faskesRepository: ref.watch(faskesRepositoryProvider));
}