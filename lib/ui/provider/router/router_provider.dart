import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/entity/faskes.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_dokter.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_obat.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_spesialis.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/category_page/category_page.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/category_page/lainnya_page.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/chat_room_page/chat_room_page.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/chat_room_page/check_out_obat_chat.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/chat_room_page/checkout_additional_time.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/check_out_chat_page/check_out_chat_page.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/detail_dokter_page/detail_dokter_page.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/search_page/search_page.dart';
import 'package:super_app_telemedicine/ui/page/faskes_page/category_spesialis_page/category_spesialis_page.dart';
import 'package:super_app_telemedicine/ui/page/faskes_page/category_spesialis_page/lainnya_spesialis_page.dart';
import 'package:super_app_telemedicine/ui/page/faskes_page/check_out_fakses_page/check_out_faskes_page.dart';
import 'package:super_app_telemedicine/ui/page/faskes_page/detail_dokter_faskes_page.dart';
import 'package:super_app_telemedicine/ui/page/faskes_page/detail_faskes_page/detail_faskes_page.dart';
import 'package:super_app_telemedicine/ui/page/faskes_page/detail_pesanan_faskes/detail_pesanan_faskes_page.dart';
import 'package:super_app_telemedicine/ui/page/faskes_page/search_faskes_page/search_faskes_page.dart';
import 'package:super_app_telemedicine/ui/page/login_page/login_page.dart';
import 'package:super_app_telemedicine/ui/page/main_page/main_page.dart';
import 'package:super_app_telemedicine/ui/page/register_page/register_page.dart';
import 'package:super_app_telemedicine/ui/page/riwayat_page/detail_pesanan_chat.dart';
import 'package:super_app_telemedicine/ui/page/riwayat_page/detail_riwayat_page.dart';
import 'package:super_app_telemedicine/ui/page/test_page.dart';
import 'package:super_app_telemedicine/ui/page/toko_obat_page/category_obat_page/category_obat_page.dart';
import 'package:super_app_telemedicine/ui/page/toko_obat_page/category_obat_page/lainnya_obat_page.dart';
import 'package:super_app_telemedicine/ui/page/toko_obat_page/check_out_page/check_out_page.dart';
import 'package:super_app_telemedicine/ui/page/toko_obat_page/detail_obat_page/detail_obat_page.dart';
import 'package:super_app_telemedicine/ui/page/toko_obat_page/detail_transaksi_page/detail_transaksi_page.dart';
import 'package:super_app_telemedicine/ui/page/toko_obat_page/search_page/search_obat_page.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(routes: [
      GoRoute(
        path: '/main',
        name: 'main',
        builder: (context, state) {
          final index = state.extra as int? ?? 0;
          return MainPage(initialIndex: index);
        },
      ),
      GoRoute(
          path: '/test',
          name: 'test',
          builder: (context, state) => const TestPage()),
      GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => const LoginPage()),
      GoRoute(
          path: '/register',
          name: 'register',
          builder: (context, state) => const RegisterPage()),
      GoRoute(
        path: '/detail_dokter',
        name: 'detail_dokter',
        builder: (context, state) =>
            DetailDokterPage(dokter: state.extra as Dokter),
      ),
      GoRoute(
        path: '/detail_dokter_faskes',
        name: 'detail_dokter_faskes',
        builder: (context, state) =>
            DetailDokterFaskesPage(dokter: state.extra as Dokter),
      ),
      GoRoute(
          path: '/category',
          name: 'category',
          builder: (context, state) =>
              CategoryDokterPage(state.extra as KategoriDokter)),
      GoRoute(
          path: '/search_page',
          name: 'search_page',
          builder: (context, state) => const SearchDokterPage()),
      GoRoute(
          path: '/lainnya',
          name: 'lainnya',
          builder: (context, state) => const LainnyaPage()),
      GoRoute(
          path: '/lainnya_obat',
          name: 'lainnya_obat',
          builder: (context, state) => const LainnyaObatPage()),
      GoRoute(
          path: '/lainnya_spesialis',
          name: 'lainnya_spesialis',
          builder: (context, state) => const LainnyaSpesialisPage()),
      GoRoute(
          path: '/category_obat',
          name: 'category_obat',
          builder: (context, state) =>
              CategoryObatPage(state.extra as KategoriObat)),
      GoRoute(
          path: '/search_obat',
          name: 'search_obat',
          builder: (context, state) => const SearchObatPage()),
      GoRoute(
          path: '/detail_obat',
          name: 'detail_obat',
          builder: (context, state) =>
              DetailObatPage(obat: state.extra as Obat)),
      GoRoute(
          path: '/search_faskes',
          name: 'search_faskes',
          builder: (context, state) => const SearchFaskesPage()),
      GoRoute(
          path: '/category_spesialis',
          name: 'category_spesialis',
          builder: (context, state) =>
              CategorySpesialisPage(state.extra as KategoriSpesialis)),
      GoRoute(
          path: '/detail_faskes',
          name: 'detail_faskes',
          builder: (context, state) =>
              DetailFaskesPage(faskes: state.extra as Faskes)),
      GoRoute(
          path: '/check_out',
          name: 'check_out',
          builder: (context, state) => const CheckoutObatPage()),
      GoRoute(
          path: '/detail_transaksi',
          name: 'detail_transaksi',
          builder: (context, state) =>
              DetailTransaksiPage(transaksi: state.extra as Transaksi)),
      GoRoute(
          path: '/check_out_faskes',
          name: 'check_out_faskes',
          builder: (context, state) =>
              CheckoutFaskesPage(transaksi: state.extra as Transaksi)),
      GoRoute(
          path: '/check_out_chat',
          name: 'check_out_chat',
          builder: (context, state) =>
              CheckoutChatPage(transaksi: state.extra as Transaksi)),
      GoRoute(
          path: '/chat_room',
          name: 'chat_room',
          builder: (context, state) =>
              ChatRoomPage(transaksi: state.extra as Transaksi)),
      GoRoute(
          path: '/detail_pesanan_faskes',
          name: 'detail_pesanan_faskes',
          builder: (context, state) =>
              DetailPesananFaskesPage(transaksi: state.extra as Transaksi)),
      GoRoute(
          path: '/detail_pesanan_chat',
          name: 'detail_pesanan_chat',
          builder: (context, state) =>
              DetailPesananChatPage(transaksi: state.extra as Transaksi)),
      GoRoute(
          path: '/detail_riwayat_page',
          name: 'detail_riwayat_page',
          builder: (context, state) =>
              DetailRiwayatPage(kategori: state.extra as String)),
      GoRoute(
          path: '/checkout_additional_time',
          name: 'checkout_additional_time',
          builder: (context, state) =>
              CheckoutAdditionalTimePage(transaksi: state.extra as Transaksi)),
      GoRoute(
          path: '/checkout_obat_chat',
          name: 'checkout_obat_chat',
          builder: (context, state) =>
              CheckOutObatChatPage(obat: state.extra as List<Obat>)),
    ], initialLocation: '/login', debugLogDiagnostics: false);
