import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/domain/usecase/get_rekomendasi_obat/get_rekomendasi_obat.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_rekomendasi_obat_provider.dart';

part 'list_rekomendasi_obat_provider.g.dart';

@Riverpod(keepAlive: true)
class ListRekomendasiObat extends _$ListRekomendasiObat{
  @override
  FutureOr<List<Obat>> build() => const [];

  Future<void> getListRekomendasiObat() async{
    state = const AsyncLoading();

    GetRekomendasiObat getRekomendasiObat = ref.read(getRekomendasiObatProvider);

    var result = await getRekomendasiObat(null);

    if(result.isSuccess){
      state = AsyncData(result.resultValue!);
    } else {
      state = const AsyncData([]);
    }
  }
}