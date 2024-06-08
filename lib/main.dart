import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

const appId = '67139c6ee41f4058965e1e7e9ecc9508';
String channelName = 'flutter';
String token = '007eJxTYBCX/qomvrbhxImJ5aqr96wU4A16KzOHJfvzWcXHLNb2q+8rMJiZGxpbJpulppoYppkYmFpYmpmmGqaap1qmJidbmhpYvBFOSWsIZGQoYdBmZGSAQBCfnSEtp7SkJLWIgQEALCYeig==';
int uid = 1;


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
        appId: appId,
        channelName: channelName,
        tempToken: token,
        uid: uid,
    ),
    agoraChannelData: AgoraChannelData(
        channelProfileType: ChannelProfileType.channelProfileLiveBroadcasting,
        clientRoleType: ClientRoleType.clientRoleAudience,
    ),
);

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  //Build
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Agora Testing'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.floating,
                enableHostControls: true, 
              ),
              AgoraVideoButtons(
                client: client,
              ),
            ],
          ),
        ),
      ),
    );
  }
}