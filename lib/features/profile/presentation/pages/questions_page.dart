import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/route_button.dart';
import '../../../../custom/custom_app_bar.dart';

@RoutePage()
class QuestionsPage extends ConsumerWidget {
  const QuestionsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(
        leadingText: "Sıkça Sorulan Sorular",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: _QuestionsPart(questions: _questions1),
      ),
    );
  }
}

class _QuestionsPart extends ConsumerWidget {
  final List<String> questions;

  const _QuestionsPart({
    required this.questions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: List.generate(
        questions.length,
        (index) => Column(
          children: [
            RouteButton(
              paddingvertical: 12.h,
              title: questions[index],
              callbackOut: () {},
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
    );
  }
}

const List<String> _questions1 = [
  "Yerlerle ilgili bilgileri düzenleme",
  "Haritadaki hataları bildirme",
  "Yerlerle ilgili bilgileri düzenleme",
  "Haritadaki hataları bildirme",
  "Adım adım navigasyon özelliği",
  "Eksik yerleri haritaya ekleme",
  "Otomatik Yükleme Nedir?",
];
