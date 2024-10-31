import 'package:flutter/material.dart';
import '../widget/AmountInputWidget.dart';
import 'package:digital_payment_system/core/components/ButtonComponent.dart';
import '../controller/TransactionController.dart';
import 'package:digital_payment_system/core/constants/strings.dart';
import 'package:digital_payment_system/core/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:digital_payment_system/providers/balance_provider.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TransactionController _transactionController = TransactionController();
  bool _isDonationEnabled = false;

  void _handleSendMoney() {
    final balanceProvider = context.read<BalanceProvider>();
    _transactionController.sendMoney(
      _amountController.text,
      balanceProvider.balance,
      () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Uang berhasil dikirim!')),
        );
      },
      () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Jumlah tidak valid atau saldo tidak mencukupi.')),
        );
      },
    );
  }

  void _appendAmount(String value) {
    setState(() {
      if (value == '<') {
        // Hapus satu karakter
        if (_amountController.text.isNotEmpty) {
          _amountController.text = _amountController.text
              .substring(0, _amountController.text.length - 1);
        }
      } else {
        // Tambahkan karakter
        _amountController.text += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true, // Menyelaraskan judul ke tengah
        iconTheme: IconThemeData(
            color: Colors.white), // Mengubah warna panah menjadi putih
        title: Text(
          AppStrings.sendMoney,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // UI Donate for Ukraine
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  // Gambar logo donasi
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/ukraine_logo.png'), // Ganti dengan path gambar
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),

                  // Kolom teks
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Donate for Ukraine',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Charitable Foundation',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  Spacer(),

                  // Switch Donasi
                  Switch(
                    value: _isDonationEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isDonationEnabled = value;
                      });
                    },
                    activeColor: Colors.blueAccent,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Tampilan Jumlah Uang
            AmountInputWidget(controller: _amountController),

            // Tombol kecil lonjong lebih dekat di bawah angka
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  ".....1234",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10), // Jarak yang lebih kecil

            // Spacer untuk memberi ruang antara jumlah dan keypad
            Spacer(),

            // Keypad Numerik dengan latar belakang putih dan Tombol Kirim menyatu
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  // Keypad
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 75,
                    physics:
                        NeverScrollableScrollPhysics(), // Disable scrolling
                    children: [
                      for (var i = 1; i <= 9; i++)
                        _buildKeypadButton(i.toString()),
                      _buildKeypadButton('.'),
                      _buildKeypadButton('0'),
                      _buildKeypadButton('<'), // Tombol hapus
                    ],
                  ),
                  SizedBox(height: 30),
                  // Tombol Kirim dengan lebar penuh dikurangi padding 32
                  SizedBox(
                    width: double.infinity,
                    child: ButtonComponent(
                      text: 'Kirim',
                      onPressed: _handleSendMoney,
                    ),
                  ),
                  SizedBox(height: 5)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper untuk membuat tombol keypad
  Widget _buildKeypadButton(String value) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent, // Menghilangkan latar tombol
        elevation: 0, // Menghilangkan bayangan tombol
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(16),
      ),
      onPressed: () => _appendAmount(value),
      child: Text(
        value,
        style: TextStyle(color: Colors.black, fontSize: 28), // Warna teks hitam
      ),
    );
  }
}
