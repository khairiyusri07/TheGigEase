import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'csv viewer.dart';

Future<List<List<dynamic>>> loadCSV(String csvAssetPath) async {
  String csvString = await rootBundle.loadString(csvAssetPath);
  List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvString);
  return csvTable;
}

class JadualWaktuSolat extends StatefulWidget {
  const JadualWaktuSolat({super.key});

  @override
  _JadualWaktuSolatState createState() => _JadualWaktuSolatState();
}

class _JadualWaktuSolatState extends State<JadualWaktuSolat> {
  List<List<dynamic>> csvData = [];
  List<String> locations = [
    'Gombak',
    'Kuala Selangor, Sabak Bernam',
    'Klang, Kuala Langat',
    'Kuala Muda, Yan, Pendang',
  ];
  String selectedLocation = 'Gombak';
  Map<String, String> locationCsvMap = {
    'Gombak': 'assets/JadualWaktuSolat/SGR1.csv',
    'Kuala Selangor, Sabak Bernam' :'assets/JadualWaktuSolat/SGR2.csv',
    'Klang, Kuala Langat' : 'assets/JadualWaktuSolat/SGR3.csv',
    'Kuala Muda, Yan, Pendang' :  'assets/JadualWaktuSolat/KDH02.csv',
  };

  @override
  void initState() {
    super.initState();
    _loadCsvData();
  }
  void _loadCsvData() async {
    String? csvPath = locationCsvMap[selectedLocation] ;
    List<List<dynamic>> data = await loadCSV(csvPath!);
    setState(() {
      csvData = data;
    });
  }


  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate = "${currentDate.day}-${currentDate.month}-${currentDate.year}";

    return Scaffold(
      appBar:  AppBar(
        title: const Text("Prayer Time",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const SizedBox(height: 150),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                children: [
                  Text("Current location :", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),),
                  SizedBox(width: 30),
                  Container(
                    alignment: Alignment.topRight,
                    color: Colors.grey.shade50,
                    child: SizedBox(
                      width: 120,
                      child: DropdownButton<String>(
                        value: selectedLocation,
                        isExpanded: true,
                      
                        items: locations.map((String location) {
                          return DropdownMenuItem<String>(
                            value: location,
                            child: Text(location),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedLocation = newValue;
                              _loadCsvData();
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(15),
                  color: Colors.grey.shade200
                ),
                child: Column(
                  children: [
                    const Text(
                      'Prayer time for today ' ,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 320,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey.shade400, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: DataTable(
                            columns: _buildTableColumns(),
                            rows: _buildTableRows(filterRowsByCurrentDate(csvData)),
                            columnSpacing: 10.0,
                            headingRowHeight: 20.0,
                            dividerThickness: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  List<DataColumn> _buildTableColumns() {
    List headers = csvData.isNotEmpty ? csvData[0].sublist(1) : [];

    return headers.map((header) => DataColumn(label: Text('$header'))).toList();
  }

  List<DataRow> _buildTableRows(List<List<dynamic>> rows) {
    return rows.map((row) {
      List<dynamic> rowData = row.sublist(1);
      return DataRow(cells: rowData.map((cell) => DataCell(Text('$cell'))).toList());
    }).toList();
  }

  List<List<dynamic>> filterRowsByCurrentDate(List<List<dynamic>> data) {
    String currentDate = '${DateTime.now().day}-${_getMonthAbbreviation(DateTime.now().month)}-${DateTime.now().year.toString().substring(2)}';

    List<List<dynamic>> filteredRows = data.where((row) {
      if (row.isNotEmpty && row[0] is String) {
        String rowDate = row[0].toString().trim();
        return rowDate == currentDate;
      }
      return false;
    }).toList();

    return filteredRows;
  }

  String _getMonthAbbreviation(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}

