class ContentPage {
  ContentPage({
      this.defaultName, 
      this.content,});

  ContentPage.fromJson(dynamic json) {
    defaultName = json['default_name'];
    content = json['content'];
  }
  String? defaultName;
  String? content;
ContentPage copyWith({  String? defaultName,
  String? content,
}) => ContentPage(  defaultName: defaultName ?? this.defaultName,
  content: content ?? this.content,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['default_name'] = defaultName;
    map['content'] = content;
    return map;
  }

}