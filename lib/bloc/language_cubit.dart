import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(Locale('en', 'US')); // Default language is English

  void switchToArabic() {
    emit(const Locale('ar', 'AE'));
  }

  void switchToEnglish() {
    emit(const Locale('en', 'US'));
  }
}
