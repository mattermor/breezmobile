import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:breez/bloc/account/account_bloc.dart';
import 'package:breez/bloc/account/account_model.dart';
import 'package:breez/bloc/account/fiat_conversion.dart';
import 'package:breez/bloc/blocs_provider.dart';
import 'package:breez/bloc/invoice/actions.dart';
import 'package:breez/bloc/invoice/invoice_bloc.dart';
import 'package:breez/bloc/invoice/invoice_model.dart';
import 'package:breez/bloc/pos_catalog/actions.dart';
import 'package:breez/bloc/pos_catalog/bloc.dart';
import 'package:breez/bloc/pos_catalog/model.dart';
import 'package:breez/bloc/user_profile/breez_user_model.dart';
import 'package:breez/bloc/user_profile/currency.dart';
import 'package:breez/bloc/user_profile/user_profile_bloc.dart';
import 'package:breez/routes/charge/currency_wrapper.dart';
import 'package:breez/routes/charge/sale_view.dart';
import 'package:breez/theme_data.dart' as theme;
import 'package:breez/utils/min_font_size.dart';
import 'package:breez/widgets/breez_dropdown.dart';
import 'package:breez/widgets/error_dialog.dart';
import 'package:breez/widgets/flushbar.dart';
import 'package:breez/widgets/loader.dart';
import 'package:breez/widgets/pos_payment_dialog.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../status_indicator.dart';
import 'items/items_list.dart';

class POSInvoice extends StatefulWidget {
  POSInvoice();

  @override
  State<StatefulWidget> createState() {
    return POSInvoiceState();
  }
}

class POSInvoiceState extends State<POSInvoice> {
  TextEditingController _invoiceDescriptionController = TextEditingController();
  double itemHeight;
  double itemWidth;

  // double amount = 0;
  double currentAmount = 0;
  bool _useFiat = false;
  CurrencyWrapper currentCurrency;
  bool _isKeypadView = true;

  StreamSubscription accountSubscription;

