import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/wallet_provider.dart';
import 'wallet__main_screen.dart';

class WidrawalScreen extends StatefulWidget {
  const WidrawalScreen({Key? key}) : super(key: key);

  @override
  _WidrawalScreenState createState() => _WidrawalScreenState();
}

class _WidrawalScreenState extends State<WidrawalScreen> {
  int selectedAmount = 0;

  TextEditingController customAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Withdrawal",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                            "Select Bank Account:",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        TextFormField(),
                      ],
                    ),


                ),
              ),

              const SizedBox(height: 20),
              //enter the amount
              Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                      child: Text("Withdrawal Amount"),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        "RM",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        controller: customAmountController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            selectedAmount = int.tryParse(value) ?? 0;
                          });
                        },

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Transferable Balance: RM${walletProvider.balance.toStringAsFixed(2)}"),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //receipt
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 10,),
                      Text("Withdrawal Amount: RM$selectedAmount", style: const TextStyle(fontWeight: FontWeight.normal),),
                      Text("Total amount: RM${selectedAmount.toString()}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.fromLTRB(70, 10, 15, 10),
                child: Text("The money will be transfered to your bank within three working days"),
              ),

              const SizedBox(height: 10),
              //submit button
              // ...



          // ...


            ],
          ),
          Center(
            child: Container(
              width: double.infinity, // Adjust the width as needed
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0))
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    double withdrawalAmount = selectedAmount.toDouble();

                    // If custom amount is entered, use that instead
                    if (customAmountController.text.isNotEmpty) {
                      withdrawalAmount = double.tryParse(customAmountController.text) ?? 0.0;
                    }
                    _withdrawalSuccessAllert(context);

                    // Check if withdrawal amount is less than balance
                    if (withdrawalAmount > walletProvider.balance) {
                      // Display an error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Withdrawal amount cannot be greater than your balance.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      // Withdrawal is valid, proceed with the transfer
                      walletProvider.Withdrawal(withdrawalAmount);
                    };


                  },
                  child: const Text(
                    'Withdraw Now',
                    style: TextStyle(
                        color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTopUpButton(String amount) {
    bool isSelected = selectedAmount == int.parse(amount);
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAmount = int.parse(amount);
          customAmountController.clear();
        });
      },
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
              width: 1.5),
        ),
        alignment: Alignment.center,
        child: Text(
          amount,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: isSelected ? Theme.of(context).primaryColor
                : Colors.grey,),
        ),
      ),
    );
  }
  void _withdrawalSuccessAllert (BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Withdrawal"),
            content: Container(
              height: 80,
              child: Column(
                children: [
                  Text(
                    "RM ${selectedAmount.toString()} has been deducted from your account",
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),

                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WalletScreen()));
                },
                child: const Text("Close"),
              ),
            ],


          );
        });

  }
}
