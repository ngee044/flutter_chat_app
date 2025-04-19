import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/kakao_app_bar.dart';
import '../widgets/kakao_chat_bubble.dart';
import '../widgets/kakao_chat_input.dart';

class ChatRoomScreen extends ConsumerStatefulWidget {
  final String roomId;
  final String roomName;
  const ChatRoomScreen({
    super.key,
    required this.roomId,
    required this.roomName,
  });

  @override
  ConsumerState<ChatRoomScreen> createState() => _ChatRoomState();
}

class _ChatRoomState extends ConsumerState<ChatRoomScreen> {
  final _controller = TextEditingController();
  late final CollectionReference messagesRef;

  @override
  void initState() {
    super.initState();
    messagesRef = FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(widget.roomId)
        .collection('messages');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KakaoAppBar(
        titleText: widget.roomName,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: messagesRef.orderBy('timestamp').snapshots(),
              builder: (context, snap) {
                if (!snap.hasData) return const SizedBox.shrink();
                final docs = snap.data!.docs;
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: docs.length,
                  itemBuilder: (context, i) {
                    final m = docs[i].data() as Map<String, dynamic>;
                    final isMe =
                        m['senderId'] == FirebaseAuth.instance.currentUser?.uid;
                    return KakaoChatBubble(text: m['text'] ?? '', isMe: isMe);
                  },
                );
              },
            ),
          ),
          KakaoChatInput(
            controller: _controller,
            onSend: _handleSend,
          ),
        ],
      ),
    );
  }

  Future<void> _handleSend(String text) async {
    if (text.trim().isEmpty) return;
    _controller.clear();

    await messagesRef.add({
      'text': text,
      'senderId': FirebaseAuth.instance.currentUser!.uid,
      'timestamp': FieldValue.serverTimestamp(),
    });

    // 채팅방 목록 갱신용 metadata
    await FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(widget.roomId)
        .update({
      'lastMessage': text,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
}
