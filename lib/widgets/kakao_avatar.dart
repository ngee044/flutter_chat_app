import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class KakaoAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final bool isOnline;

  const KakaoAvatar({
    super.key,
    this.imageUrl,
    this.size = 40,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(size / 2);

    Widget avatar = ClipRRect(
      borderRadius: borderRadius,
      child: imageUrl == null || imageUrl!.isEmpty
          ? Container(
              width: size,
              height: size,
              color: Colors.grey[300],
              child: Icon(Icons.person, size: size * 0.55, color: Colors.white),
            )
          : CachedNetworkImage(
              imageUrl: imageUrl!,
              width: size,
              height: size,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                width: size,
                height: size,
                color: Colors.grey[200],
              ),
              errorWidget: (_, __, ___) => Container(
                width: size,
                height: size,
                color: Colors.grey[300],
                child: Icon(Icons.error, size: size * 0.5, color: Colors.red),
              ),
            ),
    );

    if (!isOnline) return avatar;

    return Stack(
      children: [
        avatar,
        Positioned(
          right: 1,
          bottom: 1,
          child: Container(
            width: size * 0.28,
            height: size * 0.28,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: size * 0.06),
            ),
          ),
        ),
      ],
    );
  }
}