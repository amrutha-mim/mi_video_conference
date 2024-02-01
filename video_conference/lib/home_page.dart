// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

import 'package:video_conference/video_conference_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 同じconferenceIDを使用するユーザーは同じ会議に参加できます。
  var conferenceDTextCtrl = TextEditingController(text: 'video_conference_id');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: conferenceDTextCtrl,
              decoration: const InputDecoration(
                  labelText: 'IDを使って参加する'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return VideoConferencePage(
                        conferenceID: conferenceDTextCtrl.text.trim(),
                      );
                    }),
                  );
                },
                child: const Text('参加する'))
          ],
        ),
      ),
    );
  }
}
