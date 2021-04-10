class ContactModel {
  final String name;
  final String phoneNumber;
  final String profilePicUrl;
  final List<Status> userStatus;
  final List<Message> messages;
  final String lastSeen;

  ContactModel({
    required this.name,
    required this.phoneNumber,
    required this.profilePicUrl,
    required this.userStatus,
    required this.messages,
    required this.lastSeen,
  });

  @override
  String toString() {
    return name;
  }
}

class Status {
  final String statusPicUrl;
  final String timeAdded;
  final String statusCaption;
  final int viewedBy;

  Status({
    required this.statusPicUrl,
    required this.timeAdded,
    required this.statusCaption,
    required this.viewedBy,
  });
}

class Message {
  final String text;
  final bool makedAsUnread;
  final bool wasReceived;
  final bool wasSent;
  final String receivedFrom;

  Message({
    required this.text,
    required this.makedAsUnread,
    required this.wasReceived,
    required this.wasSent,
    required this.receivedFrom,
  });
}
