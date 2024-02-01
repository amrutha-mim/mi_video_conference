// Flutterのインポート:
import 'package:flutter/material.dart';
import 'package:video_conference/constants.dart';

// パッケージのインポート:
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

// プロジェクトのインポート:
import 'common.dart';

import 'models/Comments.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

// ビデオ会議ページ
class VideoConferencePage extends StatefulWidget {
  final String conferenceID;

  // コンストラクタ
  const VideoConferencePage({
    Key? key,
    required this.conferenceID,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => VideoConferencePageState();
}

// ビデオ会議ページのステート
class VideoConferencePageState extends State<VideoConferencePage> {
  // Zegoビデオ会議コントローラー
  final controller = ZegoUIKitPrebuiltVideoConferenceController();
  // チャット入力のためのテキスト編集コントローラー
  final TextEditingController chatInputController = TextEditingController();

  // UIのためのビルドメソッド
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // 拡張されたビデオ会議ウィジェット
          Expanded(
            child: ZegoUIKitPrebuiltVideoConference(
              appID: 195057011,
              appSign: '335ff60edc3a641a13b02338902387ee02f06d3a874b114f4c61b90b41e7781b',
              userID: localUserID,
              userName: 'user_$localUserID',
              conferenceID: widget.conferenceID,
              controller: controller,
              config: ZegoUIKitPrebuiltVideoConferenceConfig()
                ..avatarBuilder = customAvatarBuilder,
            ),
          ),
        ],
      ),
    );
  }
}
