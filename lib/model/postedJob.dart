class jobPosted{
  final int jobId;
  final String timePosted;
  final String jobPosition;
  final String jobDescription;
  final String jobImage;
  final String jobLocation;
  final double jobFee;
  final bool isDone;
  final bool isCancel;

  jobPosted({
  required this.jobId,
  required this.timePosted,
  required this.jobPosition,
  required this.jobDescription,
  required this.jobImage,
  required this.jobLocation,
  required this.jobFee,
  required this.isDone,
  required this.isCancel,
  });
}

List<jobPosted> postedList = [
  jobPosted(
    jobId: 1001,
    timePosted: '13-Nov-23',
    jobLocation: 'Convest Hill',
    jobPosition: 'Waiter/Waitress',
    jobDescription: 'Serve customers at the drink haven with a smile!',
    jobImage: 'assets/images/jobImage/waiter.jpg',
    isDone: false,
    isCancel: false,
    jobFee: 6,
),
  jobPosted(
    jobId: 1002,
    timePosted: '10-Nov-23',
    jobLocation: 'Downtown Square',
    jobPosition: 'Chef',
    jobDescription: 'Prepare delicious meals for our customers!',
    jobImage: 'assets/images/jobImage/chef.jpg',
    isDone: false,
    isCancel: true,
    jobFee: 10,
  ),
  jobPosted(
    jobId: 1003,
    timePosted: '2-Dec-23',
    jobLocation: 'Parkside Mall',
    jobPosition: 'Cashier',
    jobDescription: 'Handle transactions with a friendly attitude!',
    jobImage: 'assets/images/jobImage/promoter.jpg',
    isDone: true,
    isCancel: false,
    jobFee: 8,
  ),
];