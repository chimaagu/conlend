import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  WebViewController? _controller;
  bool _isLoading = true; // Flag to track loading state

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false; // Set to false when page finishes loading
            });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint(error.description.toString());
          },
        ),
      )
      ..loadRequest(
        Uri.parse("https://billp.biz/auth-register"),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(
              controller: _controller!,
            ),
            if (_isLoading) // Show CircularProgressIndicator while loading
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
