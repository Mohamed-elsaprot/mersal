class Open {
  Open({
      this.endTime, 
      this.startTime, 
      this.isOpen,});

  Open.fromJson(dynamic json) {
    endTime = json['end_time'];
    startTime = json['start_time'];
    isOpen = json['is_open'];
  }
  String? endTime;
  String? startTime;
  bool? isOpen;
Open copyWith({  String? endTime,
  String? startTime,
  bool? isOpen,
}) => Open(  endTime: endTime ?? this.endTime,
  startTime: startTime ?? this.startTime,
  isOpen: isOpen ?? this.isOpen,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['end_time'] = endTime;
    map['start_time'] = startTime;
    map['is_open'] = isOpen;
    return map;
  }

}