import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/features/home/presentation/providers/home_provider.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            if (state.isLoading) const CircularProgressIndicator(),
            if (!state.isLoading) Text(state.test),
            ElevatedButton(
              onPressed: () {
                ref.read(homeProvider.notifier).getHomeData();
              },
              child: const Text('Click me'),
            ),
          ],
        ),
      ),
    );
  }
}
