import 'package:flutter/material.dart';
import 'package:merchant_app/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:merchant_app/features/menu/presentation/pages/menu_screen.dart';
import 'package:merchant_app/features/product_list/presentation/pages/product_list_screen.dart';
import 'package:merchant_app/features/products/presentation/pages/merchant_product_screen.dart';
import 'package:merchant_app/l10n/app_localizations.dart';
import 'package:merchant_app/main.dart';
import 'package:share_plus/share_plus.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 4;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        // Initialize the index on the first frame if needed
        _currentIndex = 4;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations=AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  Text(localizations?.translate('Profile') ?? 'Profile',style: const TextStyle(color: Color(0xFFFEDC61))),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                    'assets/images/desu.png'), // Your image path here
              ),
             const  SizedBox(width: 16),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(localizations?.translate('fullname') ?? 'Desalegn Birhanu',  style: const TextStyle(fontSize: 24)),
                      const SizedBox(height: 8),
                      const Text('Software Engineer', style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 40),
                    ]),
              ),
            ],
          ), // Divider for better separation

          // Menu Items
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.person),
                SizedBox(
                  width: 10,
                ),
                Text('My Profile'),
              ],
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.purple,
            ),
            onTap: () {
            _showPopupMenu(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Row(children: [
              Icon(Icons.language),
              SizedBox(
                width: 10,
              ),
              Text('Language'),
            ]),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.purple,
            ), // Arrow icon
            onTap: () {
              // Show modal dialog for language selection
              showLanguageDialog(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.security),
                SizedBox(
                  width: 10,
                ),
                Text('Security')
              ],
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.purple,
            ),
            onTap: () {
              // Navigate to security settings
            },
          ),
          const Divider(),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.help),
                SizedBox(
                  width: 10,
                ),
                Text('Help & Support')
              ],
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.purple,
            ),
            onTap: () {
              // Navigate to help & support
            },
          ),
          const Divider(),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.settings),
                SizedBox(
                  width: 10,
                ),
                Text('Settings')
              ],
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.purple,
            ),
            onTap: () {
              // Navigate to settings
            },
          ),
          const Divider(),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.share),
                SizedBox(
                  width: 10,
                ),
                Text('Share')
              ],
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.purple,
            ),
            onTap: ()  {
              try{
                Size size = MediaQuery.of(context).size;
                double screenWidth = size.width;
               double screenHeight = size.height;
              Share.share("share me",
              sharePositionOrigin: Rect.fromLTWH(0, 0, screenWidth, 
             screenHeight));
              }catch(e){
                print('print $e');
              }
            },
          ),
          const Divider(),
          Center(
            child: Align(
              alignment: Alignment.center,
              child: ListTile(
                title: const Text(
                  'Logout',
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  // Logout action
                },
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor:const  Color(0xFF025AA2),
        onTap: (index) {
          if (index != _currentIndex) {
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
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => const ProfileScreen()),
            // );
          }
          }
        },
      ),
    );
  }
void _showPopupMenu(BuildContext context) async {
        final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;

    // Get the position of the ListTile
     // Get the position of the ListTile
    final RenderBox listTile = context.findRenderObject() as RenderBox;
    final Offset offset = listTile.localToGlobal(Offset.zero);

    // Calculate the position to show the menu parallel to the ListTile
    final double xPosition = offset.dx + listTile.size.width; // Position to the right of the ListTile
    final double yPosition = offset.dy; // Align vertically

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(xPosition, yPosition-10, 0.0, 0.0),
      items: [
        PopupMenuItem<String>(
          value: 'change_password',
          child: Row(
            children: const [
              Icon(Icons.lock),
              SizedBox(width: 10),
              Text('Change Password'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'forget_password',
          child: Row(
            children: const [
              Icon(Icons.forum),
              SizedBox(width: 10),
              Text('Forget Password'),
            ],
          ),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      // Handle menu item selection
      if (value == 'change_password') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MenuScreen()),
        );
      } else if (value == 'forget_password') {
        Navigator.of(context);
      }
    });
  }
}
  void showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                onTap: () {
                   Locale newLocale =  const Locale('en', '');
                final myAppState = context.findAncestorStateOfType<MyAppState>();
                myAppState?.setLocale(newLocale);
                Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Amharic'),
                onTap: () {
                   Locale newLocale = const Locale('am', '');
                final myAppState = context.findAncestorStateOfType<MyAppState>();
                myAppState?.setLocale(newLocale);
                 Navigator.pop(context);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

