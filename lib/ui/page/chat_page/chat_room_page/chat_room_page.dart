import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';

class ChatRoomPage extends ConsumerStatefulWidget {
  final Transaksi transaksi;

  const ChatRoomPage({super.key, required this.transaksi});

  @override
  ConsumerState<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends ConsumerState<ChatRoomPage> {
@override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}