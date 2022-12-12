import 'package:flutter/material.dart';
import 'package:jobportal/UI/Screens/Home/home_viewmodel.dart';
import 'package:jobportal/UI/custom_widgets/icon_text.dart';
import 'package:jobportal/core/model/job_class.dart';
import 'package:provider/provider.dart';

class JobDetail extends StatelessWidget {
  final Job job;

  ///a constructrator
  JobDetail({
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) => Container(
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          height: 550,
          child: SingleChildScrollView(
            child: Column(
              ///crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 5,
                  width: 60,
                  color: Colors.grey.withOpacity(0.3),
                ),
                const SizedBox(
                  height: 30,
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
                        // Row(
                        //   children: [
                        //     Icon(
                        //       job.isMark
                        //           ? Icons.bookmark
                        //           : Icons.bookmark_outline_rounded,
                        //       color: job.isMark
                        //           ? Theme.of(context).primaryColor
                        //           : Colors.black,
                        //     ),
                        //     const Icon(Icons.more_horiz_outlined),
                        //   ],
                        // ),
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
                        IconText(Icons.access_time_outlined,
                            job.jobType ?? false ? 'Full-Time' : 'Internship'),
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
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 25),
                      height: 45,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {},
                        child: const Text(
                          'Apply Now',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
