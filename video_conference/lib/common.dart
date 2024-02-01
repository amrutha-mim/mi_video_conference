// Flutterのインポート:
import 'package:flutter/material.dart';

// パッケージのインポート:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

// カスタムアバタービルダーのウィジェット
Widget customAvatarBuilder(
    BuildContext context,
    Size size,
    ZegoUIKitUser? user,
    Map<String, dynamic> extraInfo,
    ) {
  // キャッシュされたネットワーク画像を表示する
  return CachedNetworkImage(
    imageUrl: 'https://robohash.org/${user?.id}.png',

    // イメージビルダー：画像のプロバイダーを使用してデコレーションされた円形のコンテナを作成
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),

    // ダウンロード進捗の進捗インジケータービルダー
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        CircularProgressIndicator(value: downloadProgress.progress),

    // エラーウィジェット：ログを表示し、デフォルトのZegoAvatarウィジェットを表示
    errorWidget: (context, url, error) {
      ZegoLoggerService.logInfo(
        '$user avatar url is invalid',
        tag: 'live audio',
        subTag: 'live page',
      );
      return ZegoAvatar(user: user, avatarSize: size);
    },
  );
}
