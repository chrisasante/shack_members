class Post {
  int id;
  int userId;
  String? title;
  String? body;

  Post({
    required this.id,
    required this.userId,
    this.title,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        body: json["body"],
      );
}
