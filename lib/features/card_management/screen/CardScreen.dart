import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:digital_payment_system/providers/balance_provider.dart';
import 'package:digital_payment_system/core/constants/colors.dart';
import 'package:digital_payment_system/core/constants/strings.dart';
import '../widgets/CardWidget.dart';
import '../widgets/BalanceWidget.dart';
import 'package:digital_payment_system/core/components/ButtonComponent.dart';
import 'package:digital_payment_system/core/utils/route_utils.dart';
import '../widgets/NavBarWidget.dart'; // Pastikan untuk mengimpor NavBarWidget

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      // Navigasi ke notifikasi
      Navigator.pushNamed(context, '/notifications');
    }
  }

  @override
  Widget build(BuildContext context) {
    final balanceProvider = Provider.of<BalanceProvider>(context);

    return Scaffold(
      backgroundColor: Colors
          .grey[200], // Background abu-abu muda untuk menonjolkan efek rounded
      appBar: AppBar(
        title: Text(AppStrings.appName),
        backgroundColor: AppColors.backgroundColor,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: AppColors.textColor),
            onPressed: () {
              RouteUtils.navigateTo(context, '/notifications');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Bagian atas dengan latar belakang hitam dan border rounded di bagian bawah
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(
                  bottom:
                      8.0), // Tambahkan margin untuk menonjolkan efek rounded
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kumpulan kartu
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                      height: 180,
                      child: GestureDetector(
                        onTap: () {
                          RouteUtils.navigateTo(context, '/card-details');
                        },
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CardWidget(
                                color: AppColors.cardColor1,
                                cardNumber: '1234',
                                expiryDate: '04/26',
                                balance: '\$${balanceProvider.balance}',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Withdraw and Deposit buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonComponent(
                        text: 'Withdraw',
                        onPressed: () {
                          RouteUtils.navigateTo(context, '/send-money');
                        },
                        color: const Color.fromARGB(255, 61, 61, 61),
                        icon: Icons.arrow_upward,
                      ),
                      ButtonComponent(
                        text: 'Deposit',
                        onPressed: () {
                          balanceProvider.deposit(100.0);
                        },
                        color: const Color.fromARGB(255, 61, 61, 61),
                        icon: Icons.arrow_downward,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bagian bawah dengan latar belakang putih
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Notification Section
                  Text(
                    'Notification',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),

                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Donate for Ukraine',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Each coin is a step towards victory!',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.black54, size: 16),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Recent Activity Section
                  Text(
                    'Recent Activity',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),

                  // Recent Activity List
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.pink,
                            child: Icon(Icons.sports_basketball,
                                color: Colors.white),
                          ),
                          title: Text(
                            'Dribbble',
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                            '12 February 2023',
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: Text(
                            '-\$15.00',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(color: Colors.grey),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.yellow,
                            child: Icon(Icons.email, color: Colors.black),
                          ),
                          title: Text(
                            'Mailchimp',
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                            '12 February 2023',
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: Text(
                            '-\$350.00',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi saat tombol tambah ditekan
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
