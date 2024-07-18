import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/domain/usecase/update_transaksi/update_transaksi.dart';
import 'package:super_app_telemedicine/domain/usecase/update_transaksi/update_transaksi_param.dart';
import 'package:super_app_telemedicine/ui/extension/build_context_extension.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/chat_room_page/attachment_item.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/chat_room_page/catetan_dokter_card.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/chat_room_page/chat_rekam_medis_card.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/chat_room_page/chat_rekam_medis_page.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';
import 'package:super_app_telemedicine/ui/provider/transaksi_data/transaksi_data_provider.dart';
import 'package:super_app_telemedicine/ui/provider/user_data/additional_duration_provider.dart';
import 'package:super_app_telemedicine/ui/provider/user_data/user_data_provider.dart';
import 'package:path/path.dart' as path;

import '../../../provider/usecase/update_transaksi_provider.dart';

class ChatRoomPage extends ConsumerStatefulWidget {
  final Transaksi transaksi;

  const ChatRoomPage({super.key, required this.transaksi});

  @override
  ConsumerState<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends ConsumerState<ChatRoomPage>
    with WidgetsBindingObserver {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  final ImagePicker _picker = ImagePicker();
  List<Map<String, dynamic>> messages = [];
  bool isChatEnabled = true;
  bool isAttachmentVisible = false;
  bool isKeyboardVisible = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Add this line

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });

    _focusNode.addListener(() {
      setState(() {
        isKeyboardVisible = _focusNode.hasFocus;
        if (isKeyboardVisible) {
          isAttachmentVisible = false;
          // _scrollToBottom();
        }
      });
    });

    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(durationProvider.notifier).resetDuration();
    });

    if (_timer == null) {
      startTimer(ref);
    }

    addInitialMessage();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _focusNode.dispose();
    _chatController.dispose();
    _scrollController.dispose();
    WidgetsBinding.instance.removeObserver(this); // Add this line
    super.dispose();
  }

  Future<void> fetchMessages() async {
    final CollectionReference messagesCollection = FirebaseFirestore.instance
        .collection('chats/${widget.transaksi.id}/messages');

    QuerySnapshot querySnapshot = await messagesCollection.get();
    setState(() {
      messages = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  void startTimer(WidgetRef ref) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final duration = ref.watch(durationProvider);

      if (mounted && duration > 0) {
        ref.read(durationProvider.notifier).extendDuration(-1);
      }

      if (duration == 0) {
        setState(() {
          isChatEnabled = false;
        });
        timer.cancel();
      } else if (duration == 60 * 3) {
        showReminderTimePopup();
      }
    });
  }

  @override
  void didChangeMetrics() {
    if (_focusNode.hasFocus) {
      _scrollToBottom();
    }
  }

  void showReminderTimePopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Pengingat Waktu",
            style: TextStyle(fontSize: 20),
          ),
          content: const Text(
              "Waktu konsultasi tersisa 5 menit lagi, apakah anda ingin menambah durasi waktu konsultasi?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Tidak"),
            ),
            TextButton(
              onPressed: () {
                ref.read(routerProvider).pushNamed('checkout_additional_time',
                    extra: widget.transaksi);
                Navigator.of(context).pop();
              },
              child: const Text("Ya"),
            ),
          ],
        );
      },
      barrierDismissible: false,
    );
  }

  void showExtendTimePopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Perpanjang Durasi Waktu",
            style: TextStyle(fontSize: 20),
          ),
          content:
              const Text("Apakah anda ingin menambah durasi waktu konsultasi?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Tidak"),
            ),
            TextButton(
              onPressed: () {
                ref.read(routerProvider).pushNamed('checkout_additional_time',
                    extra: widget.transaksi);
                Navigator.of(context).pop();
              },
              child: const Text("Ya"),
            ),
          ],
        );
      },
      barrierDismissible: false,
    );
  }

  void showReminderPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Pengingat Waktu"),
          content: const Text(
              "Waktu konsultasi tersisa 5 menit lagi, Apakah anda ingin menambah durasi waktu konsultasi"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
      barrierDismissible: false,
    );
  }

  void sendMessage() async {
    if (_chatController.text.isEmpty) return;

    String time = DateFormat('HH:mm').format(DateTime.now());
    Map<String, dynamic> message = {
      'text': _chatController.text,
      'sender': 'user',
      'time': time
    };

    setState(() {
      messages.add(message);
      _chatController.clear();
    });

    await saveMessageToFirestore(message);
    _scrollToBottom();
    handleResponse();
  }

  Future<void> addInitialMessage() async {
    String time = DateFormat('HH:mm').format(DateTime.now());
    await Future.delayed(const Duration(seconds: 1));

    Map<String, dynamic> message = {
      'text':
          'Halo, saya ${widget.transaksi.dokter!.nama} ada yang bisa saya bantu?',
      'sender': 'doctor',
      'time': time
    };

    setState(() {
      messages.add(message);
    });

    await saveMessageToFirestore(message);
  }

  Future<void> handleResponse() async {
    if (messages.isEmpty) {
      return;
    }

    String userMessage =
        messages.last.containsKey('text') ? messages.last['text'] ?? '' : '';
    String time = DateFormat('HH:mm').format(DateTime.now());

    await Future.delayed(const Duration(seconds: 15));

    if (!mounted) return;

    // Menyimpan tugas asinkron di luar setState
    Map<String, dynamic>? messageToAdd;
    if (userMessage.toLowerCase().contains('gatal-gatal')) {
      messageToAdd = {
        'text': 'Sudah berapa lama Anda mengalami gejala gatal-gatal ini?',
        'sender': 'doctor',
        'time': time
      };
    } else if (userMessage.toLowerCase().contains('satu minggu')) {
      messageToAdd = {
        'text':
            'Apakah sebelumnya Anda pernah mengalami alergi atau kondisi kulit lainnya?',
        'sender': 'doctor',
        'time': time
      };
    } else if (userMessage.toLowerCase().contains('alergi makanan')) {
      messageToAdd = {
        'text':
            'Bisa tolong difotokan area yang gatal tersebut supaya saya bisa melihat kondisinya?',
        'sender': 'doctor',
        'time': time
      };
    } else if (messages.last.containsKey('image')) {
      messageToAdd = {
        'text':
            'Dari gambaran awal, kemungkinan besar ini adalah alergi. Apakah Anda sudah pernah konsultasi ke dokter terkait gatal-gatal yang mungkin pernah terjadi sebelumnya?',
        'sender': 'doctor',
        'time': time
      };
    } else if (messages.last.containsKey('transaksi')) {
      messageToAdd = {
        'text':
            'Dari catatan medis, terlihat bahwa Anda memiliki riwayat dermatitis kontak. Apakah ada perubahan produk perawatan kulit atau bahan yang sering Anda sentuh akhir-akhir ini?',
        'sender': 'doctor',
        'time': time
      };
    }

    // Tambahkan pesan ke messages jika messageToAdd tidak null
    if (messageToAdd != null) {
      setState(() {
        messages.add(messageToAdd!);
      });
      await saveMessageToFirestore(messageToAdd); // Simpan pesan ke Firestore
      _scrollToBottom();
    }

    // Delay dan pesan tambahan setelahnya
    if (userMessage.toLowerCase().contains('sabun cuci piring')) {
      await Future.delayed(const Duration(seconds: 6));
      Map<String, dynamic> message = {
        'text':
            'Kemungkinan besar, bahan kimia dalam sabun cuci piring tersebut dapat menyebabkan reaksi alergi pada kulit Anda yang sensitif. Saya sarankan Anda berhenti menggunakan sabun tersebut untuk sementara dan lihat apakah gejalanya berkurang.',
        'sender': 'doctor',
        'time': time
      };
      setState(() {
        messages.add(message);
      });
      await saveMessageToFirestore(message);
      _scrollToBottom();

      await Future.delayed(const Duration(seconds: 6));
      Map<String, dynamic> message2 = {
        'text': 'Adakah pertanyaan lain yang ingin Anda tanyakan?',
        'sender': 'doctor',
        'time': time
      };
      setState(() {
        messages.add(message2);
      });
      await saveMessageToFirestore(message2);
      _scrollToBottom();
    }

    // Delay dan pesan tambahan setelahnya
    if (userMessage.toLowerCase().contains('terima kasih')) {
      await Future.delayed(const Duration(seconds: 8));
      Map<String, dynamic> message = {
        'text':
            'Baik saya akan coba mengirim catetan medis dan obat yang diperlukan.',
        'sender': 'doctor',
        'time': time
      };
      setState(() {
        messages.add(message);
      });
      await saveMessageToFirestore(message);
      _scrollToBottom();
      await Future.delayed(const Duration(seconds: 1));
      // Kirim resep obat
      Map<String, dynamic> message2 = {
        'catatan': 'test',
        'sender': 'doctor',
        'time': time,
      };
      setState(() {
        messages.add(message2);
      });
      await saveMessageToFirestore(message2);
      _scrollToBottom();
    }
  }

  Future<String> uploadImage(File image) async {
    String fileName = path.basename(image.path);
    Reference storageRef =
        FirebaseStorage.instance.ref().child('images/$fileName');
    UploadTask uploadTask = storageRef.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  Future<void> saveMessageToFirestore(Map<String, dynamic> message) async {
    // add timestamp to message
    message['timestamp'] = FieldValue.serverTimestamp();

    await FirebaseFirestore.instance
        .collection('chats')
        .doc(widget.transaksi.id)
        .collection('messages')
        .add(message);
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      String time = DateFormat('HH:mm').format(DateTime.now());
      File imageFile = File(image.path);
      String imageUrl = await uploadImage(imageFile);

      setState(() {
        messages.add({
          'image': imageUrl,
          'sender': 'user',
          'time': time,
        });
      });

      await saveMessageToFirestore({
        'image': imageUrl,
        'sender': 'user',
        'time': time,
      });

      _scrollToBottom();
      handleResponse();
    }
  }

  Future<void> _takeImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      String time = DateFormat('HH:mm').format(DateTime.now());
      File imageFile = File(image.path);
      String imageUrl = await uploadImage(imageFile);

      setState(() {
        messages.add({
          'image': imageUrl,
          'sender': 'user',
          'time': time,
        });
      });
      await saveMessageToFirestore({
        'image': imageUrl,
        'sender': 'user',
        'time': time,
      });

      _scrollToBottom();
      handleResponse();
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        String time = DateFormat('HH:mm').format(DateTime.now());
        messages.add({
          'file': file,
          'sender': 'user',
          'time': time,
        });
      });
      _scrollToBottom();
      handleResponse();
    }
  }

  void showAttachmentOptions() {
    setState(() {
      isAttachmentVisible = !isAttachmentVisible;
      if (isAttachmentVisible) {
        _focusNode.unfocus();
      } else {
        _focusNode.requestFocus();
      }
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  void _confirmStopChat() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              const Text("Konfirmasi Selesai", style: TextStyle(fontSize: 20)),
          content:
              const Text("Apakah Anda yakin ingin mengakhiri sesi chat ini?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Tidak"),
            ),
            TextButton(
              onPressed: () async {
                ref
                    .read(durationProvider.notifier)
                    .setDuration(0); // Ubah durasi menjadi 0
                setState(() {
                  isChatEnabled = false;
                  isAttachmentVisible = false;
                });
                final transaksi = widget.transaksi.copyWith(status: 'selesai');

                UpdateTransaksi updateTransaksi =
                    ref.read(updateTransaksiProvider);

                await updateTransaksi(
                        UpdateTransaksiParam(transaksi: transaksi))
                    .then((result) {
                  switch (result) {
                    case Success(value: _):
                      ref
                          .read(transaksiDataProvider.notifier)
                          .refreshTransaksiData();
                      ref.read(userDataProvider.notifier).refreshUserData();
                    case Failed(:final message):
                      context.showSnackBar(message);
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text("Ya"),
            ),
          ],
        );
      },
      barrierDismissible: false,
    );
  }

  void _openImage(BuildContext context, File imageFile) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: PhotoView(
              imageProvider: FileImage(imageFile),
            ),
          ),
        ),
      ),
    );
  }

  void addSelectedTransaksi(List<Transaksi> selectedTransaksi) {
    setState(() {
      String time = DateFormat('HH:mm').format(DateTime.now());
      for (var transaksi in selectedTransaksi) {
        messages.add({
          'transaksi': transaksi,
          'sender': 'user',
          'time': time,
        });
      }
    });
    _scrollToBottom();
    handleResponse();
  }

  @override
  Widget build(BuildContext context) {
    final duration = ref.watch(durationProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom:
                  BorderSide(color: Colors.grey.withOpacity(0.3), width: 1.0),
            ),
          ),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () =>
                      ref.read(routerProvider).goNamed('main', extra: 3)),
            ),
            elevation: 2,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: widget.transaksi.dokter!.gambar == null ||
                          widget.transaksi.dokter!.gambar!.isEmpty
                      ? widget.transaksi.dokter!.jenisKelamin == 'Laki-laki'
                          ? const AssetImage(
                              'assets/default_profile_doctor_male.png')
                          : const AssetImage(
                              'assets/default_profile_doctor_female.png')
                      : NetworkImage(widget.transaksi.dokter!.gambar!)
                          as ImageProvider,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.transaksi.dokter!.nama,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Online',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              if (isChatEnabled)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: TextButton(
                    onPressed: _confirmStopChat,
                    child: const Text("Selesai"),
                  ),
                ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                if (duration > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 1, bottom: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Durasi waktu: ${duration ~/ 60}:${(duration % 60).toString().padLeft(2, '0')}'),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: showExtendTimePopup,
                          child: const Text(
                            'Tambah durasi',
                            style: TextStyle(color: primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                Expanded(
                  child: GestureDetector(
                    // onTap: () {
                    //   setState(() {
                    //     isAttachmentVisible = false;
                    //     _focusNode.unfocus();
                    //   });
                    // },
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.only(bottom: 0),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        if (messages[index].containsKey('transaksi')) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 12),
                            child: ChatRekamMedisCard(
                              transaksi: messages[index]['transaksi'],
                              showCheckbox: false,
                              onChanged: (bool? value) {
                                if (value == true) {
                                } else {}
                              },
                            ),
                          );
                        }
                        if (messages[index].containsKey('catatan')) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 12),
                            child: CatetanDokerCard(),
                          );
                        }
                        return Align(
                          alignment: messages[index]['sender'] == 'user'
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.6),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: messages[index]['sender'] == 'user'
                                  ? Colors.blue[100]
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (messages[index].containsKey('text'))
                                  SelectableText(messages[index]['text'] ?? ''),
                                if (messages[index].containsKey('image'))
                                  GestureDetector(
                                    onTap: () => _openImage(context,
                                        File(messages[index]['image'])),
                                    child: Image.network(
                                      messages[index]['image'],
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                if (messages[index].containsKey('file'))
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.insert_drive_file,
                                          color: Colors.white),
                                      const SizedBox(height: 5),
                                      Text(
                                        messages[index]['file']
                                            .path
                                            .split('/')
                                            .last,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                const SizedBox(height: 5),
                                Text(
                                  messages[index]['time'] ?? '',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey[800]),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (isChatEnabled)
                  Padding(
                    padding: EdgeInsets.only(
                        top: 6.0,
                        bottom: isAttachmentVisible
                            ? 300
                            : isKeyboardVisible
                                ? 0
                                : 24.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.attach_file),
                          onPressed: showAttachmentOptions,
                        ),
                        Expanded(
                          child: TextField(
                            focusNode: _focusNode,
                            controller: _chatController,
                            decoration: InputDecoration(
                              hintText: "Ketik pesan...",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                            ),
                            maxLines: null,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: sendMessage,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          if (isAttachmentVisible)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.grey[200],
                height: 300,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 3,
                  children: [
                    attachmentItem(
                        icon: Icons.camera_alt,
                        label: 'Kamera',
                        onTap: _takeImageFromCamera),
                    attachmentItem(
                        icon: Icons.image,
                        label: 'Galeri',
                        onTap: _pickImageFromGallery),
                    attachmentItem(
                        icon: Icons.attach_file,
                        label: 'File',
                        onTap: _pickFile),
                    attachmentItem(
                        icon: Icons.medical_information,
                        label: 'Riwayat Rekam Medis',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChatRekamMedisPage(
                                onSelectedTransaksi: addSelectedTransaksi,
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
