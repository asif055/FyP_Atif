import 'package:flutter/material.dart';
import 'package:jobportal/UI/custom_widgets/icon_text.dart';
import 'package:jobportal/core/model/job_class.dart';

import 'flutter/material.dart';

class JobItem extends StatelessWidget {
  final Job job;
  JobItem({required this.job});
  // const JobItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Job Card or Box,
    return Container(
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
                        image: job.imageUrl!,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      job.companyName ?? 'No Name',
                      style: const TextStyle(),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    )
                  ],
                ),
            
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              job.title ?? 'No Title Mentioned',
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
                  job.isRemote ?? false ? 'In Office' : 'Remote',
                ),
                // if (showtime) IconText(Icons.access_time_outlined, job.time),
              ],
            )
          ],
        ));
  }
}
