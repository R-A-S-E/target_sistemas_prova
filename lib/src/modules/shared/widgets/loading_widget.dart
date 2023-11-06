import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.child,
    required this.isLoading,
  });
  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Visibility(
          visible: isLoading,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black38,
            child: const Center(child: CircularProgressIndicator()),
          ),
        )
      ],
    );
  }
}
