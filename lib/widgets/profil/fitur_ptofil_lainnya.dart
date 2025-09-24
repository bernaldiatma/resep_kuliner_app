import 'package:flutter/material.dart';
import 'package:resep_app_v2/widgets/profil/fitur_card/account_setting.dart';
import 'package:resep_app_v2/widgets/profil/fitur_card/help_card.dart';
import 'package:resep_app_v2/widgets/profil/fitur_card/payment_card.dart';
import 'package:resep_app_v2/widgets/profil/fitur_card/setting_card.dart';
import 'package:resep_app_v2/widgets/profil/fitur_card/terms_and_conditions_card.dart';
import 'package:resep_app_v2/widgets/profil/fitur_card/tombol_logout.dart';

class FiturProfilLainnya extends StatelessWidget {
  const FiturProfilLainnya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            SettingCard(),
            SizedBox(height: 16),
            PaymentCard(),
            SizedBox(height: 16),
            AccountSettingCard(),
            SizedBox(height: 16),
            Container(height: 2, color: Colors.grey.shade200),
            SizedBox(height: 16),
            HelpCard(),
            SizedBox(height: 16),
            TermsAndConditionsCard(),
            SizedBox(height: 50),
            TombolLogout(),
          ],
        ),
      ),
    );
  }
}
