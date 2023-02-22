class NotificationModel {
  final String type;
  final String title;
  final String subTitle;
  final String content;
  final String sendAt;
  final int id;
  final bool isRead;

  NotificationModel({
    required this.type,
    required this.title,
    required this.subTitle,
    required this.content,
    required this.sendAt,
    required this.id,
    required this.isRead
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    {
      return NotificationModel(
        type: json['type'],
        title: json['title'],
        subTitle: json['sub_title'],
        content: json['content'],
        sendAt: json['send_at'],
        id: json['id'],
        isRead: json['is_read'],
      );
    }
  }
}
