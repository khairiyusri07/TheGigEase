import 'package:flutter_application_1/model/user_model.dart';

import 'wallet_provider.dart';

// ignore: camel_case_types
class transporters_jobs {
  final int tJobId;
  final User userId;
  final String timeRide; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String locationStart;
  final String locationEnd;
  final double fee;
  late final bool applied;
  
  var jobMap;

  transporters_jobs({
    required this.tJobId,
    required this.userId, 
    required this.timeRide, 
    required this.locationStart, 
    required this.locationEnd,
    required this.fee,
    required this.applied,
  });
  void completeJob(WalletProvider walletProvider) {
    // Mark the job as completed
    // ...

    // Add the fee to the user's wallet
    walletProvider.addMoney(fee);
  }

  void toggleApplied() {
    applied = !applied;
  }
  bool isApplied() {
    return applied;
  }

}

List<transporters_jobs> openTranspoterJobs = [
  transporters_jobs(
    tJobId: 0001,
    userId: james, 
    timeRide: 'Now', 
    locationStart: 'Mahallah Faruq', 
    locationEnd: 'Mahallah Uthman',
    fee:  5.00,
    applied: false,
  ),
  transporters_jobs(
    tJobId: 0002,
    userId: john, 
    timeRide: 'Now', 
    locationStart: 'Mahallah Ali', 
    locationEnd: 'Mahallah Fatimah',
    fee: 8.00,
    applied: false,
  ),
  transporters_jobs(
    tJobId: 0003,
    userId: olivia, 
    timeRide: 'Next Week', 
    locationStart: 'Mahallah Bilal', 
    locationEnd: 'LRT Gombak',
    fee: 10.00,
    applied: false,
  ),
  transporters_jobs(
    tJobId: 0004,
    userId: sam, 
    timeRide: 'NOW', 
    locationStart: 'KLCC', 
    locationEnd: 'Mahallah Asma',
    fee: 25.00,
    applied: false,
  ),
  transporters_jobs(
    tJobId: 0005,
    userId: sophia, 
    timeRide: 'Tommorow', 
    locationStart: 'KLIA', 
    locationEnd: 'Mahallah Khadijah',
    fee: 65.00,
    applied: false,
  ),
  transporters_jobs(
    tJobId: 0006,
    userId: steven, 
    timeRide: 'Today, 5pm', 
    locationStart: 'Mahallah Ali', 
    locationEnd: 'Zoo Negara',
    fee: 20.00,
    applied: false,
  ),
];




