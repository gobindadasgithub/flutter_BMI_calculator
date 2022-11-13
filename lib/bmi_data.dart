class Bmi {
  static const String underWeightSevere = 'Underweight (Severe thinness)';
  static const String underWeightModerate = 'Underweight (Moderate thinness)';
  static const String underWeightMild = 'Underweight (Mild thinness)';
  static const String normal = 'Normal';
  static const String overweightPreObese = 'Overweight (Pre-obese)';
  static const String overweightObese1 = 'Obese (Class I)';
  static const String overweightObese2 = 'Obese (Class II)';
  static const String overweightObese3 = 'Obese (Class III)';

  static String getBmiStatus(double bmi) {
    String status = '';
    if(bmi < 16.0) {
      status = underWeightSevere;
    } else if (bmi >= 16.0 && bmi <= 16.9) {
      status = underWeightModerate;
    } else if (bmi >= 17.0 && bmi <= 18.4) {
      status = underWeightMild;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      status = normal;
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      status = overweightPreObese;
    } else if (bmi >= 30.0 && bmi <= 34.9) {
      status = overweightObese1;
    } else if (bmi >= 35.0 && bmi <= 39.9) {
      status = overweightObese2;
    } else {
      status = overweightObese3;
    }
    return status;
  }

  static Map<String, String> statusMap =
  {
    underWeightSevere: '<16',
    underWeightModerate: '16.0 – 16.9',
    underWeightMild: '17.0 – 18.4',
    normal: '18.5 – 24.9',
    overweightPreObese: '25.0 – 29.9',
    overweightObese1: '30.0 – 34.9',
    overweightObese2: '35.0 – 39.9',
    overweightObese3: '≥ 40.0'
  };

}

