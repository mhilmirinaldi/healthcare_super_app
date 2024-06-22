import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/usecase/get_dokter_faskes_by_kategori/get_dokter_faskes_by_kategori.dart';
import 'package:super_app_telemedicine/domain/usecase/get_dokter_faskes_by_kategori/get_dokter_faskes_by_kategori_param.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_dokter_faskes_by_kategori_provider.dart';

part 'list_dokter_faskes_by_kategori_provider.g.dart';

@riverpod
Future<List<Dokter>> listDokterFaskesByKategori(ListDokterFaskesByKategoriRef ref, {required String idKategori}) async {
  GetDokterFaskesByKategori getDokterFaskesByKategori = ref.read(getDokterFaskesByKategoriProvider);

  var result = await getDokterFaskesByKategori(GetDokterFaskesByKategoriParam(idKategori: idKategori));

  if (result.isSuccess) {
    return result.resultValue!;
  } else {
    return [];
  }
}