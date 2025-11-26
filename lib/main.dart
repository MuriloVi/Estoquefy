import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'repositories/supabase_client.dart';
import 'screens/product_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await SupabaseClientConfig.initialize(
    url: 'https://gxhftycwfswwkuxrsjoa.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd4aGZ0eWN3ZnN3d2t1eHJzam9hIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM4Mjg3MDIsImV4cCI6MjA3OTQwNDcwMn0._-WxVNeeND78a9n20XzBvSq0QhYfmICWTgONG0gY8Xs',
  );
  
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
