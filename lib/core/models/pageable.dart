class Pageable {
  List<dynamic> content;
  Map<String, dynamic> pageable;
  int totalPages;
  int number;

  Pageable({
    required this.content,
    required this.pageable,
    required this.totalPages,
    required this.number,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) {
    return Pageable(
      content: json["content"] as List,
      pageable: json["pageable"],
      totalPages: json["totalPages"],
      number: json["number"],
    );
  }
}
