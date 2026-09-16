import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkingapp/Core/Shared_Widgets/BottomNav.dart';
import 'package:parkingapp/Features/Home/Widgets/FindSpotBanner.dart';
import 'package:parkingapp/Features/Home/Widgets/GarageCard.dart';

import '../Manager/HomeCubit.dart';
import '../Manager/HomeState.dart';

import 'package:parkingapp/Features/Home/Data/Repositories/GarageRepository.dart';

class GarageOverviewScreen extends StatelessWidget {
  const GarageOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(GarageRepository(Dio()))..fetchGarages(),

      child: Scaffold(
        backgroundColor: const Color(0xFFF7F8FA),

        appBar: AppBar(
          backgroundColor: const Color(0xFFF7F8FA),
          elevation: 0,

          title: Row(
            children: const [
              Icon(Icons.local_parking, color: Color(0xFF2E6BF2)),
              SizedBox(width: 6),
              Text(
                'Smart Parking',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black87),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black87),
              onPressed: () {},
            ),
          ],
        ),

        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            // Loading
            if (state is HomeInitial || state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // Error
            if (state is HomeError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            // Success
            if (state is HomeLoaded) {
              final garages = state.garages;

              return ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                children: [
                  const FindSpotBanner(),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Nearby Garages',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      TextButton(
                        onPressed: () {},
                        child: const Text('View All'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  ...garages.map((garage) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GarageCard(
                        name: garage.name,
                        distance: garage.distance,
                      ),
                    );
                  }),
                ],
              );
            }

            return const SizedBox();
          },
        ),

        bottomNavigationBar: const BottomNav(currentIndex: 0),
      ),
    );
  }
}
