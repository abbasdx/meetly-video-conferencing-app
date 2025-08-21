// ✅ Import the new Jitsi Meet SDK
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

// ✅ Import your authentication methods
import 'package:meetly/resources/auth_methods.dart';
import 'package:meetly/resources/firestore_methods.dart';
// import 'package:meetly/resources/firestore_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();

  // ✅ JitsiMeet instance (new SDK way)
  final JitsiMeet _jitsiMeet = JitsiMeet();

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      // ✅ Resolve username
      String name = username.isEmpty ? _authMethods.user!.displayName! : username;

      // ✅ Prepare meeting options (new SDK uses a Map)
      var options = JitsiMeetConferenceOptions(
        room: roomName,
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
          "resolution": 360, // 360p limit
          "prejoinPageEnabled": false,
        },
        featureFlags: {
          "welcomepage.enabled": false, // disable welcome page
        },
        userInfo: JitsiMeetUserInfo(
          displayName: name,
          email: _authMethods.user!.email,
          avatar: _authMethods.user!.photoURL,
        ),
        serverURL: "https://meet.jit.si", // or your own Jitsi server
      );

      // ✅ Save meeting history to Firestore
      _firestoreMethods.addToMeetingHistory(roomName);

      // ✅ Join meeting with new API
      await _jitsiMeet.join(options);
    } catch (error) {
      print("⚠️ Jitsi meeting error: $error");
    }
  }
}
