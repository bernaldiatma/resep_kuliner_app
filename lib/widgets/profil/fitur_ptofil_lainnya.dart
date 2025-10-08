import 'package:flutter/material.dart';
import 'package:resep_app_v2/widgets/profil/fitur_button/about_device_button.dart';
import 'package:resep_app_v2/widgets/profil/fitur_button/help_button.dart';
import 'package:resep_app_v2/widgets/profil/fitur_button/payment_button.dart';
import 'package:resep_app_v2/widgets/profil/fitur_button/setting_button.dart';
import 'package:resep_app_v2/widgets/profil/fitur_button/terms_and_conditions_Button.dart';
import 'package:resep_app_v2/widgets/profil/fitur_button/tombol_logout.dart';

class FiturProfilLainnya extends StatelessWidget {
  const FiturProfilLainnya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Column(
              children: [
                SettingButton(),
                SizedBox(height: 16),
                PaymentButton(),
                SizedBox(height: 16),
                AboutDeviceButton(),
                SizedBox(height: 16),
                Divider(
                  height: 2,
                  thickness: 3,
                  color: Colors.grey.shade200,
                ),
                //Container(height: 2, color: Colors.grey.shade200),
                SizedBox(height: 16),
                HelpButton(),
                SizedBox(height: 16),
                TermsAndConditionsButton(),
                SizedBox(height: 20),
                TombolLogout(),
              ],
            ),
          ),
        ),
      );
  }
}
