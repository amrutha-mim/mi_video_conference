// Flutter インポート:
import 'package:flutter/material.dart';
import 'package:video_conference/home_page.dart';

// パッケージ インポート:
import 'package:zego_uikit/zego_uikit.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';

void main() {
  // Flutter バインディングを確認:
  WidgetsFlutterBinding.ensureInitialized();

  // ZegoUIKit の初期化とログの設定:
  ZegoUIKit().initLog().then((value) {
    // アプリを実行し、Amplify を設定:
    runApp(const MyApp());
    _configureAmplify();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MaterialApp を返す:
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

Future<void> _configureAmplify() async {
  // アプリに DataStore プラグインを追加するために以下の行を追加:
  Amplify.addPlugin(AmplifyAPI());
  final datastorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
  await Amplify.addPlugin(datastorePlugin);

  try {
    // Amplify を構成:
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    safePrint(
        'Amplify を再構成しようとしました。これは Android でアプリが再起動した場合に発生する可能性があります。');
  }
}
