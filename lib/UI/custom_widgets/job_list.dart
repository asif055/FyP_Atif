import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobportal/UI/Screens/Authentication/apply_job/apply_job_screen.dart';
import 'package:jobportal/UI/Screens/Home/home_viewmodel.dart';
import 'package:jobportal/UI/custom_widgets/Job_item.dart';
import 'package:jobportal/UI/custom_widgets/icon_text.dart';
import 'package:jobportal/UI/custom_widgets/job_detail.dart';
import 'package:jobportal/core/model/job.dart';
import 'package:jobportal/core/services/auth_service.dart';
import 'package:jobportal/core/services/locator.dart';
import 'package:provider/provider.dart';

class JobList extends StatelessWidget {
  final joblist = Job.generateJobs();
  JobList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) => Container(
        margin: const EdgeInsets.symmetric(vertical: 25),
        height: 180,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.horizontal,
          itemCount: model.jobs.length,

          ///here i wrap the Job_Iteam to GestureDetector
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Get.to(
                () => ApplyToJob(
                  job: model.jobs[index],
                ),
              );
              // showModalBottomSheet(
              //   backgroundColor: Colors.transparent,
              //   isScrollControlled: true,
              //   context: context,
              //   builder: (conetxt) => JobDetail(
              //     job: model.jobs[index],
              //   ),
              // );
            },
            child: Container(
                width: 270,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: FadeInImage.assetNetwork(
                                placeholder: "assets/images/Alamdar.jpg",
                                image: model.jobs[index].imageUrl!,
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              model.jobs[index].companyName ?? 'No Name',
                              style: const TextStyle(),
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                            )
                          ],
                        ),
                        locator<AuthService>().userProfile.isInstitution ??
                                false
                            ? IconButton(
                                onPressed: () {
                                  model.removeJob(model.jobs[index].id!, index);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 18,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      model.jobs[index].title ?? 'No Title Mentioned',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconText(
                          Icons.location_on_outlined,
                          model.jobs[index].isRemote ?? false
                              ? 'In Office'
                              : 'Remote',
                        ),
                        // if (showtime) IconText(Icons.access_time_outlined, job.time),
                      ],
                    )
                  ],
                )),
          ),
          separatorBuilder: (_, index) => const SizedBox(
            width: 15,
          ),
        ),
      ),
    );
  }
}
