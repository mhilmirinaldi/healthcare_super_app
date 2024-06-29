import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/chat_room_page/attachment_item.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/chat_room_page/rekam_medis_page.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class ChatRoomPage extends ConsumerStatefulWidget {
  final Transaksi transaksi;

  const ChatRoomPage({super.key, required this.transaksi});

  @override
  ConsumerState<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends ConsumerState<ChatRoomPage> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  final ImagePicker _picker = ImagePicker();
  List<Map<String, dynamic>> messages = [];
  bool isChatEnabled = true;
  bool isAttachmentVisible = false;
  int duration = 30 * 60; // Duration in seconds
  bool isKeyboardVisible = true;

  @override
  void initState() {
    super.initState();
    startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });

    _focusNode.addListener(() {
      setState(() {
        isKeyboardVisible = _focusNode.hasFocus;
        if (isKeyboardVisible) {
          isAttachmentVisible = false;
        }
      });
    });
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted && duration > 0) {
        setState(() {
          duration -= 1;
        });
      }
      if (duration == 0) {
        setState(() {
          isChatEnabled = false;
        });
        timer.cancel();
      } else if (duration == 420) {
        showExtendTimePopup();
      } else if (duration == 300) {
        showReminderPopup();
      }
    });
  }

  void showExtendTimePopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Extend Time"),
          content: const Text("Do you want to extend the chat duration?"),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  duration += 600; // Extend time by 10 minutes
                });
                Navigator.of(context).pop();
              },
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }

  void showReminderPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Time Reminder"),
          content: const Text("5 minutes remaining"),
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
    );
  }

  void sendMessage() {
    if (_chatController.text.isEmpty) return;

    setState(() {
      String time = DateFormat('HH:mm').format(DateTime.now());
      messages
          .add({'text': _chatController.text, 'sender': 'user', 'time': time});
      if (_chatController.text.toLowerCase() == 'halo') {
        messages.add({
          'text': 'Ada yang bisa dibantu?',
          'sender': 'doctor',
          'time': time
        });
      }
      _chatController.clear();
    });
    _scrollToBottom();
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        String time = DateFormat('HH:mm').format(DateTime.now());
        messages.add({
          'image': File(image.path),
          'sender': 'user',
          'time': time,
        });
      });
      _scrollToBottom();
    }
  }

  Future<void> _takeImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        String time = DateFormat('HH:mm').format(DateTime.now());
        messages.add({
          'image': File(image.path),
          'sender': 'user',
          'time': time,
        });
      });
      _scrollToBottom();
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
          title: const Text("Konfirmasi Selesai"),
          content:
              const Text("Apakah Anda yakin ingin mengakhiri sesi chat ini?"),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  isChatEnabled = false;
                  duration = 0;
                });
                Navigator.of(context).pop();
              },
              child: const Text("Ya"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Tidak"),
            ),
          ],
        );
      },
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

  @override
  Widget build(BuildContext context) {
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
                onPressed: () => ref.read(routerProvider).pushNamed('main'),
              ),
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
                    child: Text(
                        'Durasi waktu: ${duration ~/ 60}:${(duration % 60).toString().padLeft(2, '0')}'),
                  ),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
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
                                  onTap: () => _openImage(
                                      context, messages[index]['image']),
                                  child: Image.file(
                                    messages[index]['image'],
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              if (messages[index].containsKey('file'))
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.insert_drive_file,
                                        color: Colors.white),
                                    const SizedBox(height: 5),
                                    Text(
                                      messages[index]['file']
                                          .path
                                          .split('/')
                                          .last,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              const SizedBox(height: 5),
                              Text(
                                messages[index]['time'] ?? '',
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
                        icon: Icons.history,
                        label: 'Riwayat Rekam Medis',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RekamMedisPage(),
                          ));
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
