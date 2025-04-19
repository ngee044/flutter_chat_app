import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 현재 로그인한 사용자 정보를 가져옵니다 (없으면 null)
    final currentUser = ref.watch(authProvider);
    final email = currentUser?.email ?? '사용자';

    return Scaffold(
      appBar: AppBar(
        title: Text('환영합니다, $email'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // 로그아웃 수행
              await ref.read(authProvider.notifier).signOut();
              // 모든 화면 스택 제거하고 로그인 화면으로 이동
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              );
            },
            tooltip: '로그아웃',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '채팅방 목록 화면 (TODO)',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              '여기에 채팅방 리스트를 표시합니다.',
              style: TextStyle(color: Colors.grey),
            ),
            // TODO: Firestore에서 채팅방 목록을 가져와 ListView로 표시.
            // 예: StreamBuilder<QuerySnapshot>를 사용하여 
            // FirebaseFirestore.instance.collection('chatRooms').snapshots() 구독 및 목록 표시
          ],
        ),
      ),
    );
  }
}
