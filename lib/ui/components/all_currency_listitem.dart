import 'package:flutter/material.dart';
import 'package:flutter_curency_app/model/currency_model.dart';

class AllCurrencyListItem extends StatelessWidget {
  final CurrencyModel currencyModel;

  const AllCurrencyListItem({Key? key, required this.currencyModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.blue.withAlpha(88),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            currencyModel.code.toString(),
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          Text(
            currencyModel
                .value
                ?.toStringAsFixed(2)
                .toString() ??
                "",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ],
      ),
    );
  }
}
