
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wanderlist/routes/app_routes.dart';

class ShellScreen extends ConsumerStatefulWidget {
  final Widget? child;
  const ShellScreen({super.key, required this.child});

  @override
  ConsumerState<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends ConsumerState<ShellScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text("WanderList",
          style: TextStyle(color: Colors.white),),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              context.goNamed(AppRouter.destinationList.name);
            },
          ),
        backgroundColor: const Color.fromARGB(255, 1, 134, 105),
      ),
      body: widget.child
    );
  }
}