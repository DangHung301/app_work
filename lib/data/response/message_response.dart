class MessageResponse {
  String? message;

  MessageResponse(this.message);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    return data;
  }

  MessageResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}