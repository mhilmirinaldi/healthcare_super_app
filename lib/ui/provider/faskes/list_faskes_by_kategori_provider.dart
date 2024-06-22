import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/faskes.dart';
import 'package:super_app_telemedicine/domain/usecase/get_faskes_by_kategori/get_faskes_by_kategori.dart';
import 'package:super_app_telemedicine/domain/usecase/get_faskes_by_kategori/get_faskes_by_kategori_param.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_faskes_by_kategori_provider.dart';

part 'list_faskes_by_kategori_provider.g.dart';

@riverpod
Future<List<Faskes>> listFaskesByKategori(ListFaskesByKategoriRef ref, {required String idKategori}) async {
  GetFaskesByKategori getFaskesByKategori = ref.read(getFaskesByKategoriProvider);

  var result = await getFaskesByKategori(GetFaskesByKategoriParam(idKategori: idKategori));

  if (result.isSuccess) {
    return result.resultValue!;
  } else {
    return [];
  }
}