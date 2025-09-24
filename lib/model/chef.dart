class Chef {
  String _name;
  String _specialty;// Variabel private (Encapsulation)
  int _experienceYears;

  Chef(this._name, this._specialty, this._experienceYears);

  // Getter publik untuk mengakses variabel private
  String get name => _name;
  String get specialty => _specialty;
  int get experienceYears => _experienceYears;

  void cook() {
    print("$name sedang memasak.");
  }
}