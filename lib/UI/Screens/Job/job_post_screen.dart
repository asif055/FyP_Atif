import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobportal/UI/Screens/Home/home_for_applicant.dart';
import 'package:jobportal/UI/Screens/Job/job_post_viewmodel.dart';
import 'package:provider/provider.dart';

class JobPostScreen extends StatelessWidget {
  JobPostScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => JobPostViewModel(),
      child: Consumer<JobPostViewModel>(
        builder: (context, model, child) => Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 10, top: 65),
              child: Form(
                key: _formKey,
                child: model.loading
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black54,
                                ),
                              ),
                              const Text(
                                'Lets Post a Job',
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Job Title...',
                              hintStyle: TextStyle(
                                color: Colors.black26,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                            onSaved: (String? value) {
                              model.job.title = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid title for your job';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Job Description...',
                              hintStyle: TextStyle(
                                color: Colors.black26,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            onSaved: (String? value) {
                              model.job.description = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid description for your job';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Job Requirements...',
                              hintStyle: TextStyle(
                                color: Colors.black26,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            onSaved: (String? value) {
                              model.job.requirements = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid title for your job';
                              }
                              return null;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Is Internship?'),
                              Switch(
                                // This bool value toggles the switch.
                                value: model.isInternship ?? false,
                                onChanged: (bool value) {
                                  model.toggleJobType();
                                  debugPrint('${model.isInternship}');
                                },
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Is Remote?'),
                              Switch(
                                // This bool value toggles the switch.
                                value: model.isRemote ?? false,
                                onChanged: (bool value) {
                                  model.toggleIsRemote();
                                  debugPrint('${model.isRemote}');
                                },
                              )
                            ],
                          ),
                          const SizedBox(height: 45),
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              child: Container(
                                height: 45,
                                width: 175,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    'POST',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  model.postAJob();
                                  Get.to(() => const HomeScreenAplicant());
                                }
                              },
                            ),
                          )
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
