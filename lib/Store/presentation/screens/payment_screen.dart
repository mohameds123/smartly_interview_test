import 'package:flutter/material.dart';

class PayMentScreen extends StatelessWidget {
  const PayMentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Select Your Payment Methode',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'enter a shipping address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.network(
                  'https://static.vecteezy.com/system/resources/previews/005/034/879/original/bank-card-icon-credit-card-vector.jpg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Debit Cart'),
                Spacer(),
                RadioListTile(
                  activeColor: Colors.amber,
                  title:  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.only(left: 22.0),
                    ),
                  ),
                  value: "FIRST", onChanged: (String? value) {  }, groupValue: '',

                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSllwvPblqJnBCuNzL1SgHG4LbxGY8lyHZmjR-kTrcvE_FsDLUlhGd3ReW5UB8-qUPh0Ms&usqp=CAU',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Visa'),
                Spacer(),
                RadioListTile(
                  activeColor: Colors.amber,
                  title:  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.only(left: 22.0),
                    ),
                  ),
                  value: "secound", onChanged: (String? value) {  }, groupValue: '',

                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.network(
                  'https://developer.apple.com/news/images/og/apple-pay-og-twitter.jpg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Apple Pay'),
                Spacer(),
                RadioListTile(
                  activeColor: Colors.amber,
                  title:  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.only(left: 22.0),
                    ),
                  ),
                  value: "third", onChanged: (String? value) {  }, groupValue: '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
