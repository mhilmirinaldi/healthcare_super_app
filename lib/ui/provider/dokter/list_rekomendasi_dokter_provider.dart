import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/usecase/get_rekomendasi_dokter/get_rekomendasi_dokter.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_rekomendasi_dokter_provider.dart';

part 'list_rekomendasi_dokter_provider.g.dart';

@Riverpod(keepAlive: true)
class ListRekomendasiDokter extends _$ListRekomendasiDokter{
  @override
  FutureOr<List<Dokter>> build() => const [];

  Future<void> getListRekomendasiDokter() async{
    state = const AsyncLoading();

    GetRekomendasiDokter getRekomendasiDokter = ref.read(getRekomendasiDokterProvider);

    var result = await getRekomendasiDokter(null);

    if(result.isSuccess){
      state = AsyncData(result.resultValue!);
    } else {
      state = const AsyncData([]);
    }
  }
}