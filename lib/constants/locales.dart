import 'dart:ui';

const enLocale = Locale('en', 'US');
const trLocale = Locale('tr', 'TR');

const supportedLocales = [enLocale, trLocale];

const List<Map> languages = [
  {
    'name': 'English',
    'locale': enLocale,
    'image': 'assets/images/england.png',
  },
  {
    'name': 'Türkçe',
    'locale': trLocale,
    'image': 'assets/images/Turkey.png',
  },
  {
    'name': 'Deutsch',
    'locale': trLocale,
    'image': 'assets/images/german.png',
  },
  {
    'name': 'Dutch',
    'locale': trLocale,
    'image': 'assets/images/dutch.png',
  }
];
