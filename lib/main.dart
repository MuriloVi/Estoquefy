import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/product_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    const ProviderScope(
      child: EstoquefyApp(),
    ),
  );
}

class EstoquefyApp extends StatelessWidget {
  const EstoquefyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estoquefy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ProductListScreen(),
    );
  }
}
