class Links {
  Links({
      this.first, 
      this.last, 
      this.prev, 
      this.next,});

  Links.fromJson(dynamic json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }
  String? first;
  String? last;
  String? prev;
  String? next;
Links copyWith({  String? first,
  String? last,
  String? prev,
  String? next,
}) => Links(  first: first ?? this.first,
  last: last ?? this.last,
  prev: prev ?? this.prev,
  next: next ?? this.next,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first'] = first;
    map['last'] = last;
    map['prev'] = prev;
    map['next'] = next;
    return map;
  }

}