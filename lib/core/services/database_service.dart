import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jobportal/core/model/job_class.dart';
import 'package:jobportal/core/model/user.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;

  registerUser(UserProfile userProfile) async {
    try {
      await _db
          .collection('users')
          .doc(userProfile.id)
          .set(userProfile.toJson());
    } catch (error, stacktrace) {
      debugPrint('Error: $error\nStacktrace: $stacktrace');
    }
  }

  getUser(id) async {
    try {
      final snapshot = await _db.collection('users').doc(id).get();
      return UserProfile.fromJson(snapshot.data()!, snapshot.id);
    } catch (error) {
      debugPrint('Error: $error');
    }
  }

  // Future<List<Task>> getCompletedTasks(String userId) async {
  //   List<Task> tasks = [];
  //   try {
  //     QuerySnapshot snapshot = await _db
  //         .collection('tasks')
  //         .where('userId', isEqualTo: userId)
  //         .where('isDone', isEqualTo: true)
  //         .get();
  //     if (snapshot.docs.isEmpty) {
  //       debugPrint('No Data Found');
  //     } else {
  //       for (int i = 0; i < snapshot.docs.length; i++) {
  //         tasks
  //             .add(Task.fromJson(snapshot.docs[i].data(), snapshot.docs[i].id));
  //       }
  //     }
  //   } catch (error) {
  //     debugPrint('Error: $error');
  //   }
  //   return tasks;
  // }

  // Future<List<Task>> getTasksToDo(String userId) async {
  //   List<Task> tasks = [];
  //   try {
  //     QuerySnapshot snapshot = await _db
  //         .collection('tasks')
  //         .where('userId', isEqualTo: userId)
  //         .where('isDone', isEqualTo: false)
  //         .get();
  //     if (snapshot.docs.isEmpty) {
  //       debugPrint('No Data Found');
  //     } else {
  //       for (int i = 0; i < snapshot.docs.length; i++) {
  //         tasks
  //             .add(Task.fromJson(snapshot.docs[i].data(), snapshot.docs[i].id));
  //       }
  //     }
  //   } catch (error) {
  //     debugPrint('Error: $error');
  //   }
  //   return tasks;
  // }

  updateFcmToken(fcmToken, userId) async {
    await _db.collection('users').doc(userId).update({'fcmToken': fcmToken});
  }

  // addTask(Task task) async {
  //   debugPrint('@Adding Task');
  //   try {
  //     await _db.collection('tasks').add(task.toJson());
  //     debugPrint('-- Task Added Successfully --');
  //   } catch (error) {
  //     debugPrint('Error: $error');
  //   }
  // }

  addJob(Job job) async {
    debugPrint('@dbService/addJob');
    try {
      await _db.collection('jobs').add(job.toJson());
      debugPrint('@dbService/addJob: Job added successfully');
    } catch (error) {
      debugPrint('@dbService/addJob failed: $error');
    }
  }

  Future<List<Job>> getPostedJobs(String userId) async {
    List<Job> jobs = [];
    try {
      QuerySnapshot snapshot =
          await _db.collection('jobs').where('userId', isEqualTo: userId).get();
      if (snapshot.docs.isEmpty) {
        debugPrint('@dbService/getJobs: No Jobs Yet');
      } else {
        for (int i = 0; i < snapshot.docs.length; i++) {
          jobs.add(Job.fromJson(snapshot.docs[i].data(), snapshot.docs[i].id));
        }
      }
    } catch (error) {
      debugPrint('@dbService/getJobs failed: $error');
    }
    return jobs;
  }

  Future<List<Job>> getInternships() async {
    List<Job> jobs = [];
    try {
      QuerySnapshot snapshot =
          await _db.collection('jobs').where('jobType', isEqualTo: true).get();
      if (snapshot.docs.isEmpty) {
        debugPrint('@dbService/getJobs: No Internships Yet');
      } else {
        for (int i = 0; i < snapshot.docs.length; i++) {
          jobs.add(Job.fromJson(snapshot.docs[i].data(), snapshot.docs[i].id));
        }
      }
    } catch (error) {
      debugPrint('@dbService/getJobs failed: $error');
    }
    return jobs;
  }

  Future<List<Job>> getRemoteJob() async {
    List<Job> jobs = [];
    try {
      QuerySnapshot snapshot =
          await _db.collection('jobs').where('isRemote', isEqualTo: true).get();
      if (snapshot.docs.isEmpty) {
        debugPrint('@dbService/getJobs: No Internships Yet');
      } else {
        for (int i = 0; i < snapshot.docs.length; i++) {
          jobs.add(Job.fromJson(snapshot.docs[i].data(), snapshot.docs[i].id));
        }
      }
    } catch (error) {
      debugPrint('@dbService/getJobs failed: $error');
    }
    return jobs;
  }

  Future<List<Job>> getAllJobs() async {
    List<Job> jobs = [];
    try {
      QuerySnapshot snapshot = await _db.collection('jobs').get();
      if (snapshot.docs.isEmpty) {
        debugPrint('@dbService/getJobs: No Jobs Yet');
      } else {
        for (int i = 0; i < snapshot.docs.length; i++) {
          jobs.add(Job.fromJson(snapshot.docs[i].data(), snapshot.docs[i].id));
        }
      }
    } catch (error) {
      debugPrint('@dbService/getJobs failed: $error');
    }
    return jobs;
  }

  updateJob(Job job) async {
    try {
      await _db
          .collection('jobs')
          .doc(job.id)
          .update(job.toJson())
          .then((value) => debugPrint('Application Successfull!'));
    } catch (error) {
      debugPrint('@dbService/updateJob failed: $error');
    }
  }

  Future<void> deleteJob(jobId) {
    CollectionReference tasks = FirebaseFirestore.instance.collection('jobs');
    return tasks
        .doc(jobId)
        .delete()
        .then((value) => debugPrint("Job Deleted"))
        .catchError((error) => debugPrint("Failed to delete Job: $error"));
  }

//   CollectionReference users = FirebaseFirestore.instance.collection('users');

// Future<void> updateUser() {
//   return users
//     .doc('ABC123')
//     .update({'info.address.zipcode': 90210})
//     .then((value) => print("User Updated"))
//     .catchError((error) => print("Failed to update user: $error"));
// }

  updateTask(bool isDone, taskId) async {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

    await tasks.doc(taskId).update({'isDone': isDone});
    debugPrint('Task Updated Successfully with value $isDone');
  }

  Future<void> deleteTask(taskId) {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    return tasks
        .doc(taskId)
        .delete()
        .then((value) => debugPrint("Task Deleted"))
        .catchError((error) => debugPrint("Failed to delete task: $error"));
  }
}
