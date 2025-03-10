class Image {
  int id;
  String url;

  Image({
    required this.id,
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json["id"],
      url: json["url"],
    );
  }
}
