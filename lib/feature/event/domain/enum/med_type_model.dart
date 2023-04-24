
///[MedName] is a basic enumeration class which contains medication name and type.
enum MedName {
  proair('rescue'),
  symbicort('controller');

  const MedName(this.medType);
  final String medType;

  static type(String type) {
    switch (type) {
      case 'proair':
        return MedName.proair.medType;
      case 'symbicort':
        return MedName.symbicort.medType;
      default:
        throw UnsupportedError('Value entered is not recognized');
    }
  }
}
