import 'dart:convert';

class ApiState {
  int? status;
  String? message;

  ApiState({this.status, this.message});

  @override
  String toString() => 'ApiState(status: $status, message: $message)';

  factory ApiState.fromMap(Map<String, dynamic> data) => ApiState(
        status: data['Status'] as int?,
        message: data['Message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Status': status,
        'Message': message,
      };

  factory ApiState.fromJson(String data) {
    return ApiState.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  ApiState copyWith({
    int? status,
    String? message,
  }) {
    return ApiState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
