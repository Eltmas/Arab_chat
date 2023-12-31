import 'package:flutter/material.dart';
import 'package:ahlan_arab/utils.dart';
import 'package:uuid/uuid.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';



class VideoConferencePage extends StatelessWidget {
  final String conferenceID;
  final String? name;

  const VideoConferencePage({
    Key? key,
    required this.conferenceID, required this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userId = const Uuid().v1();

    return SafeArea(

      child: ZegoUIKitPrebuiltVideoConference(
        appID: Utils.appID,
        // Fill in the appID that you get from ZEGOCLOUD Admin // Console.
        appSign: Utils.appSign, // Fill in the appSign that you get from ZEGOCLOUD
        // Admin
        // Console.
        userID: userId,
        userName: name ?? '',
        conferenceID: conferenceID ?? '',
        config: ZegoUIKitPrebuiltVideoConferenceConfig(
          /// Customize the initial device state
          turnOnCameraWhenJoining: true,
          turnOnMicrophoneWhenJoining: true,
          useSpeakerWhenJoining: true,

          onLeaveConfirmation: (BuildContext context) async {
            return await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.blue[900]!.withOpacity(0.9),
                  title: const Text("This is your custom dialog",
                      style: TextStyle(color: Colors.white70)),
                  content: const Text(
                      "Are you sur to leave confirmation dialog",
                      style: TextStyle(color: Colors.white70)),
                  actions: [
                    ElevatedButton(
                      child: const Text("Cancel",
                          style: TextStyle(color: Colors.white70)),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),

                    ElevatedButton(
                      child: const Text("Exit"),
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ],
                );
              },
            );
          },

      ),
    ),

    );
  }
}













