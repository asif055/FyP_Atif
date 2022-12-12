import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobportal/UI/Screens/Authentication/applicants/applicants_screen.dart';
import 'package:jobportal/UI/Screens/Authentication/apply_job/apply_viewmodel.dart';
import 'package:jobportal/UI/Screens/Home/home_viewmodel.dart';
import 'package:jobportal/UI/Screens/locator.dart';
import 'package:jobportal/UI/custom_widgets/icon_text.dart';
import 'package:jobportal/core/model/job_class.dart';
import 'package:jobportal/core/services/auth_service.dart';
import 'package:provider/provider.dart';

class ApplyToJob extends StatelessWidget {
  final Job job;

  ///a constructrator
  ApplyToJob({
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplyToJobVM(),
      child: Consumer<ApplyToJobVM>(
        builder: (context, model, child) => Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15,
                top: 55,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                ///crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ///Here we use container for the icon
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: FadeInImage.assetNetwork(
                                  placeholder: "assets/images/Alamdar.jpg",
                                  image: job.imageUrl!,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),

                              ///And here we use text for the company
                              Text(
                                job.companyName ?? 'No name mentioned',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          locator<AuthService>().userProfile.isInstitution ??
                                  false
                              ? GestureDetector(
                                  child: const Text(
                                    'Applicants',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () {
                                    Get.to(
                                      () => Applicants(job: job),
                                    );
                                  },
                                )
                              : SizedBox(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        job.title ?? 'No Title Yet',
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconText(Icons.location_on_outlined,
                              job.isRemote ?? false ? 'In Office' : 'Remote'),
                          IconText(
                              Icons.access_time_outlined,
                              job.jobType ?? false
                                  ? 'Full-Time'
                                  : 'Internship'),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Job Description',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        job.description ?? 'No description mentioned',
                        style: const TextStyle(
                          wordSpacing: 2.5,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      const Text(
                        'Requirements',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // ...job.req
                      //     .map(
                      //       (e) =>
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 5,
                              width: 5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 300),
                              child: Text(
                                job.requirements ?? 'No requirements mentioned',
                                style: const TextStyle(
                                  wordSpacing: 2.5,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // )
                      // .toList(),
                      locator<AuthService>().userProfile.isInstitution ?? false
                          ? SizedBox()
                          : job.applicants != null
                              ? job.applicants!.indexWhere((element) =>
                                          element.email ==
                                          locator<AuthService>()
                                              .userProfile
                                              .email) ==
                                      -1
                                  ? Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 25),
                                      height: 45,
                                      width: double.maxFinite,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            primary:
                                                Theme.of(context).primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            )),
                                        onPressed: () {
                                          model.applyForJob(job);
                                        },
                                        child: const Text(
                                          'Apply Now',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 25),
                                      height: 45,
                                      width: double.maxFinite,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            primary: Colors.greenAccent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            )),
                                        onPressed: () {
                                          // model.applyForJob(job);
                                        },
                                        child: const Text(
                                          'Already Applied',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                              : Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 25),
                                  height: 45,
                                  width: double.maxFinite,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        primary: Colors.greenAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        )),
                                    onPressed: () {
                                      // model.applyForJob(job);
                                    },
                                    child: const Text(
                                      'Already Applied',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
