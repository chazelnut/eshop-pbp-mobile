import 'package:flutter/material.dart';
import 'package:eshop_pbp/models/product_entry.dart';
import 'package:eshop_pbp/widgets/left_drawer.dart';
import 'package:eshop_pbp/screens/product_detail.dart';
import 'package:eshop_pbp/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  // Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
  //   // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
  //   // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
  //   // If you using chrome,  use URL http://localhost:8000
    
  //   final response = await request.get('http://localhost:8000/json/');
    
  //   // Decode response to json format
  //   var data = response;
    
  //   // Convert json data to ProductEntry objects
  //   List<ProductEntry> listProduct = [];
  //   for (var d in data) {
  //     if (d != null) {
  //       listProduct.add(ProductEntry.fromJson(d));
  //     }
  //   }
  //   return listProduct;
  // }
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/');

    if (response == null || response is! List) return [];

    List<ProductEntry> listProduct = [];
    for (var item in response) {
      if (item is Map) {
        try {
          // item berformat { "model": ..., "pk": ..., "fields": { ... } }
          listProduct.add(ProductEntry.fromJson(Map<String, dynamic>.from(item)));
        } catch (e) {
          // opsi: log error untuk debugging
          // print('Parsing product gagal: $e');
        }
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      // body: FutureBuilder(
      //   future: fetchProduct(request),
      //   builder: (context, AsyncSnapshot snapshot) {
      //     if (snapshot.data == null) {
      //       return const Center(child: CircularProgressIndicator());
      //     } else {
      //       if (!snapshot.hasData) {
      //         return const Column(
      //           children: [
      //             Text(
      //               'There are no product in emyu shop yet.',
      //               style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
      //             ),
      //             SizedBox(height: 8),
      //           ],
      //         );
      //       } else {
      //         return ListView.builder(
      //           itemCount: snapshot.data!.length,
      //           itemBuilder: (_, index) => ProductEntryCard(
      //             product: snapshot.data![index],
      //             onTap: () {
      //               // Navigate to product detail page
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => ProductDetailPage(
      //                     product: snapshot.data![index],
      //                   ),
      //                 ),
      //               );
      //             },
      //           ),
      //         );
      //       }
      //     }
      //   },
      // ),
      body: FutureBuilder<List<ProductEntry>>(
        future: fetchProduct(request),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final data = snapshot.data;
          if (data == null || data.isEmpty) {
            return const Center(
              child: Text(
                'There are no product in emyu shop yet.',
                style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
              ),
            );
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) => ProductEntryCard(
              product: data[index], // di card gunakan data[index].fields untuk isi
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: data[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}