class SocietyList{
  late int societyNo ;
  late String societyShortName ;
  late String societyFullName ;
  late String logoUrl;

  SocietyList({
      required this.societyShortName,
      required  this.societyFullName,
      required this.societyNo,
    required this.logoUrl
  });
}

  final SocietyList IRKHSSS = SocietyList(
      societyShortName: "IRKHSSS",
      societyFullName: "Islamic Revealed Knowledge and Human Sciences Students' Society",
      societyNo: 1,
      logoUrl: "assets/societyLogo/irkhs.jpg",
  );

  final SocietyList BEDSA = SocietyList(
    societyShortName: "BEDSA",
    societyFullName: "Bachelor of Education Student's Association ",
    societyNo: 2,
    logoUrl: "assets/societyLogo/bedsa.jpg",
  );

  final SocietyList ICTSS = SocietyList(
    societyShortName: "ICTSS",
    societyFullName: "Information & Communication Technology Students' Society ",
    societyNo: 3,
    logoUrl: "assets/societyLogo/ictss.jpg",
  );

  final SocietyList ENGINIUS = SocietyList (
    societyShortName: "ENGINIUS",
    societyFullName: "Engineering Students' Society ",
    societyNo: 4,
    logoUrl: "assets/societyLogo/enginius.png",
  );

  final SocietyList ARCHIMIC = SocietyList (
    societyShortName: "ARCHIMIC",
    societyFullName: "ARCHIMIC Students' Society ",
    societyNo: 5,
    logoUrl: "assets/societyLogo/kaed.jpg",
  );

  final SocietyList LAWSOC = SocietyList (
    societyShortName: "LAWSOC",
    societyFullName: "ALaw Students' Society of Ahmad Ibrahim Kulliyyah of Laws",
    societyNo: 6,
    logoUrl: "assets/societyLogo/aikol.jpg",
  );

  final SocietyList IIUMSU = SocietyList (
    societyShortName: "IIUM SU",
    societyFullName: "IIUM Student Union",
    societyNo: 7,
    logoUrl: "assets/societyLogo/iiumsu.png",
  );

  final SocietyList MARUFCLUB = SocietyList (
    societyShortName: "MA'RUF CLUB",
    societyFullName: "MA'RUF CLUB",
    societyNo: 7,
    logoUrl: "assets/societyLogo/marufclub.jpg",
  );


