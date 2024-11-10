import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BottomSeed extends StatelessWidget {
  const BottomSeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // latar belakang transparan
        elevation: 0,
        title: Text(
          'Location',
          style: blackTextStyle.copyWith(
            fontSize: 22,
            fontWeight: bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(-7.0194, 113.8811), // location (Sumenep)
              zoom: 12,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),

          // Draggable scrollable sheet
          DraggableScrollableSheet(
            initialChildSize: 0.1, // Initial height
            minChildSize: 0.1, // Minimum height
            maxChildSize: 0.6, // Maximum height
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(26),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 5,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Order Tracking',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 73,
                              width: 73,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors
                                    .blue, // Assuming `primaryColor` is blue
                              ),
                              child: Image.asset(
                                'assets/images/img/piring_.png',
                              ),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kedai Mie Ghani',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Veggie tomato mix',
                                  style: greyTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.phone,
                                size: 30,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(
                                      255, 216, 216, 216), // Assuming `gray`
                                ),
                                child: const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(width: 18),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Address',
                                      style: greyTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: semiBold,
                                      )),
                                  const SizedBox(height: 8),
                                  Text(
                                    'jalan raya ning ningnong, 12',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 216, 216, 216),
                                ),
                                child: const Icon(
                                  Icons.access_time,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(width: 18),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Perkiraan Waktu',
                                      style: greyTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: semiBold,
                                      )),
                                  const SizedBox(height: 8),
                                  Text(
                                    '03:00PM (Max 20 min)',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: BottomSeed(),
  ));
}
