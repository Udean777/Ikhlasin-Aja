import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikhlas_kan/core/assets/app_assets.dart';
import 'package:ikhlas_kan/presentation/main/home/pages/home_page.dart';

class AddDonations extends StatefulWidget {
  const AddDonations({super.key});

  @override
  State<AddDonations> createState() => _AddDonationsState();
}

class _AddDonationsState extends State<AddDonations> {
  final TextEditingController _amountController = TextEditingController();
  bool _isAnonymous = false;

  final List<int> _quickAmounts = [
    500,
    1000,
    2000,
    5000,
    10000,
    50000,
  ];

  String? _selectedPaymentMethod;

  final List<Map<String, String>> _paymentMethods = [
    {'name': 'Gopay', 'image': AppAssets.gopayLogo},
    {'name': 'OVO', 'image': AppAssets.ovoLogo},
    {'name': 'Bank Jago', 'image': AppAssets.jagoLogo},
    {'name': 'BCA', 'image': AppAssets.bcaLogo},
    {'name': 'BNI', 'image': AppAssets.bniLogo},
    {'name': 'BRI', 'image': AppAssets.briLogo},
  ];

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const Text(
                      'Donate',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 16,
                children: [
                  Text(
                    "Enter the amount",
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: ColorScheme.of(context).primary,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      hintText: "Rp 0",
                    ),
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _quickAmounts.map((amount) {
                      return OutlinedButton(
                        onPressed: () {
                          _amountController.text = amount.toString();
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: ColorScheme.of(context).primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          '${amount}Ks',
                          style:
                              TextStyle(color: ColorScheme.of(context).primary),
                        ),
                      );
                    }).toList(),
                  ),
                  GestureDetector(
                    onTap: _showPaymentMethodBottomSheet,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            _selectedPaymentMethod ?? 'Select payment method',
                            style: GoogleFonts.poppins(
                              color: _selectedPaymentMethod == null
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isAnonymous,
                        onChanged: (value) {
                          setState(() {
                            _isAnonymous = value ?? false;
                          });
                        },
                      ),
                      Text(
                        "Donate as anonymous",
                        style: GoogleFonts.poppins(),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: (_selectedPaymentMethod == null ||
                            _amountController.text.isEmpty)
                        ? null
                        : () {
                            _showSuccessDialog();
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorScheme.of(context).primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: Text(
                      "Donate Now",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: ColorScheme.of(context).primary,
                size: 64,
              ),
              const SizedBox(height: 16),
              Text(
                'Donation Successful',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Thank you for your donation!',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorScheme.of(context).primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPaymentMethodBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              "Select Payment Method",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            ..._paymentMethods.map((method) {
              return ListTile(
                leading: Image.asset(
                  method['image']!,
                  width: 40,
                  height: 40,
                ),
                title: Text(
                  method['name']!,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Radio<String>(
                  value: method['name']!,
                  groupValue: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                    Navigator.pop(context);
                  },
                ),
              );
            }),
            const SizedBox(
              height: 16,
            ),
          ],
        );
      },
    );
  }
}
