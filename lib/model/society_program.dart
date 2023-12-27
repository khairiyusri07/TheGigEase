import 'Society_model.dart';

class societyProgram {
  final SocietyList socName;
  final String pName;
  final  int pDuration;
  final String pDetail;



  societyProgram({
    required this.socName,
    required this.pName,
    required this.pDuration,
    required this.pDetail,

  });

}

List<societyProgram> societyPrograms = [

  societyProgram(
    socName : IRKHSSS,
    pName: "IRKHS Sport Fest",
    pDuration: 3,
    pDetail: "become a subcomm today!",
  ),

  societyProgram(
    socName : IIUMSU,
    pName: "IIUM Fest",
    pDuration: 14,
    pDetail: "become a subcomm today!",
  ),

  societyProgram(
    socName : MARUFCLUB,
    pName: "Da'wah Week",
    pDuration: 7,
    pDetail: "become a subcomm today!",
  ),

];