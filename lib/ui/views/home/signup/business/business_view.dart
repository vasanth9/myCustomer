import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mycustomers/ui/shared/const_color.dart';
import 'package:mycustomers/ui/shared/const_widget.dart';
import 'package:mycustomers/ui/shared/size_config.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'business_viewmodel.dart';

class BusinessView extends StatelessWidget {
  final _businessPageKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BusinessViewModel>.reactive(
      builder: (context, model, child) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: BrandColors.primary,
          statusBarIconBrightness: Brightness.light,
        ),
        child: SafeArea(
          child: Scaffold(
            key: _businessPageKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: BrandColors.primary,
            body: CustomBackground(child: _PartialBuildForm()),
          ),
        ),
      ),
      viewModelBuilder: () => BusinessViewModel(),
    );
  }
}

class _PartialBuildForm extends HookViewModelWidget<BusinessViewModel> {
  static final _businessFormPageKey = GlobalKey<FormState>();

  _PartialBuildForm({Key key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(
      BuildContext context, BusinessViewModel viewModel) {
    var _storeName = useTextEditingController();
    var _storeAddress = useTextEditingController();

    return Form(
      key: _businessFormPageKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: SizeConfig.yMargin(context, 7)),
          Text(
            'BUSINESS DETAILS',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: SizeConfig.yMargin(context, 4),
            ),
          ),
          SizedBox(height: SizeConfig.yMargin(context, 5)),
          Text(
            'One last step...',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: SizeConfig.yMargin(context, 2),
            ),
          ),
          SizedBox(height: SizeConfig.yMargin(context, 2)),
          Padding(
            padding: EdgeInsets.all(SizeConfig.yMargin(context, 2)),
            child: TextFormField(
              key: Key("storeName"),
              controller: _storeName,
              validator: (value) =>
                  (value.isEmpty) ? "Please enter store name" : null,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: SizeConfig.yMargin(context, 2),
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  labelText: "Enter your  store name",
                  border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(SizeConfig.yMargin(context, 2)),
            child: TextFormField(
              key: Key("storeAddress"),
              controller: _storeAddress,
              validator: (value) =>
                  (value.isEmpty) ? "Please enter store address" : null,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: SizeConfig.yMargin(context, 2),
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  labelText: "Enter your store address",
                  border: OutlineInputBorder()),
            ),
          ),
          SizedBox(height: SizeConfig.yMargin(context, 4)),
          CustomRaisedButton(
            btnColor: BrandColors.primary,
            txtColor: ThemeColors.background,
            btnText: 'Submit and finish',
            borderColor: BrandColors.primary,
            child: Container(),
            onPressed: () async {
              // viewModel.signUpTest();
              if (_businessFormPageKey.currentState.validate()) {
                //Dismiss keyboard during async call
                FocusScope.of(context).requestFocus(FocusNode());

                //Call Function to Signin
                viewModel.updateUser(
                    _storeName.text.trim(), _storeAddress.text.trim());
              }
            },
          ),
          SizedBox(height: SizeConfig.yMargin(context, 14)),
          Container(
              width: SizeConfig.xMargin(context, 60),
              child: CustomizeProgressIndicator(4, 4)),
          SizedBox(height: SizeConfig.yMargin(context, 4)),
        ],
      ),
    );
  }
}
