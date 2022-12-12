import 'package:flutter/material.dart';
import 'package:jobportal/UI/Screens/locator.dart';
import 'package:jobportal/UI/base_viewmodel.dart';
import 'package:jobportal/core/model/job_class.dart';
import 'package:jobportal/core/services/auth_service.dart';
import 'package:jobportal/core/services/database_service.dart';

class JobPostViewModel extends BaseViewModel {
  final authService = locator<AuthService>();
  final dbService = locator<DatabaseService>();
  final job = Job();
  bool? isInternship = false;
  bool? isRemote = false;
  bool loading = false;

  toggleJobType() {
    isInternship = !isInternship!;
    job.jobType = isInternship;
    notifyListeners();
  }

  toggleIsRemote() {
    isRemote = !isRemote!;
    job.isRemote = isRemote;
    notifyListeners();
  }

  postAJob() async {
    loading = true;
    job.userId = authService.userProfile.id;
    job.companyName = authService.userProfile.name;
    job.imageUrl = authService.userProfile.imageUrl;
    debugPrint('${job.toJson()}');
    await dbService.addJob(job);
    loading = false;
  }

  /// COMPANY NAME
}
