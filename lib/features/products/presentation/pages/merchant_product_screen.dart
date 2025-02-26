import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_app/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:merchant_app/features/authentication/presentation/pages/profile_screen.dart';
import 'package:merchant_app/features/cashers/presentation/manager/casher_profile_bloc.dart';
import 'package:merchant_app/features/cashers/presentation/manager/casher_profile_state.dart';
import 'package:merchant_app/features/product_list/presentation/pages/product_list_screen.dart';
import 'package:merchant_app/features/products/presentation/manager/merchant_product_bloc.dart';
import 'package:merchant_app/features/products/presentation/manager/merchant_product_event.dart';
import 'package:merchant_app/features/products/presentation/manager/merchant_product_state.dart';
import 'package:merchant_app/l10n/app_localizations.dart';
import 'package:merchant_app/main.dart';

class MerchantProductScreen extends StatefulWidget {
  @override
  _MerchantProductScreenState createState() => _MerchantProductScreenState();
}

class _MerchantProductScreenState extends State<MerchantProductScreen> {
  String? _selectedLanguage;
  final List<String> _languages = ['English', 'Amharic'];
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    context.read<MerchantProductBloc>().add(FetchProductsEvent());
  }
  Widget build(BuildContext context) {
       final localization = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  Text(localization?.translate('dashboardTitle') ?? 'Dashboard',style: const TextStyle(color: Color(0xFFFEDC61)),),
        backgroundColor: const Color(0xFF025AA2),
      
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 20,
                  child:  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 430,
                            height: 198,
                            decoration:
                                const BoxDecoration(color: Color(0xFF025AA2)),
                          ),
                        ),
                        BlocBuilder<CasherProfileBloc, CasherProfileState>(
                            builder: (context, state) {
                          if (state is CasherLoadingState) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is CasherFailureState) {
                            final message = state.message;
                            return Center(child: Text(message));
                          } else if (state is CasherSuccessState) {
                            final casherInfo = state.casherProfileEntity.data;
                            return Positioned(
                              left: 13,
                              top: 51,
                              child: Container(
                                width: 283,
                                height: 97,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Text(
                                        casherInfo.merchantId.companyName,
                                        style: const TextStyle(
                                          color: Color(0xFFFEDC61),
                                          fontSize: 32,
                                          fontFamily: 'Baloo Paaji',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 98,
                                      top: 66,
                                      child: Opacity(
                                        opacity: 0.90,
                                        child: Text(
                                          casherInfo.fullName,
                                          style:const  TextStyle(
                                            color: Color(0xFFFEDC61),
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      left: 10,
                                      top: 83,
                                      child: Opacity(
                                        opacity: 0.90,
                                        child: Text(
                                          'Merchant ID:',
                                          style: TextStyle(
                                            color: Color(0xFFFEDC61),
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      left: 9,
                                      top: 66,
                                      child: Opacity(
                                        opacity: 0.90,
                                        child: Text(
                                          'Casher Name:',
                                          style: TextStyle(
                                            color: Color(0xFFFEDC61),
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 10,
                                      top: 49,
                                      child: Opacity(
                                        opacity: 0.90,
                                        child: Text(
                                          casherInfo
                                              .merchantId.merchantAccountNumber,
                                          style: const TextStyle(
                                            color: Color(0xFFFEDC61),
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 98,
                                      top: 83,
                                      child: Opacity(
                                        opacity: 0.90,
                                        child: Text(
                                          casherInfo.merchantId.merchantId,
                                          style: const TextStyle(
                                            color: Color(0xFFFEDC61),
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return const Center(child: Text('No Data'));
                          }
                        }),
                        Positioned(
                          left: 42,
                          top: 165,
                          child: Container(
                            width: 362,
                            height: 66,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 362,
                                    height: 66,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 362,
                                            height: 66,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              shadows: const [
                                                BoxShadow(
                                                  color: Color(0x19025AA2),
                                                  blurRadius: 1,
                                                  offset: Offset(0, 1),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 173,
                                          top: 0,
                                          child: Opacity(
                                            opacity: 0.10,
                                            child: Transform(
                                              transform: Matrix4.identity()
                                                ..translate(0.0, 0.0)
                                                ..rotateZ(1.57),
                                              child: Container(
                                                width: 66,
                                                decoration:
                                                    const ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      width: 0.90,
                                                      strokeAlign: BorderSide
                                                          .strokeAlignCenter,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 198,
                                  top: 9,
                                  child: Container(
                                    width: 108,
                                    height: 47,
                                    child: const Stack(
                                      children: [
                                        Positioned(
                                          left: 60,
                                          top: 24,
                                          child: SizedBox(
                                            width: 28.07,
                                            child: Text(
                                              '56',
                                              style: TextStyle(
                                                color: Color(0xFF025AA2),
                                                fontSize: 20,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: SizedBox(
                                            width: 108,
                                            child: Opacity(
                                              opacity: 0.50,
                                              child: Text(
                                                'Total Customer',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 31,
                                  top: 33,
                                  child: SizedBox(
                                    width: 97,
                                    child: Text(
                                      '35,000.50',
                                      style: TextStyle(
                                        color: Color(0xFF025AA2),
                                        fontSize: 20,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 298,
                  child: Container(
                    width: 430,
                    height: 166,
                    decoration: const BoxDecoration(color: Color(0x07030405)),
                  ),
                ),
                const Positioned(
                  left: 12,
                  top: 476,
                  child: Text(
                    'Recent Transaction ',
                    style: TextStyle(
                      color: Color(0xFF025AA2),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Positioned(
                  left: 13,
                  top: 267,
                  child: Text(
                    'Products',
                    style: TextStyle(
                      color: Color(0xFF025AA2),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Positioned(
                  left: 353,
                  top: 497,
                  child: SizedBox(
                    width: 51,
                    height: 16,
                    child: Text(
                      'See All',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF025AA2),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 362,
                  top: 449,
                  child: SizedBox(
                    width: 43,
                    height: 4,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 12,
                            height: 4,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFEDC61),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 18,
                          top: 0,
                          child: Opacity(
                            opacity: 0.70,
                            child: Container(
                              width: 9,
                              height: 4,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF025AA2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 33,
                          top: 0,
                          child: Opacity(
                            opacity: 0.70,
                            child: Container(
                              width: 10,
                              height: 4,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF025AA2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 521,
                  child: SizedBox(
                    width: 430,
                    height: 67,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: SizedBox(
                            width: 430,
                            height: 67,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 1,
                                  top: -0,
                                  child: Container(
                                    width: 429,
                                    height: 67,
                                    decoration: const BoxDecoration(
                                        color: Color(0x0C025AA2)),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 59,
                                    height: 67,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFF025AA2)),
                                  ),
                                ),
                                const Positioned(
                                  left: 72,
                                  top: 9,
                                  child: SizedBox(
                                    width: 90,
                                    height: 17,
                                    child: Text(
                                      'Ermiyas Damte',
                                      style: TextStyle(
                                        color: Color(0xFF025AA2),
                                        fontSize: 13,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 72,
                                  top: 27,
                                  child: SizedBox(
                                    width: 78,
                                    height: 13.81,
                                    child: Opacity(
                                      opacity: 0.30,
                                      child: Text(
                                        '990000000123',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 72,
                                  top: 26,
                                  child: SizedBox(
                                    width: 318,
                                    height: 32.17,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: SizedBox(
                                            width: 318,
                                            height: 31,
                                            child: Stack(
                                              children: [
                                                const Positioned(
                                                  left: 266,
                                                  top: 0,
                                                  child: SizedBox(
                                                    width: 52,
                                                    height: 30,
                                                    child: Text(
                                                      '520',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xCC025AA2),
                                                        fontSize: 16,
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  top: 17,
                                                  child: SizedBox(
                                                    width: 58,
                                                    height: 14,
                                                    child: Opacity(
                                                      opacity: 0.90,
                                                      child: Text(
                                                        '18/03/2024',
                                                        style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.4099999964237213),
                                                          fontSize: 10,
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          left: 300,
                                          top: 19,
                                          child: SizedBox(
                                            width: 40,
                                            height: 25,
                                            child: Text(
                                              'ETB',
                                              style: TextStyle(
                                                color: Color(0xFF025AA2),
                                                fontSize: 10,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 329,
                  child: SizedBox(
                    width: 406,
                    height: 104.33, // Fixed height for the card container
                    child: Container(
                      decoration: ShapeDecoration(
                        color: const Color(0xFFEFF8FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: BlocBuilder<MerchantProductBloc,
                          MerchantProductState>(
                        builder: (context, state) {
                          if (state is ProductsLoadingState) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is ProductsSuccessState) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                final product = state.products[index];
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
                                return Container(
                                  width: 120, // Width for each product card
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                              child: SingleChildScrollView(
                                  child: Card(
                                    
                                    elevation:
                                        4, // Increased shadow for a smarter look
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // Rounded corners
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              12),
                                               child: decodedImage != null
              ? Image.memory(
                  decodedImage, // Display the image
                  width: 100,
                  height: 60, // Adjust height as needed
                  fit: BoxFit.cover,
                )
              : Image.asset('assets/images/placeholder.png', // Default image in case of error
                  width: 100,
                  height: 60,
                  fit: BoxFit.cover,
                ),// Match card corners
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.zero,
                                          child: Column(
                                            children: [
                                              Text(
                                                product.productName,
                                                style: const TextStyle(
                                                  color: Color(0xFF025AA2),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                '${product.price} Birr',
                                                style: const TextStyle(
                                                  color: Color(0xFF025AA2),
                                                  fontSize: 12,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                  )),
                                  ),
                                );
                              },
                            );
                          } else if (state is ProductsFailureState) {
                            return Center(
                                child: Text('Error: ${state.message}'));
                          }
                          return const Center(child: Text('No data available'));
                        },
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 373,
                  top: 303,
                  child: Text(
                    'more',
                    style: TextStyle(
                      color: Color(0xFF025AA2),
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
               Positioned(
                  left: 341,
                  top: 47,
                  child: PopupMenuButton<String>(
        onSelected: (String value) {
                Locale newLocale = value == 'Amharic' ? Locale('am', '') : Locale('en', '');
                final myAppState = context.findAncestorStateOfType<MyAppState>();
                myAppState?.setLocale(newLocale);
              },
        icon: Text(
          localization?.locale.languageCode == 'am' ? 'አማርኛ' : 'English',
          style: const TextStyle(
            color: Color(0xFFFEDC63),
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
        itemBuilder: (BuildContext context) {
          return _languages.map((String language) {
            return PopupMenuItem<String>(
              value: language,
              child: Text(
                language,
                style: const TextStyle(
                  color: Color(0xFF025AA2),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList();
        },
      ),
                ),
                const Positioned(
                  left: 65,
                  top: 198,
                  child: SizedBox(
                    width: 59.96,
                    child: Opacity(
                      opacity: 0.50,
                      child: Text(
                        'Total Earn',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor:const  Color(0xFF025AA2),
        onTap: (index) {
          if(index!=_currentIndex){
          setState(() {
            _currentIndex = index; // Update current index on tap
          });
          if (index == 0) {
            debugPrint('print index: $index');
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MerchantProductScreen()),
            );
          }
           if (index == 1) {
            debugPrint('print index: $index');
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProductListScreen()),
            );
          }
          if (index == 2) {
            debugPrint('print index: $index');
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) =>  ProductListScreen()),
            // );
          }
           if (index == 3) {
            debugPrint('print index: $index');
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => MerchantProductScreen()),
            // );
          }
           if (index == 4) {
            debugPrint('print index: $index');
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          }
          }
        },
      ),
    );
  }
}
