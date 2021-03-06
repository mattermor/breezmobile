import 'package:app_settings/app_settings.dart';
import 'package:breez/bloc/invoice/invoice_bloc.dart';
import 'package:breez/theme_data.dart' as theme;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BarcodeScannerPlaceholder extends StatefulWidget {
  final InvoiceBloc invoiceBloc;

  BarcodeScannerPlaceholder(this.invoiceBloc);

  @override
  State<StatefulWidget> createState() {
    return BarcodeScannerPlaceholderState();
  }
}

class BarcodeScannerPlaceholderState extends State<BarcodeScannerPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
          backgroundColor: Colors.red,
          primaryColor: Colors.yellow,
          canvasColor: Colors.grey),
      home: Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).appBarTheme.iconTheme,
          textTheme: Theme.of(context).appBarTheme.textTheme,
          backgroundColor: Theme.of(context).canvasColor,
          title: GestureDetector(
            onTap: () {
              Clipboard.getData("text/plain").then((clipboardData) {
                if (clipboardData != null) {
                  widget.invoiceBloc.decodeInvoiceSink.add(clipboardData.text);
                  Navigator.pop(context);
                }
              });
            },
            child: Row(children: <Widget>[
              Icon(Icons.content_paste),
              Padding(padding: EdgeInsets.only(left: 8.0)),
              Text(
                "PASTE INVOICE",
                style: TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 0.15,
                    fontWeight: FontWeight.w500),
              )
            ]),
          ),
          elevation: 0.0,
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "For QR scan, please grant Breez access to your camera.",
                  style:
                      Theme.of(context).dialogTheme.contentTextStyle.copyWith(
                            color: Colors.white,
                          ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                ),
                RaisedButton(
                  padding: EdgeInsets.only(
                      top: 8.0, bottom: 8.0, right: 12.0, left: 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.settings,
                        color: theme.buttonStyle.color,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                      ),
                      Text(
                        "App Settings",
                        style: theme.buttonStyle,
                      )
                    ],
                  ),
                  color: theme.BreezColors.white[500],
                  elevation: 0.0,
                  shape: const StadiumBorder(),
                  onPressed: () async {
                    AppSettings.openAppSettings();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
