class Language {
  Language({
      this.id, 
      this.name, 
      this.locale, 
      this.isDefault,});

  Language.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    locale = json['locale'];
    isDefault = json['is_default'];
  }
  num? id;
  String? name;
  String? locale;
  bool? isDefault;
Language copyWith({  num? id,
  String? name,
  String? locale,
  bool? isDefault,
}) => Language(  id: id ?? this.id,
  name: name ?? this.name,
  locale: locale ?? this.locale,
  isDefault: isDefault ?? this.isDefault,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['locale'] = locale;
    map['is_default'] = isDefault;
    return map;
  }

}