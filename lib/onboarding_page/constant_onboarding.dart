
import 'package:flutter/material.dart';

class Constants {
  static const String titleOne = 'Back a Loan, Earn\nReturns upto 40%';
  static const String titleTwo = 'Better way to\nGrow your Money';
  static const String titleThree = 'Built for Safety';


  static const String descriptionOne = 'Navigate safely above inflation';
  static const String descriptionTwo = 'Non speculative, higher yield,\nguaranteed returns';
  static const String descriptionThree = 'Salary loans with payroll repayments\nare secured asset high yield class';


  static const Color primaryColor = Colors.blue;

  static String getTitle(int index) {
    switch (index) {
      case 0:
        return titleOne;
      case 1:
        return titleTwo;
      case 2:
        return titleThree;
      default:
        return '';
    }
  }

  static String getDescription(int index) {
    switch (index) {
      case 0:
        return descriptionOne;
      case 1:
        return descriptionTwo;
      case 2:
        return descriptionThree;
      default:
        return '';
    }
  }
}
