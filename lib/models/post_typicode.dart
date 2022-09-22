class PostTypicode {
  final int id;
  final String title;
  final String body;
  final int userId;

  PostTypicode({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory PostTypicode.fromJson(dynamic json) {
    return PostTypicode(
      id: json['id']! as int,
      title: json['title']! as String,
      body: json['body']! as String,
      userId: json['userId']! as int,
    );
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.title}, ${this.body}, ${this.userId} }';
  }
}
