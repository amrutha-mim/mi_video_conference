// Dartのインポート:
import 'dart:math' as math;

/// userIDはグローバルに一意である必要があります。
final String localUserID = math.Random().nextInt(10000).toString();

/// 同じcallIDを使用するユーザーは同じ通話に参加できます。
const String callID = 'group_call_id';
