import 'package:breez/bloc/blocs_provider.dart';
import 'package:breez/bloc/user_profile/breez_user_model.dart';
import 'package:breez/bloc/user_profile/user_actions.dart';
import 'package:breez/bloc/user_profile/user_profile_bloc.dart';
import 'package:breez/theme_data.dart' as theme;
import 'package:breez/widgets/back_button.dart' as backBtn;
import 'package:breez/widgets/pin_code_widget.dart';
import 'package:breez/widgets/route.dart';
import 'package:flutter/material.dart';

class LockScreen extends StatefulWidget {
  final String label;
  final bool dismissible;
  final bool changePassword;
  final bool setPassword;
  final Widget route;

  LockScreen({Key key, this.label, this.dismissible = false, this.changePassword = false, this.setPassword = false, this.route})
      : super(key: key);

  @override
  _LockScreenState createState() => new _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  UserProfileBloc _userProfileBloc;
  BreezUserModel _user;
  String _label;
  Image _breezLogo;

  int _passwordLength = 6;
  String _enteredPinCode = "";
  String _errorMessage = "";
  String _tmpPassword = "";

  bool _validated = false;

  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _setLabel(widget.label ?? "Enter your PIN");
    _breezLogo = new Image.asset(
      "src/images/logo-color.png",
      height: 47,
      width: 125.4,
      color: Colors.white,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      _userProfileBloc = AppBlocsProvider.of<UserProfileBloc>(context);
      _userProfileBloc.userStream.listen((user) {
        _user = user;
      });
      precacheImage(_breezLogo.image, context);
      _isInit = true;
    }
  }

  _setPinCode(String securityPIN) {
    UpdateSecurityModel updateSecurityModelAction =
        UpdateSecurityModel(pinCode: securityPIN, secureBackupWithPin: _user.securityModel.secureBackupWithPin);
    _userProfileBloc.userActionsSink.add(updateSecurityModelAction);
    updateSecurityModelAction.future.then((_) {
      if (this.mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: widget.dismissible
            ? new AppBar(
                iconTheme: theme.appBarIconTheme,
                textTheme: theme.appBarTextTheme,
                backgroundColor: theme.BreezColors.blue[500],
                leading: backBtn.BackButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
                elevation: 0.0,
              )
            : null,
        body: PinCodeWidget(
          _breezLogo,
          _label,
          _enteredPinCode,
          widget.dismissible,
          _errorMessage,
          (numberText) => _onNumButtonPressed(numberText),
          (enteredPinCode) => _setPinCodeInput(enteredPinCode),
        ),
      ),
    );
  }

  _onNumButtonPressed(String numberText) {
    setState(() {
      _setErrorMessage("");
      if (_enteredPinCode.length < _passwordLength) {
        _setPinCodeInput(_enteredPinCode + numberText);
      }
      if (_enteredPinCode.length == _passwordLength) {
        // Validate current PIN before changing PIN
        if (((widget.changePassword && _validated) || widget.setPassword) && _tmpPassword.isEmpty) {
          // If a new PIN is being set prompt user to enter the PIN again
          Future.delayed(Duration(milliseconds: 300), () => _setPinCodeForValidation()); // Wait 300ms for scale animation to end
        } else {
          // Check if PINs match if a new PIN is being set or current PIN is being changed
          Future.delayed(
              Duration(milliseconds: 300),
              () => (widget.setPassword || (widget.changePassword && _validated))
                  ? _matchPinCodes(_enteredPinCode == _tmpPassword)
                  : _onPinCodeValidation(_enteredPinCode == _user.securityModel.pinCode));
        }
      }
    });
  }

  _setPinCodeForValidation() {
    setState(() {
      _tmpPassword = _enteredPinCode;
    });
    _setPinCodeInput("");
    _setLabel("Re-enter your new PIN");
  }

  void _onPinCodeValidation(bool isValid) {
    if (isValid) {
      if (widget.changePassword && !_validated) {
        _promptUserToEnterNewPinCode(isValid);
      } else {
        _userProfileBloc.userSink.add(_user.copyWith(waitingForPin: false));
        if (widget.route != null) {
          Navigator.of(context).pushReplacement(
            new FadeInRoute(
              builder: (BuildContext context) {
                return widget.route;
              },
            ),
          );
        } else {
          Navigator.pop(context, true);
        }
      }
    } else {
      _incorrectPinCode();
    }
  }

  void _incorrectPinCode() {
    _setPinCodeInput("");
    _setErrorMessage("Incorrect PIN");
  }

  void _promptUserToEnterNewPinCode(bool isValid) {
    _setPinCodeInput("");
    _setLabel("Enter your new PIN");
    setState(() {
      _validated = isValid;
    });
  }

  void _matchPinCodes(bool isMatched) {
    if (isMatched) {
      _setPinCode(_enteredPinCode);
    } else {
      _setPinCodeInput("");
      _setLabel("Enter your new PIN");
      _setErrorMessage("PIN does not match");
    }
  }

  void _setLabel(String label) {
    setState(() {
      _label = label;
    });
  }

  void _setPinCodeInput(String enteredPinCode) {
    setState(() {
      _enteredPinCode = enteredPinCode;
    });
  }

  void _setErrorMessage(String errorMessage) {
    setState(() {
      _errorMessage = errorMessage;
    });
  }
}