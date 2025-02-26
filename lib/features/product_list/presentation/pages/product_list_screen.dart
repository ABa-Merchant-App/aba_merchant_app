import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_app/core/routes.dart';
import 'package:merchant_app/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:merchant_app/features/authentication/presentation/pages/profile_screen.dart';
import 'package:merchant_app/features/products/presentation/manager/merchant_product_bloc.dart';
import 'package:merchant_app/features/products/presentation/manager/merchant_product_state.dart';
import 'package:merchant_app/features/products/presentation/pages/merchant_product_screen.dart';
import 'dart:convert';
import 'dart:typed_data';
class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  int _currentIndex = 1;
  late TextEditingController _searchController;
  late FocusNode _focusNode;
  late List<int> _quantities=[];
  double _totalPrice=0.0;
  int _totalQuantity=0;
  @override
  void initState() {
    super.initState();
    _currentIndex = 1;
    _searchController = TextEditingController();
    _focusNode = FocusNode();
  }

  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _updateTotal() {
    final bloc=BlocProvider.of<MerchantProductBloc>(context);
    final products=bloc.state is ProductsSuccessState ? (bloc.state as ProductsSuccessState).products:[];
    setState(() {
      _totalPrice=0;
      _totalQuantity=0;
      for (int i = 0; i < products.length; i++) {
        double price=double.parse(products[i].price) ?? 0.0;
        _totalPrice += _quantities[i] * price;
        _totalQuantity += _quantities[i];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF025AA2),
        title: const Text('Product List',style: TextStyle(color: Color(0xFFFEDC61)),),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey.withOpacity(0.5)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      enableInteractiveSelection: false, // Disable context menu
                      onTap: () {
                        // Allow focus but prevent the context menu
                        FocusScope.of(context).requestFocus(_focusNode);
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Implement search action here
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF025AA2),
                      foregroundColor: Colors.yellow,
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.yellow),
                        SizedBox(width: 4),
                        Text('Search', style: TextStyle(color: Colors.yellow)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Product List
          Expanded(
            child:BlocBuilder<MerchantProductBloc,MerchantProductState>(
              builder: (context, state) {
              if(state is ProductsLoadingState){
                return const Center(child: CircularProgressIndicator(),);
              }else if(state is ProductsSuccessState){
                return  ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                 if (_quantities.isEmpty || _quantities.length != state.products.length) {
                    _quantities = List.generate(state.products.length, (index) => 0);  // Initialize quantities
                  }
                 String base64String = product.image ?? '';
                                if (base64String.startsWith('data:image')) {
                                  base64String = base64String
                                      .split(',')
                                      .last; // Remove the prefix
                                }
                                Uint8List? decodedImage;
                                try {
                                  decodedImage = base64Decode(base64String);
                                } catch (e) {
                                  print("Error decoding Base64: $e");
                                }
                return Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        decodedImage != null? 
                    Image.memory(
                      decodedImage, // Display the image
                        width: 100,
                        height: 60, // Adjust height as needed
                        fit: BoxFit.cover,
                )
              : Image.asset('assets/images/placeholder.png', // Default image in case of error
                  width: 100,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.productName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xFF025AA2),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                product.description,
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${product.price} ETB',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove, color: Color(0xFF025AA2)),
                                        onPressed: () {
                                          setState(() {
                                            if (_quantities[index] > 0) {
                                              _quantities[index]--;
                                              _updateTotal();
                                            }
                                          });
                                        },
                                      ),
                                      //Text('${product1.quantity}', style: TextStyle(fontSize: 16)),
                                      IconButton(
                                        icon: const Icon(Icons.add, color: Color(0xFF025AA2)),
                                        onPressed: () {
                                          setState(() {
                                           _quantities[index]++;
                                            _updateTotal();
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                
                );
              },
            );
            }else if(state is ProductsFailureState){
              return Center(child: Text("${state.message}"),);
            }
            return Center(child: Text('product no available'),);
            },)
          ),
          // Bottom Navigation Bar
          BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total: ${_totalPrice.toStringAsFixed(2)} ETB', style: const TextStyle(fontSize: 18, color: Color(0xFF025AA2))),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF025AA2),
                    ),
                    onPressed: () {
                      // Implement the generate action here
                      Navigator.pushReplacementNamed(context, AppRoutes.qrGeneration);
                    },
                    child: const Text('Generate', style: TextStyle(color: Color(0xFFFEDC61))),
                  ),
                ],
              ),
            ),
          ),
          CustomBottomNavigationBar(
            currentIndex: _currentIndex,
            backgroundColor: const Color(0xFF025AA2),
            onTap: (index) {
              if (index != _currentIndex) {
                setState(() {
                  _currentIndex = index;
                });
                // Handle navigation based on the selected index
                if (index == 0) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MerchantProductScreen()),
                  );
                } else if (index == 4) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ProfileScreen()),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

