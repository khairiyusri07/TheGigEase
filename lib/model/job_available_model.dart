import 'package:flutter_application_1/model/user_model.dart';

// ignore: camel_case_types
class JobOpening {
  final User poster;
  final int jobId;
  final String timePosted;
  final String jobPosition;
  final String jobDescription;
  final String jobImage;
  late final bool isBookMark;
  late final bool applied;
  late final bool accepted;
  final String jobLocation;
  final double jobFee;
  final bool isDone;


  JobOpening({
    required this.poster,
    required this.jobId, 
    required this.jobLocation,
    required this.timePosted, 
    required this.jobPosition, 
    required this.jobDescription, 
    required this.jobImage, 
    required this.isBookMark, 
    required this.applied,
    required this.jobFee,
    required this.accepted,
    required this.isDone,
  });

}

List<JobOpening> openJobs = [
  JobOpening(
      poster: james,
    jobId: 1001,
    timePosted: 'Now',
    jobLocation: 'Convest Hill',
    jobPosition: 'Waiter',
    jobDescription: 'Serve customers at the drink haven with a smile!',
    jobImage: 'assets/images/jobImage/waiter.jpg',
    isBookMark: false,
    applied: true,
    accepted: false,
      isDone: false,
    jobFee: 6
  ),
  JobOpening(
      poster: john,
    jobId: 1002,
    timePosted: 'Now',
    jobLocation: 'IRKHSSS Fest',
    jobPosition: 'Chef',
    jobDescription: 'Cook delicious and mouthwatering food at Tasty Bites!',
    jobImage: 'assets/images/jobImage/chef.jpg',
    isBookMark: false,
    applied: true,
    accepted: true,
      isDone: false,
    jobFee: 5
  ),
  JobOpening(
      poster: greg,
    jobId: 1003,
    timePosted: 'Now',
    jobLocation: 'Mahallah Faruq Cafe',
    jobPosition: 'Barista',
    jobDescription: 'Brew and serve amazing coffee at Brew Bliss!',
    jobImage: 'assets/images/jobImage/barista.jpg',
    isBookMark: true,
    applied: true,
      accepted: false,
      isDone: false,
      jobFee: 7
  ),
  JobOpening(
      poster: james,
    jobId: 1004,
    timePosted: 'Now',
    jobLocation: 'Mahallah Asma',
    jobPosition: 'Delivery Driver',
    jobDescription: 'Deliver food at lightning speed for Speedy Eats!',
    jobImage: 'assets/images/jobImage/delivery.jpg',
    isBookMark: false,
    applied: false,
    accepted: false,
      isDone: false,
    jobFee: 7
  ),
  JobOpening(
      poster: sam,
    jobId: 1005,
    timePosted: 'Now',
    jobLocation: 'Customer Support at Help Hub',
    jobPosition: 'Customer Support',
    jobDescription: 'Assist customers with their queries at Help Hub!',
    jobImage: 'assets/images/jobImage/cs.jpg',
    isBookMark: false,
    applied: false,
    accepted: false,
      isDone: false,
    jobFee: 7
  ),
  JobOpening(
      poster: john,
    jobId: 1006,
    timePosted: 'Now',
    jobLocation: 'Giant Hypermarket',
    jobPosition: 'Security Guard',
    jobDescription: 'Ensure safety and security at Safe Zone!',
    jobImage: 'assets/images/jobImage/security.jpg',
    isBookMark: false,
    applied: false,
    accepted: false,
      isDone: false,
    jobFee: 7
  ),
  JobOpening(
      poster: steven,
    jobId: 1007,
    timePosted: 'Now',
    jobLocation: 'ICT Fest',
    jobPosition: 'Sell Drink',
    jobDescription: 'Sell Drink!',
    jobImage: 'assets/images/jobImage/geraiTepiJalan.jpg',
    isBookMark: false,
    applied: false,
    accepted: false,
      isDone: false,
    jobFee: 7
  ),
  JobOpening(
      poster: sophia,
    jobId: 1008,
    timePosted: 'Now',
    jobLocation: 'online',
    jobPosition: 'Marketing Specialist',
    jobDescription: 'Create buzz-worthy marketing campaigns at Buzz Market!',
    jobImage: 'assets/images/jobImage/graphicDesigner.jpg',
    isBookMark: false,
    applied: false,
    accepted: false,
      isDone: false,
    jobFee: 7
  ),
  JobOpening(
      poster: sophia,
    jobId: 1009,
    timePosted: 'Now',
    jobLocation: 'EcoShop Gombak',
    jobPosition: 'Sales Associate',
    jobDescription: 'Boost sales at Sales Haven with your expertise!',
    jobImage: 'assets/images/jobImage/promoter.jpg',
    isBookMark: false,
    applied: false,
    accepted: false,
      isDone: false,
    jobFee: 7
  ),
  JobOpening(
      poster: john,
    jobId: 1010,
    timePosted: 'Now',
    jobLocation: 'Online lah',
    jobPosition: 'Graphic Designer',
    jobDescription: 'Create stunning designs at Creative Hub!',
    jobImage: 'assets/images/jobImage/graphicDesigner.jpg',
    isBookMark: false,
    applied: false,
    accepted: false,
      isDone: false,
    jobFee: 7
  ),

  JobOpening(
      poster: john,
      jobId: 1011,
      timePosted: 'Now',
      jobLocation: 'online',
      jobPosition: 'Graphic Designer',
      jobDescription: 'Create stunning designs at Creative Hub!',
      jobImage: 'assets/images/jobImage/graphicDesigner.jpg',
      isBookMark: false,
      applied: true,
      accepted: true,
      isDone: true,
      jobFee: 7
  ),
];
