class OrderTimer {
  OrderTimer({
      this.minutes, 
      this.seconds,});

  OrderTimer.fromJson(dynamic json) {
    minutes = json['minutes'];
    seconds = json['seconds'];
  }
  int? minutes;
  int? seconds;
OrderTimer copyWith({  int? minutes,
  int? seconds,
}) => OrderTimer(  minutes: minutes ?? this.minutes,
  seconds: seconds ?? this.seconds,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['minutes'] = minutes;
    map['seconds'] = seconds;
    return map;
  }

}