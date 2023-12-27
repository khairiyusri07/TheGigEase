import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';
import 'drop_off_location.dart';

class AddTransporterJobs extends StatefulWidget {
  const AddTransporterJobs({super.key});

  @override
  State<AddTransporterJobs> createState() => _AddTransporterJobsState();
}

class _AddTransporterJobsState extends State<AddTransporterJobs> {
  late GoogleMapController mapController;
  late LatLng currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print("Error getting current location: $e");
      // Handle errors or default to a specific location if needed
      setState(() {
        currentLocation = LatLng(37.7749, -122.4194);
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onMapTap(LatLng location) {
    setState(() {
      currentLocation = location;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
         "New Transporter Jobs",
          style: TextStyle(
              color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            onTap: _onMapTap,
            initialCameraPosition: CameraPosition(
              target: currentLocation,
              zoom: 14.0,
            ),
          ),
          Center(
            child: Icon(
              Icons.location_pin,
              color: Colors.red, 
              size: 40.0, 
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: SearchMapPlaceWidget(
              apiKey: '',
              language: 'en',
              location: currentLocation,
              radius: 30000,
              onSelected: (Place place) async {
                final geolocation = await place.geolocation;
                mapController.animateCamera(
                  CameraUpdate.newLatLng(geolocation!.coordinates!),
                );
                setState(() {
                  currentLocation = geolocation.coordinates!;
                });
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 300,
        child: FloatingActionButton(
          onPressed: () {
            print('Selected Location: Latitude=${currentLocation.latitude}, Longitude=${currentLocation.longitude}');

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DropOffLocation()),);
          },
          child: Text("Confirm Pick-up"),
        ),
      ),
    );
  }
}
