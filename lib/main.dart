import 'package:flutter/material.dart';
import 'package:navigationandrouting/theme.dart';
import 'package:navigationandrouting/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Store',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: CatalogPage(),
    );
  }
}

class CatalogPage extends StatefulWidget {
  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  bool _isDarkTheme = false;

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  final List<Product> products = [
    Product(
      name: 'Face Serum',
      imageUrl: 'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      price: 20.6,
    ),
    Product(
      name: 'Lip Scrub',
      imageUrl: 'https://images.unsplash.com/photo-1599305090598-fe179d501227?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      price: 17.5,
    ),
    Product(
      name: 'Facial Cleanser',
      imageUrl: 'https://images.unsplash.com/photo-1556228720-195a672e8a03?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      price: 25.0,
    ),
    Product(
      name: 'Face Toner',
      imageUrl: 'https://images.unsplash.com/photo-1618479944734-26f9dbd4948d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      price: 50.80,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Store'),
        backgroundColor: Color(0xffBC96E6),
        actions: [
          IconButton(
            icon: Icon(_isDarkTheme ? Icons.light_mode : Icons.dark_mode),
            onPressed: _toggleTheme,
          ),
        ],
      ),
      body: Container(
        color: _isDarkTheme ? AppTheme.primaryColorDark : AppTheme.primaryColorLight, // Custom background color for the catalog
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(product.name),
                      content: Text('Price: \$${product.price}'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: _isDarkTheme
                      ? AppTheme.primaryColorDark.withOpacity(0.9)
                      : AppTheme.primaryColorLight.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 5,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(product.imageUrl, height: 200),
                    const SizedBox(height: 8),
                    Text(product.name, style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _isDarkTheme ? Colors.white : Colors.black,
                    )),
                    const SizedBox(height: 4),
                    Text('\$${product.price}',  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: _isDarkTheme ? Colors.white70 : Colors.black87, // Change text color
                    ),),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
