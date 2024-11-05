class UserNotesList {
  String? userName;
  List<NotesList>? data;

  UserNotesList({this.userName, this.data});

  factory UserNotesList.fromJson(Map<String, dynamic> json) => UserNotesList(
        userName: json['userName'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => NotesList.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}

class NotesList {
  int? id;
  String? title;
  String? userName;
  String? priority;
  String? details;
  String? updatedAt;

  NotesList({
    this.id,
    this.title,
    this.userName,
    this.priority,
    this.details,
    this.updatedAt,
  });

  factory NotesList.fromJson(Map<String, dynamic> json) => NotesList(
        id: json['id'] as int?,
        title: json['title'] as String?,
        userName: json['userName'] as String?,
        priority: json['priority'] as String?,
        details: json['details'] as String?,
        updatedAt: json['updatedAt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'userName': userName,
        'priority': priority,
        'details': details,
        'updatedAt': updatedAt,
      };
}
