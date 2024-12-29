import 'package:flutter/material.dart';
import 'package:ikhlas_kan/core/assets/app_assets.dart';
import 'package:ikhlas_kan/core/widgets/category_button.dart';
import 'package:ikhlas_kan/core/widgets/custom_appbar.dart';
import 'package:ikhlas_kan/presentation/main/widgets/donation_card.dart';

class CampaignsViewAll extends StatelessWidget {
  const CampaignsViewAll({super.key});

  final List<Map<String, dynamic>> donationData = const [
    {
      'imgUrl': AppAssets.mainImage,
      'title': 'Ensuring medicine for all children in rural areas',
      'raisedAmount': 780000,
      'targetAmount': 1000000,
      'donorCount': 324,
      'daysLeft': 14,
    },
    {
      'imgUrl': AppAssets.educationImage,
      'title': 'Education support for underprivileged students in Jakarta',
      'raisedAmount': 450000,
      'targetAmount': 2500000,
      'donorCount': 156,
      'daysLeft': 30,
    },
    {
      'imgUrl': AppAssets.disasterImage,
      'title': 'Emergency relief for flood victims in Central Java',
      'raisedAmount': 1200000,
      'targetAmount': 1500000,
      'donorCount': 892,
      'daysLeft': 5,
    },
    {
      'imgUrl': AppAssets.foodImage,
      'title': 'Providing nutritious meals for orphanages in Surabaya',
      'raisedAmount': 250000,
      'targetAmount': 750000,
      'donorCount': 89,
      'daysLeft': 45,
    },
    {
      'imgUrl': AppAssets.elderlyImage,
      'title': 'Supporting elderly care facilities in Bandung',
      'raisedAmount': 900000,
      'targetAmount': 3000000,
      'donorCount': 445,
      'daysLeft': 20,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            elevation: 0,
            expandedHeight: 80,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: const CustomAppbar(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      CategoryButton(
                        label: 'All',
                        isSelected: true,
                        onTap: () {},
                      ),
                      CategoryButton(
                        label: 'Cat 1',
                        isSelected: false,
                        onTap: () {},
                      ),
                      CategoryButton(
                        label: 'Cat 2',
                        isSelected: false,
                        onTap: () {},
                      ),
                      CategoryButton(
                        label: 'Cat 3',
                        isSelected: false,
                        onTap: () {},
                      ),
                      CategoryButton(
                        label: 'Cat 4',
                        isSelected: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 20,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              bottom: 32,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final data = donationData[index];
                  return DonationCard(
                    imgUrl: data['imgUrl'],
                    title: data['title'],
                    raisedAmount: data['raisedAmount'],
                    targetAmount: data['targetAmount'],
                    donorCount: data['donorCount'],
                    daysLeft: data['daysLeft'],
                  );
                },
                childCount: donationData.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
