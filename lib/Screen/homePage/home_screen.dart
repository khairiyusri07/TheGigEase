import 'package:flutter/material.dart';
import '../addJob/add_job_main.dart';
import 'components/advert.dart';
import 'components/ewallet_bar.dart';
import 'components/app_bar.dart';
import 'components/search_bar.dart';
import 'components/social_service.dart';
import 'components/transporter_work_list.dart';
import 'components/work_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const homeHeader(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SearchBars(),
          Expanded(
            child: ListView(
              children: [
                const EWalletOptions(),
                AdvertGallery(assetPaths: [],), // Fix 1: Use imgList instead of advertImages
                const SizedBox(height: 20.0),
                WorkSelectionGallery(),
                const SizedBox(height: 25.0),

                TransporterList(),
                const SizedBox(height: 25.0),
                const SocietyWork(),

                const SizedBox(height: 35.0),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(
          Icons.add
        ),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddJobMainPage()),
          );
        },
      ),
    );
  }
}
