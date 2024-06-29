import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

String api_map_key = 'AIzaSyAdZAbl2IbvRBYdAx81k0IFotYOtU4opDw';

String formatDate(DateTime date) {
  // Menginisialisasi lokal bahasa Indonesia
  initializeDateFormatting('id', null);
  final DateFormat dayShortFormat = DateFormat('EEEE, d MMMM y', 'id');
  return dayShortFormat.format(date);
}

String formateTime(DateTime date) {
  final DateFormat timeFormat = DateFormat('HH:mm', 'id');
  return timeFormat.format(date);
}

String formatTransaksi(DateTime date){
  final DateFormat dateFormat = DateFormat('d MMMM', 'id');
  final DateFormat timeFormat = DateFormat('HH:mm', 'id');
  return '${dateFormat.format(date)}, ${timeFormat.format(date)}';
}

String formatRiwayatChat(DateTime date){
  final DateFormat dateFormat = DateFormat('dd/MM/y');
  return dateFormat.format(date);
}
