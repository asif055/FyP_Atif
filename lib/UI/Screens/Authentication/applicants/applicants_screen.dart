import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jobportal/UI/Screens/Authentication/applicants/applicantsVM.dart';
import 'package:jobportal/core/model/job_class.dart';
import 'package:provider/provider.dart';

class Applicants extends StatelessWidget {
  final Job job;
  const Applicants({required this.job, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicantsVM(),
      child: Consumer<ApplicantsVM>(
        builder: (context, model, child) => Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 66),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 18,
                        ),
                      ),
                      Text(
                        'Applicants for ${job.title}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  job.applicants!.isNotEmpty
                      ? ListView.builder(
                          padding: const EdgeInsets.only(top: 35),
                          shrinkWrap: true,
                          itemCount: job.applicants?.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            "assets/images/Alamdar.jpg",
                                        image: job.applicants![index].imageUrl!,
                                        width: 45,
                                        height: 45,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text(
                                      job.applicants![index].name!,
                                    ),
                                    subtitle: Text(
                                      job.applicants![index].city!,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      TextButton(
                                        child: const Text('CALL'),
                                        onPressed: () async {
                                          await model.makePhoneCall(
                                            Uri.parse(
                                              'tel:${job.applicants![index].phoneNumber}',
                                            ),
                                          );
                                        },
                                      ),
                                      const SizedBox(width: 8),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 150.0),
                            child: Text('No Applicants yet'),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
