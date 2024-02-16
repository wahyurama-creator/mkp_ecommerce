import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mkp_ecommerce/presentation/misc/methods.dart';
import 'package:mkp_ecommerce/presentation/providers/router/router_provider.dart';
import 'package:mkp_ecommerce/presentation/widgets/button/primary_button.dart';

class OrderSuccessPage extends ConsumerWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.green,
            ),
            verticalSpace(20),
            const Text(
              'Order Successful',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: PrimaryButton(
                title: 'Back to Home',
                onPressed: () {
                  ref.read(routerProvider).goNamed('main');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
