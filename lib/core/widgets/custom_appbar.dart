import 'package:flutter/material.dart';
import 'package:ikhlas_kan/core/assets/app_assets.dart';
import 'package:ikhlas_kan/core/theme/app_colors.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppAssets.logo, // Ganti dengan aset logo Anda
            width: 100,
            height: 100,
          ),
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Color(AppColors.color1).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.search,
                  color: Color(AppColors.color1),
                  size: 18,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Color(AppColors.color1).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.bookmark_outline,
                  color: Color(AppColors.color1),
                  size: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
