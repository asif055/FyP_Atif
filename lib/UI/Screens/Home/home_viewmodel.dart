import 'package:jobportal/UI/Screens/locator.dart';
import 'package:jobportal/UI/base_viewmodel.dart';
import 'package:jobportal/core/model/job_class.dart';
import 'package:jobportal/core/services/auth_service.dart';
import 'package:jobportal/core/services/database_service.dart';

class HomeViewModel extends BaseViewModel {
  final authService = locator<AuthService>();
  final dbService = locator<DatabaseService>();

  bool loading = false;
  List<Job> jobs = [];

  HomeViewModel() {
    getTasks();
  }

  getTasks() async {
    loading = true;
    if (authService.userProfile.isInstitution == true) {
      jobs = await dbService.getPostedJobs(authService.userProfile.id!);
    } else {
      jobs = await dbService.getAllJobs();
    }
    loading = false;
    notifyListeners();
  }

  removeJob(String jobId, int index) async {
    loading = true;
    await dbService.deleteJob(jobId);
    jobs.removeAt(index);
    loading = false;
    notifyListeners();
  }
}
