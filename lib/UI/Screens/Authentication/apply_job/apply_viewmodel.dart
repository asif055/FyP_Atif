import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobportal/UI/Screens/locator.dart';
import 'package:jobportal/UI/base_viewmodel.dart';
import 'package:jobportal/core/enums.dart';
import 'package:jobportal/core/model/job_class.dart';
import 'package:jobportal/core/services/auth_service.dart';
import 'package:jobportal/core/services/database_service.dart';

class ApplyToJobVM extends BaseViewModel {
  final authService = locator<AuthService>();
  final dbService = locator<DatabaseService>();

  applyForJob(Job job) async {
    setState(ViewState.busy);

    if (job.applicants == null) {
      job.applicants = [];
      job.applicants!.add(authService.userProfile);
    } else {
      job.applicants!.add(authService.userProfile);
    }
    debugPrint('Job: ${job.companyName} ${job.applicants!.length}');
    await dbService.updateJob(job);

    setState(ViewState);
    Get.back();
  }
}
