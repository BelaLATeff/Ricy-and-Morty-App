class CharacterInfo {
  int? count;
  int? pages;
  String? next;
  String? prev;

  CharacterInfo({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });
  CharacterInfo.fromJson(Map<String, dynamic> json) {
    count = json['count']?.toInt();
    pages = json['pages']?.toInt();
    next = json['next']?.toString();
    prev = json['prev']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['pages'] = pages;
    data['next'] = next;
    data['prev'] = prev;
    return data;
  }
}
