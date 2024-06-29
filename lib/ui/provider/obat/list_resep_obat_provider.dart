import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/domain/usecase/get_resep_obat/get_resep_obat.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_resep_obat_provider.dart';

part 'list_resep_obat_provider.g.dart';

@Riverpod(keepAlive: true)
class ListResepObat extends _$ListResepObat{
  @override
  FutureOr<List<Obat>> build() => const [];

  Future<void> getListResepObat() async{
    state = const AsyncLoading();

    GetResepObat getResepObat = ref.read(getResepObatProvider);

    var result = await getResepObat(null);

    if(result.isSuccess){
      state = AsyncData(result.resultValue!);
    } else {
      state = const AsyncData([]);
    }
  }
}