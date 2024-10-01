import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late WebViewController controller;
  bool isLoading = true;
  double progress = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int val) {
            log('WebView started loading');
            progress = val / 100;
            if (mounted) {
              setState(() {});
            }
          },
          onPageStarted: (url) {
            log('WebView started loading: $url');
          },
          onPageFinished: (url) {
            log('WebView finished loading: $url');
            isLoading = false;
            if (mounted) {
              setState(() {});
            }
          },
          onHttpError: (error) {
            log('WebView http error: $error');
          },
          onWebResourceError: (error) {
            log('WebView resource error: ${error.description}');
          },
          onNavigationRequest: (request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://checkout-staging.xendit.co/web/66ee973bf65c4e6d38585f14'));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didpop, result) {
        context.read<CartProductBloc>().add(const CartProductEvent.started());
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.main,
          (route) => false,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Payment'),
        ),
        body: Stack(
          children: [
            WebViewWidget(controller: controller),
            LinearProgressIndicator(
              value: progress,
              color: AppColors.primary,
              backgroundColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
