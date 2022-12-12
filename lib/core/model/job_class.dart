import 'package:jobportal/core/model/user.dart';

class Job {
  String? id;
  String? title;
  String? description;
  String? requirements;
  bool? jobType;
  bool? isRemote;
  String? companyName;
  String? userId;
  String? imageUrl;
  List<UserProfile>? applicants = [];

  Job({
    this.id,
    this.title,
    this.description,
    this.requirements,
    this.jobType,
    this.isRemote,
    this.companyName,
    this.userId,
    this.imageUrl,
    this.applicants,
  });

  Job.fromJson(json, this.id) {
    title = json['title'];
    description = json['description'];
    requirements = json['requirements'];
    jobType = json['jobType'];
    isRemote = json['isRemote'];
    companyName = json['companyName'];
    userId = json['userId'];
    imageUrl = json['imageUrl'];
    if (json['applicants'] != null) {
      applicants = [];
      json['applicants'].forEach(
        (element) => applicants!.add(
          UserProfile.fromJson(element, id),
        ),
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['requirements'] = requirements;
    data['jobType'] = jobType ?? false;
    data['isRemote'] = isRemote ?? false;
    data['companyName'] = companyName;
    data['userId'] = userId;
    data['imageUrl'] = imageUrl;
    if (applicants != null) {
      data['applicants'] = applicants!.map((e) => e.toJson()).toList();
    }
    return data;
  }

  //  String company;
  // String logoURL;
  // late bool isMark;
  // String time;
  // String location;
  // String title;
}
