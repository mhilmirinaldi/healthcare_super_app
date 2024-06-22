import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/faskes.dart';
import 'package:super_app_telemedicine/domain/usecase/get_rekomendasi_faskes/get_rekomendasi_faskes.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_rekomendasi_faskes_provider.dart';

part 'list_rekomendasi_faskes_provider.g.dart';

@Riverpod(keepAlive: true)
class ListRekomendasiFaskes extends _$ListRekomendasiFaskes{
  @override
  FutureOr<List<Faskes>> build() => const [];

  Future<void> getListRekomendasiFaskes() async{
    state = const AsyncLoading();

    GetRekomendasiFaskes getRekomendasiFaskes = ref.read(getRekomendasiFaskesProvider);

    var result = await getRekomendasiFaskes(null);

    if(result.isSuccess){
      state = AsyncData(result.resultValue!);
    } else {
      state = const AsyncData([]);
    }
  }
}