  @override
  void didChangeDependencies() {
    itemHeight = (MediaQuery.of(context).size.height - kToolbarHeight - 16) / 4;
    itemWidth = (MediaQuery.of(context).size.width) / 2;
    if (accountSubscription == null) {
      AccountBloc accountBloc = AppBlocsProvider.of<AccountBloc>(context);
      accountSubscription = accountBloc.accountStream.listen((acc) {
        currentCurrency = _useFiat
            ? CurrencyWrapper.fromFiat(acc.fiatCurrency)
            : CurrencyWrapper.fromBTC(acc.currency);
      });
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    accountSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AccountBloc accountBloc = AppBlocsProvider.of<AccountBloc>(context);
    InvoiceBloc invoiceBloc = AppBlocsProvider.of<InvoiceBloc>(context);
    UserProfileBloc userProfileBloc =
        AppBlocsProvider.of<UserProfileBloc>(context);
    PosCatalogBloc posCatalogBloc =
        AppBlocsProvider.of<PosCatalogBloc>(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: StreamBuilder<Sale>(
          stream: posCatalogBloc.currentSaleStream,
          builder: (context, saleSnapshot) {
            var currentSale = saleSnapshot.data;
            return GestureDetector(
              onTap: () {
                // call this method here to hide soft keyboard
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Builder(builder: (BuildContext context) {
                return StreamBuilder<BreezUserModel>(
                    stream: userProfileBloc.userStream,
                    builder: (context, snapshot) {
                      var userProfile = snapshot.data;
                      if (userProfile == null) {
                        return Loader();
                      }
                      return StreamBuilder<AccountModel>(
                          stream: accountBloc.accountStream,
                          builder: (context, snapshot) {
                            var accountModel = snapshot.data;
                            if (accountModel == null) {
                              return Loader();
                            }
                            double totalAmount =
                                currentCurrency.satConversionRate *
                                        currentSale.totalChargeSat.toInt() +
                                    currentAmount;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        StreamBuilder<AccountSettings>(
                                            stream: accountBloc
                                                .accountSettingsStream,
                                            builder:
                                                (settingCtx, settingSnapshot) {
                                              AccountSettings settings =
                                                  settingSnapshot.data;
                                              if (settings?.showConnectProgress ==
                                                      true ||
                                                  accountModel
                                                          .isInitialBootstrap ==
                                                      true) {
                                                return StatusIndicator(
                                                    context, snapshot.data);
                                              }
                                              return SizedBox();
                                            }),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 0.0,
                                              left: 16.0,
                                              right: 16.0,
                                              bottom: 24.0),
                                          child: ConstrainedBox(
                                            constraints: const BoxConstraints(
                                                minWidth: double.infinity),
                                            child: IgnorePointer(
                                              ignoring: false,
                                              child: RaisedButton(
                                                color: Theme.of(context)
                                                    .primaryColorLight,
                                                padding: EdgeInsets.only(
                                                    top: 14.0, bottom: 14.0),
                                                child: Text(
                                                  "Charge ${currentCurrency.format(totalAmount)} ${currentCurrency.shortName}"
                                                      .toUpperCase(),
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: theme
                                                      .invoiceChargeAmountStyle,
                                                ),
                                                onPressed: () =>
                                                    onInvoiceSubmitted(
                                                        currentSale,
                                                        invoiceBloc,
                                                        userProfile,
                                                        accountModel),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 24),
                                          child: _buildViewSwitch(context),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 0.0, right: 16.0),
                                          child: Row(children: <Widget>[
                                            Expanded(
                                                child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: GestureDetector(
                                                        behavior:
                                                            HitTestBehavior
                                                                .translucent,
                                                        onTap: () {
                                                          var currentSaleRoute =
                                                              CupertinoPageRoute(
                                                                  fullscreenDialog:
                                                                      true,
                                                                  builder: (_) =>
                                                                      SaleView(
                                                                        onCharge: () => onInvoiceSubmitted(
                                                                            currentSale,
                                                                            invoiceBloc,
                                                                            userProfile,
                                                                            accountModel),
                                                                        onDeleteSale:
                                                                            () =>
                                                                                approveClear(currentSale),
                                                                        useFiat:
                                                                            _useFiat,
                                                                      ));
                                                          Navigator.of(context)
                                                              .push(
                                                                  currentSaleRoute);
                                                        },
                                                        child: Badge(
                                                          position:
                                                              BadgePosition
                                                                  .topRight(
                                                                      top: 5,
                                                                      right:
                                                                          -10),
                                                          animationType:
                                                              BadgeAnimationType
                                                                  .scale,
                                                          badgeColor: Theme.of(context).floatingActionButtonTheme.backgroundColor,
                                                          badgeContent: Text(
                                                            currentSale
                                                                .saleLines
                                                                .length
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20.0,
                                                                    bottom: 8.0,
                                                                    right: 4.0,
                                                                    top: 20.0),
                                                            child: Image.asset(
                                                              "src/icon/cart.png",
                                                              width: 24.0,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryTextTheme
                                                                  .button
                                                                  .color,
                                                            ),
                                                          ),
                                                        )))),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.0),
                                                    child: Text(
                                                      _isKeypadView
                                                          ? currentCurrency
                                                              .format(
                                                                  currentAmount)
                                                          : "",
                                                      maxLines: 1,
                                                      style: theme
                                                          .invoiceAmountStyle
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline
                                                                  .color),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Theme(
                                                data: Theme.of(context)
                                                    .copyWith(
                                                        canvasColor: Theme.of(
                                                                context)
                                                            .backgroundColor),
                                                child: new StreamBuilder<
                                                        AccountSettings>(
                                                    stream: accountBloc
                                                        .accountSettingsStream,
                                                    builder: (settingCtx,
                                                        settingSnapshot) {
                                                      return StreamBuilder<
                                                              AccountModel>(
                                                          stream: accountBloc
                                                              .accountStream,
                                                          builder: (context,
                                                              snapshot) {
                                                            List<CurrencyWrapper>
                                                                currencies =
                                                                Currency
                                                                    .currencies
                                                                    .map((c) =>
                                                                        CurrencyWrapper
                                                                            .fromBTC(c))
                                                                    .toList();
                                                            currencies
                                                              ..addAll(accountModel
                                                                  .fiatConversionList
                                                                  .map((f) =>
                                                                      CurrencyWrapper
                                                                          .fromFiat(
                                                                              f)));

                                                            return DropdownButtonHideUnderline(
                                                              child:
                                                                  ButtonTheme(
                                                                alignedDropdown:
                                                                    true,
                                                                child:
                                                                    BreezDropdownButton(
                                                                        onChanged: (value) => changeCurrency(
                                                                            value,
                                                                            userProfileBloc),
                                                                        iconEnabledColor: Theme.of(context)
                                                                            .textTheme
                                                                            .headline
                                                                            .color,
                                                                        value: currentCurrency
                                                                            .shortName,
                                                                        style: theme.invoiceAmountStyle.copyWith(
                                                                            color: Theme.of(context)
                                                                                .textTheme
                                                                                .headline
                                                                                .color),
                                                                        items: Currency.currencies.map((Currency
                                                                            value) {
                                                                          return DropdownMenuItem<
                                                                              String>(
                                                                            value:
                                                                                value.tickerSymbol,
                                                                            child:
                                                                                Text(
                                                                              value.tickerSymbol.toUpperCase(),
                                                                              textAlign: TextAlign.right,
                                                                              style: theme.invoiceAmountStyle.copyWith(color: Theme.of(context).textTheme.headline.color),
                                                                            ),
                                                                          );
                                                                        }).toList()
                                                                          ..addAll(
                                                                            accountModel.fiatConversionList.map((FiatConversion
                                                                                fiat) {
                                                                              return new DropdownMenuItem<String>(
                                                                                value: fiat.currencyData.shortName,
                                                                                child: new Text(
                                                                                  fiat.currencyData.shortName,
                                                                                  textAlign: TextAlign.right,
                                                                                  style: theme.invoiceAmountStyle.copyWith(color: Theme.of(context).textTheme.headline.color),
                                                                                ),
                                                                              );
                                                                            }).toList(),
                                                                          )),
                                                              ),
                                                            );
                                                          });
                                                    })),
                                          ]),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.29),
                                Expanded(
                                    child: _isKeypadView
                                        ? _numPad(posCatalogBloc, currentSale)
                                        : _itemsView(currentSale, accountModel,
                                            posCatalogBloc))
                              ],
                            );
                          });
                    });
              }),
            );
          }),
    );
  }

  Widget _buildViewSwitch(BuildContext context) {
    // This method is a work-around to center align the buttons
    // Use Align to stick items to center and set padding to give equal distance
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => _changeView(true),
                child: Padding(
                  padding: EdgeInsets.only(right: itemWidth / 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.dialpad,
                            color: Theme.of(context)
                                .primaryTextTheme
                                .button
                                .color
                                .withOpacity(_isKeypadView ? 1 : 0.5)),
                      ),
                      Text(
                        "Keypad",
                        style: Theme.of(context).textTheme.button.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .button
                                .color
                                .withOpacity(_isKeypadView ? 1 : 0.5)),
                      )
                    ],
                  ),
                )),
          ),
        ),
        Container(
          height: 20,
          child: VerticalDivider(
            color: Theme.of(context).primaryTextTheme.button.color,
          ),
        ),
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => _changeView(false),
                child: Padding(
                  padding: EdgeInsets.only(left: itemWidth / 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.playlist_add,
                            color: Theme.of(context)
                                .primaryTextTheme
                                .button
                                .color
                                .withOpacity(!_isKeypadView ? 1 : 0.5)),
                      ),
                      Text(
                        "Items",
                        style: Theme.of(context).textTheme.button.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .button
                                .color
                                .withOpacity(!_isKeypadView ? 1 : 0.5)),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }

  _changeView(bool isKeypadView) {
    setState(() {
      _isKeypadView = isKeypadView;
    });
  }

  _itemsView(Sale currentSale, AccountModel accountModel,
      PosCatalogBloc posCatalogBloc) {
    return StreamBuilder(
      stream: posCatalogBloc.itemsStream,
      builder: (context, snapshot) {
        var posCatalog = snapshot.data;
        if (posCatalog == null) {
          return Loader();
        }
        return Scaffold(
          body: _buildCatalogContent(
              currentSale, accountModel, posCatalogBloc, posCatalog),
          floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.add,
              ),
              backgroundColor: Theme.of(context).buttonColor,
              foregroundColor: Theme.of(context).textTheme.button.color,
              onPressed: () => Navigator.of(context).pushNamed("/create_item")),
        );
      },
    );
  }

  _buildCatalogContent(Sale currentSale, AccountModel accountModel,
      PosCatalogBloc posCatalogBloc, List<Item> catalogItems) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView(
        primary: false,
        shrinkWrap: true,
        children: <Widget>[
/*        TextField(
            onChanged: (value) {},
            enabled: catalogItems != null,
            decoration: InputDecoration(
                hintText: "Search Items",
                prefixIcon: Icon(Icons.search),
                border: UnderlineInputBorder()),
          ),*/
          catalogItems?.length == 0
              ? Padding(
                  padding: const EdgeInsets.only(
                      top: 180.0, left: 40.0, right: 40.0),
                  child: AutoSizeText(
                    "No items to display.\nAdd items to this view using the '+' button.",
                    textAlign: TextAlign.center,
                    minFontSize: MinFontSize(context).minFontSize,
                    stepGranularity: 0.1,
                  ),
                )
              : ItemsList(
                  accountModel,
                  posCatalogBloc,
                  catalogItems,
                  (item) =>
                      _addItem(posCatalogBloc, currentSale, accountModel, item))
        ],
      ),
    );
  }

  onInvoiceSubmitted(Sale currentSale, InvoiceBloc invoiceBloc,
      BreezUserModel user, AccountModel account) {
    if (user.name == null || user.avatarURL == null) {
      String errorMessage = "Please";
      if (user.name == null) errorMessage += " enter your business name";
      if (user.avatarURL == null && user.name == null) errorMessage += " and ";
      if (user.avatarURL == null) errorMessage += " select a business logo";
      return showDialog<Null>(
          useRootNavigator: false,
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Required Information",
                style: Theme.of(context).dialogTheme.titleTextStyle,
              ),
              contentPadding: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
              content: SingleChildScrollView(
                child: Text("$errorMessage in the Settings screen.",
                    style: Theme.of(context).dialogTheme.contentTextStyle),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Go to Settings",
                      style: Theme.of(context).primaryTextTheme.button),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/settings");
                  },
                ),
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            );
          });
    } else {
      var satAmount = currentSale.totalChargeSat +
          (currentCurrency.satConversionRate * currentAmount).toInt();
      if (satAmount == 0) {
        return null;
      }

      if (satAmount > account.maxAllowedToReceive) {
        promptError(
            context,
            "You don't have the capacity to receive such payment.",
            Text(
                "Maximum payment size you can receive is ${account.currency.format(account.maxAllowedToReceive, includeDisplayName: true)}. Please enter a smaller value.",
                style: Theme.of(context).dialogTheme.contentTextStyle));
        return;
      }

      if (satAmount > account.maxPaymentAmount) {
        promptError(
            context,
            "You have exceeded the maximum payment size.",
            Text(
                "Maximum payment size on the Lightning Network is ${account.currency.format(account.maxPaymentAmount, includeDisplayName: true)}. Please enter a smaller value or complete the payment in multiple transactions.",
                style: Theme.of(context).dialogTheme.contentTextStyle));
        return;
      }

      var newInvoiceAction = NewInvoice(InvoiceRequestModel(user.name,
          _invoiceDescriptionController.text, user.avatarURL, satAmount,
          expiry: Int64(user.cancellationTimeoutValue.toInt())));
      invoiceBloc.actionsSink.add(newInvoiceAction);
      newInvoiceAction.future.then((value) {
        return showPaymentDialog(invoiceBloc, user, value as String);
      }).catchError((error) {
        showFlushbar(context,
            message: error.toString(), duration: Duration(seconds: 10));
      });
    }
  }

  Future showPaymentDialog(
      InvoiceBloc invoiceBloc, BreezUserModel user, String payReq) {
    return showDialog<bool>(
        useRootNavigator: false,
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return PosPaymentDialog(invoiceBloc, user, payReq);
        }).then((result) {
      setState(() {
        clearSale();
      });
    });
  }

  onAddition(PosCatalogBloc posCatalogBloc, Sale currentSale,
      double satConversionRate) {
    setState(() {
      var newSale = currentSale.addCustomItem(
          currentAmount, currentCurrency.shortName, satConversionRate);
      posCatalogBloc.actionsSink.add(SetCurrentSale(newSale));
      currentAmount = 0;
    });
  }

  _addItem(PosCatalogBloc posCatalogBloc, Sale currentSale,
      AccountModel account, Item item) {
    var btcCurrency = Currency.fromTickerSymbol(item.currency);
    var currencyWrapper = btcCurrency != null
        ? CurrencyWrapper.fromBTC(btcCurrency)
        : CurrencyWrapper.fromFiat(account.fiatCurrency);

    setState(() {
      var newSale =
          currentSale.addItem(item, 1 / currencyWrapper.satConversionRate);
      posCatalogBloc.actionsSink.add(SetCurrentSale(newSale));
      currentAmount = 0;
    });
  }

  onNumButtonPressed(String numberText) {
    setState(() {
      double addition = int.parse(numberText).toDouble() /
          pow(10, currentCurrency.fractionSize);
      currentAmount = currentAmount * 10 + addition;
    });
  }

  changeCurrency(String value, UserProfileBloc userProfileBloc) {
    setState(() {
      Currency currency = Currency.fromTickerSymbol(value);

      bool flipFiat = _useFiat == (currency != null);
      if (flipFiat) {
        _useFiat = !_useFiat;
        _clearAmounts();
      } else if (currency != null) {
        var conversionRate =
            currency == Currency.SAT ? 100000000 : 1 / 100000000;
        currentAmount = currentAmount * conversionRate;
      }

      if (currency != null) {
        userProfileBloc.currencySink.add(currency);
      } else {
        userProfileBloc.fiatConversionSink.add(value);
      }
    });
  }

  _clearAmounts() {
    setState(() {
      currentAmount = 0;
    });
  }

  clearSale() {
    PosCatalogBloc posCatalogBloc =
        AppBlocsProvider.of<PosCatalogBloc>(context);
    setState(() {
      currentAmount = 0;
      _invoiceDescriptionController.text = "";
      posCatalogBloc.actionsSink.add(SetCurrentSale(Sale(saleLines: [])));
    });
  }

  approveClear(Sale currentSale) {
    if (currentSale.totalChargeSat > 0 || currentAmount > 0) {
      AlertDialog dialog = AlertDialog(
        title: Text(
          "Clear Sale?",
          textAlign: TextAlign.center,
          style: Theme.of(context).dialogTheme.titleTextStyle,
        ),
        content: Text("This will clear the current transaction.",
            style: Theme.of(context).dialogTheme.contentTextStyle),
        contentPadding:
            EdgeInsets.only(left: 24.0, right: 24.0, bottom: 12.0, top: 24.0),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel",
                  style: Theme.of(context).primaryTextTheme.button)),
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
                clearSale();
              },
              child: Text("Clear",
                  style: Theme.of(context).primaryTextTheme.button))
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
      );
      showDialog(
          useRootNavigator: false, context: context, builder: (_) => dialog);
    }
  }

  Container _numberButton(String number) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).backgroundColor, width: 0.5)),
        child: FlatButton(
            onPressed: () => onNumButtonPressed(number),
            child: Text(number,
                textAlign: TextAlign.center, style: theme.numPadNumberStyle)));
  }

  Widget _numPad(PosCatalogBloc posCatalogBloc, Sale currentSale) {
    return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: (itemWidth / itemHeight),
        padding: EdgeInsets.zero,
        children: List<int>.generate(9, (i) => i)
            .map((index) => _numberButton((index + 1).toString()))
            .followedBy([
          Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).backgroundColor, width: 0.5)),
              child: GestureDetector(
                  onLongPress: () => approveClear(currentSale),
                  child: FlatButton(
                      onPressed: () {
                        _clearAmounts();
                      },
                      child: Text("C", style: theme.numPadNumberStyle)))),
          _numberButton("0"),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).backgroundColor, width: 0.5)),
              child: FlatButton(
                  onPressed: () => onAddition(posCatalogBloc, currentSale,
                      currentCurrency.satConversionRate),
                  child: Text("+", style: theme.numPadAdditionStyle))),
        ]).toList());
  }
}
