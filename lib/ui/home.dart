import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_picker_cupertino.dart';
import 'package:country_currency_pickers/country_picker_dropdown.dart';
import 'package:country_currency_pickers/currency_picker_cupertino.dart';
import 'package:country_currency_pickers/currency_picker_dialog.dart';
import 'package:country_currency_pickers/currency_picker_dropdown.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_curency_app/model/currency_model.dart';
import 'package:flutter_curency_app/service/api_service.dart';

import 'components/all_currency_listitem.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();
  String _selectedCurrency = "USD";

  Widget _buildCurrencyDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            const SizedBox(
              width: 8.0,
            ),
            Text("${country.currencyName}"),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<CurrencyModel> currencyModel = snapshot.data ?? [];
          return Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Base Currency",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: CountryPickerDropdown(
                  initialValue: 'us',
                  itemBuilder: _buildCurrencyDropdownItem,
                  onValuePicked: (Country? country) {
                    print("${country?.name}");
                    setState(() {
                      _selectedCurrency = country?.currencyCode ?? "";
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "All Currency",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return AllCurrencyListItem(
                    currencyModel: currencyModel[index],
                  );
                },
                itemCount: currencyModel.length,
              ))
            ],
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      future: apiService.getLatest(_selectedCurrency),
    );
  }
}
