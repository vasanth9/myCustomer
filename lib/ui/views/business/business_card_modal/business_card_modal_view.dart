import 'package:flutter/material.dart';
import 'package:mycustomers/ui/shared/const_color.dart';
import 'package:mycustomers/ui/shared/size_config.dart';
import 'package:mycustomers/ui/views/business/business_home_page/business_homepage_viewmodel.dart';
import 'package:stacked/stacked.dart';


class BusinessCardDisplayModal extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return ViewModelBuilder<BusinessHomePageViewModel>.reactive(
     builder: (context,model,child)=> Stack(
      children: <Widget>[
        Container(
          height: SizeConfig.yMargin(context, 30),
          decoration: BoxDecoration(
            color: ThemeColors.background,
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: AssetImage("assets/images/business_card.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: SizeConfig.yMargin(context, 4),
          left: SizeConfig.xMargin(context, 25),
          child: Text(
            model.businessCard.storeName.toUpperCase(),
            style: TextStyle(
              fontSize: SizeConfig.textSize(context, 8),
              fontWeight: FontWeight.bold,
              color: ThemeColors.black,
            ),
          ),
        ),
        Positioned(
          left: SizeConfig.xMargin(context, 25),
          bottom: SizeConfig.yMargin(context, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: SizeConfig.textSize(context, 5),
                    color: ThemeColors.black,
                  ),
                  Text(
                    " ${model.businessCard.personalName}",
                    style: TextStyle(
                      fontSize: SizeConfig.textSize(context, 4),
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.phone,
                    size: SizeConfig.textSize(context, 5),
                    color: ThemeColors.black,
                  ),
                  Text(
                    " ${model.businessCard.phoneNumber}",
                    style: TextStyle(
                      fontSize: SizeConfig.textSize(context, 3.2),
                      color: ThemeColors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    size: SizeConfig.textSize(context, 5),
                    color: ThemeColors.black,
                  ),
                  Text(
                    " ${model.businessCard.emailAddress}",
                    style: TextStyle(
                      fontSize: SizeConfig.textSize(context, 3.2),
                      color: ThemeColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: SizeConfig.yMargin(context, 2),
          left: SizeConfig.xMargin(context, 25),
          child: Text(
            model.businessCard.address,
            style: TextStyle(
              fontSize: SizeConfig.textSize(context, 3.2),
              color: ThemeColors.black,
            ),
          ),
        ),
      ],
    ), 
   viewModelBuilder:()=> BusinessHomePageViewModel());     
   
 
    
  }
}


