import 'package:go_router/go_router.dart';
import 'package:mkp_ecommerce/domain/entity/cart.dart';
import 'package:mkp_ecommerce/domain/entity/product.dart';
import 'package:mkp_ecommerce/presentation/pages/login_page/login_page.dart';
import 'package:mkp_ecommerce/presentation/pages/main_page/main_page.dart';
import 'package:mkp_ecommerce/presentation/pages/oder_confirmation_page/order_confirmation_page.dart';
import 'package:mkp_ecommerce/presentation/pages/order_success_page/order_success_page.dart';
import 'package:mkp_ecommerce/presentation/pages/product_detail_page/product_detail_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
      routes: [
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/main',
          name: 'main',
          builder: (context, state) => const MainPage(),
        ),
        GoRoute(
          path: '/product-detail',
          name: 'product-detail',
          builder: (context, state) => ProductDetailPage(
            product: state.extra as Product,
          ),
        ),
        GoRoute(
          path: '/order-confirmation',
          name: 'order-confirmation',
          builder: (context, state) => OrderConfirmationPage(
            cart: state.extra as Cart,
          ),
        ),
        GoRoute(
          path: '/order-success',
          name: 'order-success',
          builder: (context, state) => const OrderSuccessPage(),
        ),
      ],
      initialLocation: '/login',
      debugLogDiagnostics: false,
    );
