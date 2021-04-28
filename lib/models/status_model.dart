abstract class StatusModel {}

class VideoStatus extends StatusModel {
  final String videoUrl;
  final String statusCaption;
  final String timeAdded;

  VideoStatus({
    required this.videoUrl,
    required this.statusCaption,
    required this.timeAdded,
  });

  @override
  String toString() {
    return videoUrl;
  }
}

class ImageStatus extends StatusModel {
  final String imageUrl;
  final String caption;
  final String timeAdded;

  ImageStatus({
    required this.imageUrl,
    required this.caption,
    required this.timeAdded,
  });
  @override
  String toString() {
    return imageUrl;
  }
}

class WrittenStatus extends StatusModel {
  final String text;
  final String caption;
  final String timeAdded;

  WrittenStatus({
    required this.text,
    required this.caption,
    required this.timeAdded,
  });
  @override
  String toString() {
    return text;
  }
}
