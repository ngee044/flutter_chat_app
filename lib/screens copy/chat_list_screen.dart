import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/kakao_app_bar.dart';
import '../widgets/kakao_avatar.dart';
import '../router.dart';

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomsRef =
        FirebaseFirestore.instance.collection('chatRooms').orderBy('updatedAt', descending: true);

    return Scaffold(
      appBar: KakaoAppBar(
        titleText: '채팅',
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.chat_bubble_outline), onPressed: () {}),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: roomsRef.snapshots(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final docs = snap.data?.docs ?? [];
          if (docs.isEmpty) {
            return const Center(child: Text('채팅방이 없습니다.'));
          }
          return ListView.separated(
            itemCount: docs.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final data = docs[i].data() as Map<String, dynamic>;
              final roomId = docs[i].id;

              return ListTile(
                leading: const KakaoAvatar(size: 48), // TODO: 상대 프로필 썸네일 URL 사용
                title: Text(data['name'] ?? 'No Name',
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text(
                  data['lastMessage'] ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(
                  _formatTime(data['updatedAt']),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.chatRoom,
                    arguments: {'roomId': roomId, 'roomName': data['name']},
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  String _formatTime(Timestamp? ts) {
    if (ts == null) return '';
    final dt = ts.toDate();
    final now = DateTime.now();
    if (now.difference(dt).inDays == 0) {
      return '${dt.hour}:${dt.minute.toString().padLeft(2, '0')}';
    }
    return '${dt.month}/${dt.day}';
  }
}
