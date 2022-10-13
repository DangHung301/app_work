class NameJobsResponse {
  String? id;
  String? name;
  String? details;
  String? createdat;
  String? updatedat;

  NameJobsResponse({this.id, this.name, this.details, this.createdat, this.updatedat});

  NameJobsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['details'] = details;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}
