import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:groceries_app/constants/constants.dart";
import 'package:groceries_app/widgets/button_widgets.dart';

final titleStyleCard = TextStyle(
  fontWeight: FontWeight.w700,
  color: Colors.black.withOpacity(0.7),
);

const paddingCard = EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0);

Widget customCard({
  required String img,
  String? name,
  String? price,
  double? rating,
  required int count,
  VoidCallback? onPress,
}) {
  return Card(
    margin: EdgeInsets.zero,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: const BorderSide(
        color: borderColor,
      ),
    ),
    elevation: 0,
    child: IntrinsicHeight(
      child: Container(
        padding: paddingCard,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.network(
                  img,
                  height: 80.0,
                  width: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name ?? '', style: titleStyleCard),
                  const SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    price ?? '',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: priceColor,
                    ),
                  ),
                  const SizedBox(
                    height: 9.0,
                  ),
                  RatingBar.builder(
                    initialRating: rating ?? 0,
                    itemCount: count,
                    direction: Axis.horizontal,
                    itemSize: 20.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: yellowColor,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: customButton('Buy', onPress),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget customCardCart(
    {String? name, String? price, required double rating, required int count}) {
  return Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: const BorderSide(
        color: borderColor,
      ),
    ),
    elevation: 0,
    child: Container(
      padding: paddingCard,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$name',
                style: titleStyleCard,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.close),
                color: redColor,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHwzfHxhcHBsZXxlbnwwfHx8fDE2NDkwNzUzMDI&ixlib=rb-1.2.1&q=80&w=1080',
                      height: 80.0,
                      width: 80.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$price/kg',
                      ),
                      const SizedBox(
                        height: 9.0,
                      ),
                      RatingBar.builder(
                        initialRating: 5,
                        itemCount: 5,
                        direction: Axis.horizontal,
                        itemSize: 20.0,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: yellowColor,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            '-',
                            style: titleStyleCard,
                          ),
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(30.0, 25.0),
                            side: BorderSide(width: 2, color: greenColorSecond),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('1'),
                        SizedBox(
                          width: 5,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text('+', style: titleStyleCard),
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(30.0, 25.0),
                            side: BorderSide(width: 2, color: greenColorSecond),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget customCardCheckout() {
  return Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: const BorderSide(
        color: borderColor,
      ),
    ),
    child: Container(
      padding: paddingCard,
      color: greenColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total 0 item',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                height: 3,
                width: 100,
                color: Colors.white,
              ),
              Text(
                'Rp 0',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Text(
            'Checkout',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    ),
  );
}

Widget customCardProfile({String? text, FaIcon? icon}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: borderColor),
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: borderColorSecond,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: const BorderSide(
          color: borderColorSecond,
        ),
      ),
      child: ListTile(
        leading: icon,
        title: Text(
          text ?? '',
          style: titleStyleCard,
        ),
      ),
    ),
  );
}
