import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_obat.dart';
import 'package:super_app_telemedicine/domain/usecase/get_kategori_obat/get_kategori_obat.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_kategori_obat_provider.dart';

part 'list_kategori_obat_provider.g.dart';

@Riverpod(keepAlive: true)
class ListKategoriObat extends _$ListKategoriObat{
  @override
  FutureOr<List<KategoriObat>> build() => const [];

  Future<void> getListKategoriObat() async{
    state = const AsyncLoading();

    GetKategoriObat getKategoriObat = ref.read(getKategoriObatProvider);

    var result = await getKategoriObat(null);

    if(result.isSuccess){
      state = AsyncData(result.resultValue!);
    } else {
      state = const AsyncData([]);
    }
  }
}