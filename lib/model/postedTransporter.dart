class pTransporterJob {
  final String timeRide;
  final String locationStart;
  final String locationEnd;
  final double fee;
  final bool isComplete;
  final bool isCancel;



  pTransporterJob( {
  required this.timeRide,
  required this.locationStart,
  required this.locationEnd,
  required this.fee,
  required this.isComplete,
  required this.isCancel,

});


}

List<pTransporterJob> pTransporterJobs = [

  pTransporterJob(
    timeRide: "Now",
    locationStart: "Mahallah Faruq",
    locationEnd: "LRT Gombak",
    fee: 10,
    isComplete: false,
    isCancel: false,
  ),

  pTransporterJob(
    timeRide: "Yesterday",
    locationStart: "Mahallah Faruq",
    locationEnd: "Mahallah Sallahuddin",
    fee: 5,
    isComplete: true,
    isCancel: false,
  ),

  pTransporterJob(
    timeRide: "Yesterday",
    locationStart: "Mahallah Sallahuddin",
    locationEnd: "Mahallah Faruq",
    fee: 5,
    isComplete: true,
    isCancel: false,
  ),

  pTransporterJob(
    timeRide: "Yesterday",
    locationStart: "Mahallah Faruq",
    locationEnd: "LRT Gombak",
    fee: 10,
    isComplete: false,
    isCancel: true,
  )


];