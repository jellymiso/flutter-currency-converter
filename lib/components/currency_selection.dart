
import 'package:flutter/material.dart';
import 'package:live_exchange_rate_converter/currencies.dart';

class CurrencySelection extends StatelessWidget{

  final String selectedValue;
  final void Function(String?) onSelectionChanged;

  const CurrencySelection({super.key, required this.selectedValue, required this.onSelectionChanged});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Theme( 
      data: Theme.of(context).copyWith(
        splashColor:const Color(0xffDBB86B),
        highlightColor:const Color(0xff224ED0),
        hoverColor:const Color(0xffDBB86B) ,
      ),
      child: DropdownButton(
        menuMaxHeight: screenSize.height * 0.25,
        isDense: true,
        padding: const EdgeInsets.fromLTRB(0,0,0, 0),
        underline: const SizedBox.shrink(),
        iconEnabledColor: const Color(0xffFDFBF6),
        value: selectedValue, 
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xffFDFBF6)),
        dropdownColor: const Color(0xff010059),
        items: [
          for (List<String> currency in currencies)
            DropdownMenuItem(
              value: currency[0].toLowerCase(),
              child: Row(
                children: [ 
                  
                  Image.asset(
                    cacheHeight: 16,
                    cacheWidth: 24,
                    'icons/currency/${currency[0]}.png',
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/images/empty.png', height: 16, width: 24,);
                    },
                    package: 'currency_icons', 
                    height: 16,
                    width: 24,
                  ),
                  const SizedBox(width: 5),
                  Text(currency[0].toUpperCase(), style: const TextStyle(color: Color(0xffFDFBF6)),)
                ]
              )
            )
        ], onChanged: onSelectionChanged
      )
    );
  }

}