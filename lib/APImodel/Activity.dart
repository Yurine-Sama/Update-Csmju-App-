// import 'dart:convert';

// List<Activity> activityFromJson(String str) =>
//     List<Activity>.from(json.decode(str).map((x) => Activity.fromJson(x)));

// String activityToJson(List<Activity> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Activity {
//   Activity({
//     required this.activityId,
//     required this.Activity_Start,
//     required this.Activity_TimeStart,
//     required this.Activity_TimeEnd,
//     required this.Activity_Organizer,
//     required this.Activity_Location,
//     required this.Activity_Detail,
//     required this.Activity_Title,
//     required this.Activity_Picture,
//   });

//   int activityId;
//   String Activity_Start;
//   String Activity_TimeStart;
//   String Activity_TimeEnd;
//   String Activity_Organizer;
//   String Activity_Location;
//   String Activity_Detail;
//   String Activity_Title;
//   String Activity_Picture;

//   factory Activity.fromJson(Map<String, dynamic> json) {
//     return Activity(
//       activityId: json["activityId"] as int,
//       Activity_Start: json["Activity_Start"] as String,
//       Activity_TimeStart: json["Activity_TimeStart"] as String,
//       Activity_TimeEnd: json["Activity_TimeEnd"] as String,
//       Activity_Organizer: json["Activity_Organizer"] as String,
//       Activity_Location: json["Activity_Location"] as String,
//       Activity_Detail: json["Activity_Detail"] as String,
//       Activity_Title: json["Activity_Title"] as String,
//       Activity_Picture: json["Activity_Picture"] as String,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "activityId": activityId,
//         "Activity_Start": Activity_Start,
//         "Activity_TimeStart": Activity_TimeStart,
//         "Activity_TimeEnd": Activity_TimeEnd,
//         "Activity_Organizer": Activity_Organizer,
//         "Activity_Location": Activity_Location,
//         "Activity_Detail": Activity_Detail,
//         "Activity_Title": Activity_Title,
//         "Activity_Picture": Activity_Picture,
//       };

//   static List<Activity> activitysFromSnapshot(List snapshot) {
//     return snapshot.map((data) {
//       return Activity.fromJson(data);
//     }).toList();
//   }

//   @override
//   String toString() {
//     return 'Activity {  image: $Activity_Picture, }';
//   }
// }

// //newest api

import 'dart:convert';

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

class Activity {
  Activity({
    required this.success,
    required this.data,
  });

  bool success;
  List<Datum> data;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data":
            data == null ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.organizer,
    required this.dateStart,
    required this.detail,
    required this.location,
    required this.poster,
    required this.isShow,
  });

  int id;
  String name;
  String organizer;
  DateTime dateStart;

  String detail;
  String location;
  String poster;
  bool isShow;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        organizer: json["organizer"],
        dateStart: DateTime.parse(json["date_start"]),
        detail: json["detail"],
        location: json["location"],
        poster: json["poster"],
        isShow: json["is_show"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "organizer": organizer,
        "date_start": dateStart,
        "detail": detail,
        "location": location,
        "poster": poster,
        "is_show": isShow,
      };
  static List<Activity> activitysFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Activity.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Activity {  Poster: $poster, Activity Detail: $detail, Activity name $name }';
  }
}
