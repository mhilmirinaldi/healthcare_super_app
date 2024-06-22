import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_spesialis.dart';
import 'package:super_app_telemedicine/domain/usecase/get_kategori_spesialis/get_kategori_spesialis.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_kategori_spesialis_provider.dart';

part 'list_kategori_spesialis_provider.g.dart';

@Riverpod(keepAlive: true)
class ListKategoriSpesialis extends _$ListKategoriSpesialis{
  @override
  FutureOr<List<KategoriSpesialis>> build() => const [];

  Future<void> getListKategoriSpesialis() async{
    state = const AsyncLoading();

    GetKategoriSpesialis getKategoriSpesialis = ref.read(getKategoriSpesialisProvider);

    var result = await getKategoriSpesialis(null);

    if(result.isSuccess){
      state = AsyncData(result.resultValue!);
    } else {
      state = const AsyncData([]);
    }
  }
}