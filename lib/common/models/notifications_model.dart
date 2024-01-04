class NotificationsModel {
  int? id;
  String? message;
  bool? isRead;
  int? user;

  NotificationsModel({this.id, this.message, this.isRead, this.user});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    isRead = json['is_read'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['is_read'] = this.isRead;
    data['user'] = this.user;
    return data;
  }
}
