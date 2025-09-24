import 'package:resep_app_v2/model/chef.dart';

class DessertChef extends Chef {
  DessertChef(
    String name,
    String specialty,
    int experienceYears,
  ) : super(name, specialty, experienceYears); // Kirimkan ke parent

  @override
  void cook() {
    print("$name sedang membuat dessert.");
  }
}
