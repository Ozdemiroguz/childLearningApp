import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../router/router.dart';

@RoutePage()
class IntroPage extends ConsumerWidget {
  static const type = 1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Intro Pages'),
            FilledButton(
              onPressed: () {
                context.router.push(const HomeRoute());
              },
              child: const Text('Click me'),
            ),
          ],
        ),
      ),
    );
  }
}
