class Job {
  String company;
  String logoURL;
  late bool isMark;
  String time;
  String location;
  String title;

  List<String> req;
  Job(this.company, this.logoURL, this.isMark, this.title, this.location,
      this.time, this.req);
  static List<Job> generateJobs() {
    return [
      Job(
        // Job constructor
        'GoogleLLc', //company name
        'assets/images/microsoft.jpg', //company_logo
        false,
        'Principle product', //company type
        'Arbab Road Uni Road Peshawar', //location
        'Full Time', //Timing
        [
          //job descripation
          'Creative with an eye of Shape',
          'understand different materials and production Methods',
          'How praticals and technicals Knowledge',
          'Intrested in the way people choose and use product',
        ],
      ),
      Job(
        'GoogleLLc', //company name
        'assets/images/microsoft.jpg', //company_logo
        false,
        'Principle product', //company type
        'Arbab Road Uni Road Peshawar', //location
        'Full Time', //Timing
        [
          //job descripation
          'Creative with an eye of Shape',
          'understand different materials and production Methods',
          'How praticals and technicals Knowledge',
          'Intrested in the way people choose and use product',
        ],
      ),
      Job(
        'GoogleLLc', //company name
        'assets/images/microsoft.jpg', //company_logo
        false,
        'Principle product', //company type
        'Arbab Road Uni Road Peshawar', //location
        'Full Time', //Timing
        [
          //job descripation
          'Creative with an eye of Shape',
          'understand different materials and production Methods',
          'How praticals and technicals Knowledge',
          'Intrested in the way people choose and use product',
        ],
      ),
    ];
  }
}
