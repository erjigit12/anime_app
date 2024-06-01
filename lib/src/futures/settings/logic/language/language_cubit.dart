import 'package:anime_app/src/database/database_helper.dart';
import 'package:bloc/bloc.dart';

typedef IsEnglish = bool;

class LanguageCubit extends Cubit<IsEnglish> {
  LanguageCubit() : super(false) {
    _fetchAnimeTitleLanguage();
  }

  bool get isEnglish => state;

  // Fetch initial language
  Future _fetchAnimeTitleLanguage() async {
    final isEnglish = await DatabaseHelper.instance.isEnglish;
    emit(isEnglish);
  }

  // Change Anime Title Language
  Future changeAnimeTitleLanguage({required bool isEnglish}) async {
    await DatabaseHelper.instance.setIsEnglish(isEnglish);
    emit(isEnglish);
  }
}
