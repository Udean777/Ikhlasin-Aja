import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikhlas_kan/core/assets/app_assets.dart';
import 'package:ikhlas_kan/core/widgets/category_button.dart';
import 'package:ikhlas_kan/presentation/view_all/campaigns_view_all.dart';

class CampaignSections extends StatelessWidget {
  const CampaignSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppAssets.educationImage,
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Campaigns",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CampaignsViewAll(),
                    ),
                  );
                },
                child: Text(
                  "See all",
                  style: GoogleFonts.poppins(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
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
        const SizedBox(height: 24),
      ],
    );
  }
}
