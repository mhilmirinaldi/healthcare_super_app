import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/rekomendasi_dokter.dart';
import 'package:super_app_telemedicine/domain/usecase/get_dokter_by_kategori/get_dokter_by_kategori.dart';
import 'package:super_app_telemedicine/domain/usecase/get_dokter_by_kategori/get_dokter_by_kategori_param.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_dokter_by_kategori_provider.dart';

part 'list_dokter_by_kategori_provider.g.dart';

@riverpod
Future<List<RekomendasiDokter>> listDokterByKategori(ListDokterByKategoriRef ref, {required String idKategori}) async {
  GetDokterByKategori getDokterByKategori = ref.read(getDokterByKategoriProvider);

  var result = await getDokterByKategori(GetDokterByKategoriParam(idKategori: idKategori));

  if (result.isSuccess) {
    return result.resultValue!;
  } else {
    return [];
  }
}