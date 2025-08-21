import 'package:flutter/material.dart';
import 'package:meetly/resources/auth_methods.dart';
import 'package:meetly/resources/jitsi_meet_methods.dart';
import 'package:meetly/utils/colors.dart';
import 'package:meetly/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {

  // late final JitsiMeet _jitsiMeet;

  final AuthMethods _authMethods = AuthMethods();
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  late TextEditingController meetingIdController;
  late TextEditingController nameController;

  bool isAudioMuted = true;
  bool isVideoMuted = true;


  @override
  void initState(){
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user!.displayName);
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    // JitsiMeet.removeAllListeners();
  }

  _joinMeeting(){
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text, 
      isAudioMuted: isAudioMuted, 
      isVideoMuted: isVideoMuted,
      username: nameController.text);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0,
        backgroundColor: backgroundColor,
        title: const Text('Join a Meeeting', style: TextStyle(
          fontSize: 18,

         )),
         centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(controller: meetingIdController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'Room ID',
              contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
            ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(controller: nameController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'Name',
              contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
            ),
            ),
          ),

          const SizedBox(
            height: 10,
          ),
          
          // InkWell(
          //   onTap: _joinMeeting,
          //   child: const Padding(
          //     padding: EdgeInsets.all(8),
          //     child:  Text(' Join ',
          //     style: TextStyle(
          //       fontSize: 16
          //       ),
          //     ),
          //   ),
          // ),
          Center(
            child: InkWell(
                onTap: _joinMeeting,
                borderRadius: BorderRadius.circular(8), // ripple effect matches corners
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: buttonColor, // background color
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Join',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, // text color contrast
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ),


          const SizedBox(height:20 ,),

          MeetingOption(text: 'Mute Audio', isMute: isAudioMuted, onChange: onAudioMuted ,),
          MeetingOption(text: 'Turn off my video', isMute: isVideoMuted, onChange: onVideoMuted ,)

        ],
      ),
    );
  }

  onAudioMuted(bool val){
    setState(() {
      isAudioMuted = val;
    });

  }

  onVideoMuted(bool val){
    setState(() {
      isVideoMuted = val;
    });

  }
}