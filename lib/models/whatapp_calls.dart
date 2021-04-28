class WhatsappCalls {
  final String name;
  final String time;
  final String profilePicUrl;
  final bool isAudioCall;
  final bool wasReceived;
  final bool wasIncoming;

  WhatsappCalls(
      {required this.name,
      required this.time,
      required this.profilePicUrl,
      required this.isAudioCall,
      required this.wasReceived,
      required this.wasIncoming});

  @override
  String toString() {
    return name;
  }
}
