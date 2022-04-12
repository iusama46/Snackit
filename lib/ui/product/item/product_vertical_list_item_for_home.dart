import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterrestaurant/config/ps_colors.dart';
import 'package:flutterrestaurant/constant/ps_constants.dart';
import 'package:flutterrestaurant/constant/ps_dimens.dart';
import 'package:flutterrestaurant/ui/common/dialog/warning_dialog_view.dart';
import 'package:flutterrestaurant/ui/common/ps_button_widget.dart';
import 'package:flutterrestaurant/ui/common/ps_hero.dart';
import 'package:flutterrestaurant/ui/common/ps_ui_widget.dart';
import 'package:flutterrestaurant/utils/utils.dart';
import 'package:flutterrestaurant/viewobject/product.dart';

class ProductVeticalListItemForHome extends StatelessWidget {
  const ProductVeticalListItemForHome(
      {Key key,
      @required this.product,
      this.onTap,
      // this.animationController,
      // this.animation,
      this.coreTagKey})
      : super(key: key);

  final Product product;

//  final BasketSelectedAttribute basketSelectedAttribute;
  final Function onTap;
  final String coreTagKey;

  // final AnimationController animationController;
  // final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return
        // AnimatedBuilder(
        //     animation: animationController,
        //     builder: (BuildContext context, Widget child) {
        //       return FadeTransition(
        //           opacity: animation,
        //           child: Transform(
        //               transform: Matrix4.translationValues(
        //                   0.0, 100 * (1.0 - animation.value), 0.0),
        //               child:
        GestureDetector(
            onTap: onTap,
            child: GridTile(
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: PsDimens.space4, vertical: PsDimens.space4),
                decoration: BoxDecoration(
                  color: PsColors.backgroundColor,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(PsDimens.space8)),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(PsDimens.space8)),
                        ),
                        child: ClipPath(
                          child: PsNetworkImage(
                            photoKey: '$coreTagKey${PsConst.HERO_TAG__IMAGE}',
                            defaultPhoto: product.defaultPhoto,
                            width: MediaQuery.of(context).size.width*0.28,
                            height: MediaQuery.of(context).size.width*0.28,
                            //height: double.infinity,
                            boxfit: BoxFit.cover,
                            onTap: () {
                              Utils.psPrint(product.defaultPhoto.imgParentId);
                              onTap();
                            },
                          ),
                          clipper: const ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(PsDimens.space8),
                                      topRight:
                                          Radius.circular(PsDimens.space8)))),
                        ),
                      ),
                       SizedBox(
                        width: MediaQuery.of(context).size.width*0.025,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: PsDimens.space8,
                                  top: PsDimens.space8,
                                  right: PsDimens.space8,
                                  bottom: PsDimens.space12),
                              child: PsHero(
                                tag: '$coreTagKey${PsConst.HERO_TAG__TITLE}',
                                child: Text(
                                  product.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(
                                          color: PsColors.textPrimaryColor,
                                          fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: PsDimens.space8,
                                  right: PsDimens.space8,
                                  bottom: PsDimens.space12),
                              child: PsHero(
                                tag: '$coreTagKey${PsConst.HERO_TAG__TITLE}',
                                child: Text(
                                  product.highlightInformation,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(
                                        color: Colors.black45,
                                      ),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width*0.0098,),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: PsDimens.space8,

                                  right: PsDimens.space2,
                                  bottom: 0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: PsHero(
                                    tag:
                                        '$coreTagKey$PsConst.HERO_TAG__UNIT_PRICE',
                                    flightShuttleBuilder:
                                        Utils.flightShuttleBuilder,
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: Text(
                                          '${product.currencySymbol} ${Utils.getPriceFormat(product.unitPrice)}',
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              .copyWith(
                                            fontSize: MediaQuery.of(context).size.width*0.04,
                                                color: PsColors.mainColor,
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1),
                                    ),
                                  )),


                                  ElevatedButton(
                                      child: Text(
                                          Utils.getString(
                                              context,
                                              'product_detail__add_to_basket').toUpperCase(),
                                          style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.028),
                                      ),
                                      style: ButtonStyle(
                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                          backgroundColor: MaterialStateProperty.all<Color>(PsColors.mainDarkColor),

                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(6.0),
                                                      side: BorderSide(color: PsColors.mainDarkColor)
                                                  )
                                              )

                                      ),
                                      onPressed: onTap, //() async {
                                     /*   if (product.isAvailable ==
                                            '1') {
                                          if (product
                                              .customizedHeaderList !=
                                              null &&
                                              product
                                                  .customizedHeaderList[
                                              0]
                                                  .id !=
                                                  '' &&
                                              product
                                                  .customizedHeaderList[
                                              0]
                                                  .customizedDetail !=
                                                  null &&
                                              product
                                                  .customizedHeaderList[
                                              0]
                                                  .customizedDetail[
                                              0]
                                                  .id !=
                                                  ''
                                          *//*&& !basketSelectedAttribute
                                                            .isAllAttributeSelected(
                                                                product
                                                                    .customizedHeaderList
                                                                    .length)*//*
                                          ) {
                                            await showDialog<
                                                dynamic>(
                                                context: context,
                                                builder:
                                                    (BuildContext
                                                context) {
                                                  return WarningDialog(
                                                    message: Utils
                                                        .getString(
                                                        context,
                                                        'product_detail__please_choose_customize'),
                                                    onPressed:
                                                        () {},
                                                  );
                                                });
                                          } else {
                                            //_showDrawer(false);
                                          }
                                        } else {
                                          showDialog<dynamic>(
                                              context: context,
                                              builder: (BuildContext
                                              context) {
                                                return WarningDialog(
                                                  message: Utils
                                                      .getString(
                                                      context,
                                                      'product_detail__is_not_available'),
                                                  onPressed: () {},
                                                );
                                              });
                                        }*/
                                    //  },
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ))
        // ))
        ;
    // }
    // );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
    @required this.coreTagKey,
    @required this.product,
  }) : super(key: key);

  final String coreTagKey;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: [],
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: PsDimens.space8,
              top: PsDimens.space8,
              right: PsDimens.space8),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: PsHero(
                tag: '$coreTagKey$PsConst.HERO_TAG__UNIT_PRICE',
                flightShuttleBuilder: Utils.flightShuttleBuilder,
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                      '${product.currencySymbol}${Utils.getPriceFormat(product.unitPrice)}',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: PsColors.mainColor,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1),
                ),
              )),
              if (product.isDiscount == PsConst.ONE)
                Expanded(
                  child: Text(
                      '  ${product.discountPercent}% ' +
                          Utils.getString(
                              context, 'product_detail__discount_off'),
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: PsColors.discountColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1),
                )
              else
                Container()
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: PsDimens.space8,
              top: PsDimens.space8,
              right: PsDimens.space8,
              bottom: PsDimens.space12),
          child: PsHero(
            tag: '$coreTagKey${PsConst.HERO_TAG__TITLE}',
            child: Text(
              product.name,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 1,
            ),
          ),
        ),
      ],
    );
  }
}
