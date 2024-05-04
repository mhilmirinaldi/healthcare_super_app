import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_dokter.dart';
import 'package:super_app_telemedicine/domain/usecase/get_kategori_dokter/get_kategori_dokter.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_kategori_dokter_provider.dart';

part 'list_kategori_dokter_provider.g.dart';

@Riverpod(keepAlive: true)
class ListKategoriDokter extends _$ListKategoriDokter{
  @override
  FutureOr<List<KategoriDokter>> build() => const [];

  Future<void> getListKategoriDokter() async{
    state = const AsyncLoading();

    GetKategoriDokter getKategoriDokter = ref.read(getKategoriDokterProvider);

    var result = await getKategoriDokter(null);

    if(result.isSuccess){
      state = AsyncData(result.resultValue!);
    } else {
      state = const AsyncData([]);
    }
  }
}