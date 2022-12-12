import 'package:flutter/material.dart';

class HomeForOrganization extends StatelessWidget {
  HomeForOrganization({Key? key}) : super(key: key);

  final companyController = TextEditingController();
  final titleController = TextEditingController();
  final locationController = TextEditingController();
  final listOfReqController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text(
          "Organization",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      )),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              const Text(
                'Post your Ads',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Container(
                  width: 350,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      // shape: BoxShape.rectangle,
                      // color: Colors.grey,
                      borderRadius: BorderRadius.circular(18.0)),
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Company',
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'job title',
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'location',
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'list of req',
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Container(
                      //   child: (
                      //     child: const Text(
                      //       'Submit',
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.bold, fontSize: 14),
                      //     ),
                      //     onPressed: () {},
                      //   ),
                      // )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
