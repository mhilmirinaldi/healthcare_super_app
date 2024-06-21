import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/domain/usecase/get_obat_by_kategori/get_obat_by_kategori.dart';
import 'package:super_app_telemedicine/domain/usecase/get_obat_by_kategori/get_obat_by_kategori_param.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_obat_by_kategori_provider.dart';

part 'list_obat_by_kategori_provider.g.dart';

@riverpod
Future<List<Obat>> listObatByKategori(ListObatByKategoriRef ref, {required String idKategori}) async {
  GetObatByKategori getObatByKategori = ref.read(getObatByKategoriProvider);

  var result = await getObatByKategori(GetObatByKategoriParam(idKategori: idKategori));

  if (result.isSuccess) {
    return result.resultValue!;
  } else {
    return [];
  }
}