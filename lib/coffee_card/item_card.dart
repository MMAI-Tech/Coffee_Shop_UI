import 'package:coffee_shop_ui/coffee_card/coffee_card_riverpod.dart';
import 'package:coffee_shop_ui/coffee_card/extras_tile.dart';
import 'package:coffee_shop_ui/coffee_card/size_card.dart';
import 'package:coffee_shop_ui/home_page/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoffeeCardInfo extends StatefulWidget {
  const CoffeeCardInfo({
    super.key,
    required this.path,
    this.fav_fun,
    required this.name,
    this.rate,
    this.type,
    this.description,
    this.small,
    this.medium,
    this.large,
    required this.data_name,
  });

  final String path;
  final VoidCallback? fav_fun;
  final String name;
  final String? rate;
  final String? type;
  final String? description;
  final double? small;
  final double? medium;
  final double? large;
  final String data_name;

  @override
  State<CoffeeCardInfo> createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCardInfo> {
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF0C0F14),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  // product images and basic info section
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(sw * 0.08),
                      bottomRight: Radius.circular(sw * 0.08),
                    ),
                    child: Container(
                      height: sh * 0.55,
                      width: double.infinity,

                      child: Image.asset(widget.path, fit: BoxFit.cover),
                    ),
                  ),
                  // upper part of image
                  SizedBox(
                    height: sh * 0.55,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // app bar icons
                        Container(
                          margin: EdgeInsets.only(
                            top: sw * 0.15,
                            left: sw * 0.06,
                            right: sw * 0.06,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: sh * 0.06,
                                  width: sw * 0.12,
                                  decoration: BoxDecoration(
                                    color: Color(
                                      0xFF0C0F14,
                                    ).withValues(alpha: 0.5),
                                    borderRadius: BorderRadius.circular(
                                      sw * 0.10,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Consumer(
                                builder: (context, ref, child) {
                                  bool isVal = ref.watch((isAdd("fav")));
                                  return GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(isAdd("fav").notifier)
                                          .update((state) => !state);
                                    },
                                    child: Container(
                                      height: sh * 0.06,
                                      width: sw * 0.12,
                                      decoration: BoxDecoration(
                                        color: Color(
                                          0xFF0C0F14,
                                        ).withValues(alpha: 0.5),
                                        borderRadius: BorderRadius.circular(
                                          sw * 0.10,
                                        ),
                                      ),
                                      child: Icon(
                                        isVal
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                        color: isVal
                                            ? Colors.deepOrange
                                            : Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        //product name and description
                        Container(
                          width: double.infinity,
                          height: sh * 0.2,
                          padding: EdgeInsets.all(sw * 0.03),
                          decoration: BoxDecoration(
                            color: Color(0xFF0C0F14).withValues(alpha: 0.5),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(sw * 0.08),
                              topLeft: Radius.circular(sw * 0.08),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Data(
                                    text: widget.name,
                                    color: Colors.white,
                                    size: sw * 0.08,
                                  ),

                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFD17842),
                                        size: sw * 0.08,
                                      ),
                                      Data(
                                        text: widget.rate ?? "0.0",
                                        color: Colors.white,
                                        size: sw * 0.07,
                                      ),
                                      Data(
                                        text: "/5.0",
                                        color: Colors.grey,
                                        size: sw * 0.05,
                                      ),
                                      SizedBox(width: sw * 0.02),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: sh * 0.01),
                              Data(
                                text: widget.type ?? "No Attribute",
                                color: Colors.white,
                                size: sw * 0.04,
                              ),
                              SizedBox(height: sh * 0.03),
                              Data(
                                text: widget.description ?? "No Description",
                                color: Colors.white,
                                size: sw * 0.042,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(sw * 0.04),
                // Size section
                child: Consumer(
                  builder: (context, ref, child) {
                    num val = ref.watch(size_num(widget.data_name));
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Data(
                          text: "Size",
                          color: Colors.white,
                          size: sw * 0.06,
                        ),
                        SizedBox(height: sh * 0.01),

                        Container(
                          padding: EdgeInsets.zero,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizeCard(
                                ontap: () {
                                  ref
                                          .read(
                                            size_num(widget.data_name).notifier,
                                          )
                                          .state =
                                      0;
                                  ref
                                          .read(
                                            total_price(
                                              widget.data_name,
                                            ).notifier,
                                          )
                                          .state =
                                      widget.small ?? 3.50;
                                  ref.read(isAdd("Extras").notifier).state =
                                      false;
                                  ref.read(isAdd("Syrup").notifier).state =
                                      false;
                                },
                                size: "Small",
                                weight: "8oz",
                                text_color: val == 0
                                    ? Colors.deepOrange
                                    : Colors.white,
                                border_color: val == 0
                                    ? Colors.deepOrange
                                    : Color(0xFF424242).withValues(alpha: 0.3),
                              ),
                              SizeCard(
                                ontap: () {
                                  ref
                                          .read(
                                            size_num(widget.data_name).notifier,
                                          )
                                          .state =
                                      1;
                                  ref
                                          .read(
                                            total_price(
                                              widget.data_name,
                                            ).notifier,
                                          )
                                          .state =
                                      widget.medium ?? 4.20;
                                  ref.read(isAdd("Extras").notifier).state =
                                      false;
                                  ref.read(isAdd("Syrup").notifier).state =
                                      false;
                                },
                                size: "Medium",
                                weight: "12oz",
                                text_color: val == 1
                                    ? Colors.deepOrange
                                    : Colors.white,
                                border_color: val == 1
                                    ? Colors.deepOrange
                                    : Color(0xFF424242).withValues(alpha: 0.3),
                              ),
                              SizeCard(
                                ontap: () {
                                  ref
                                          .read(
                                            size_num(widget.data_name).notifier,
                                          )
                                          .state =
                                      2;
                                  ref
                                          .read(
                                            total_price(
                                              widget.data_name,
                                            ).notifier,
                                          )
                                          .state =
                                      widget.large ?? 4.90;
                                  ref.read(isAdd("Extras").notifier).state =
                                      false;
                                  ref.read(isAdd("Syrup").notifier).state =
                                      false;
                                },
                                size: "Large",
                                weight: "16oz",
                                text_color: val == 2
                                    ? Colors.deepOrange
                                    : Colors.white,
                                border_color: val == 2
                                    ? Colors.deepOrange
                                    : Color(0xFF424242).withValues(alpha: 0.3),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: sh * 0.03),
                        // Extras Section
                        Consumer(
                          builder: (context, ref, child) {
                            bool isSwitch = ref.watch(isAdd("Extras"));
                            bool isSwitch1 = ref.watch(isAdd("Syrup"));
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Data(
                                  text: "Add Extras",
                                  color: Colors.white,
                                  size: sw * 0.06,
                                ),
                                SizedBox(height: sh * 0.01),
                                ExtrasTile(
                                  toggleValue: isSwitch,
                                  onTap: () {
                                    ref
                                        .read(isAdd("Extras").notifier)
                                        .update((state) => !state);
                                    if (isSwitch) {
                                      ref
                                              .read(
                                                total_price(
                                                  widget.data_name,
                                                ).notifier,
                                              )
                                              .state -=
                                          0.60;
                                    } else {
                                      ref
                                              .read(
                                                total_price(
                                                  widget.data_name,
                                                ).notifier,
                                              )
                                              .state +=
                                          0.60;
                                    }
                                  },
                                  icon: Icons.local_drink,
                                  name: "Extra Shot",
                                  price: "0.80",
                                ),
                                SizedBox(height: sh * 0.01),
                                ExtrasTile(
                                  onTap: () {
                                    ref
                                        .read(isAdd("Syrup").notifier)
                                        .update((state) => !state);
                                    if (isSwitch1) {
                                      ref
                                              .read(
                                                total_price(
                                                  widget.data_name,
                                                ).notifier,
                                              )
                                              .state -=
                                          0.60;
                                    } else {
                                      ref
                                              .read(
                                                total_price(
                                                  widget.data_name,
                                                ).notifier,
                                              )
                                              .state +=
                                          0.60;
                                    }
                                  },
                                  toggleValue: isSwitch1,
                                  icon: Icons.liquor,
                                  name: "Vanilla Syrup",
                                  price: "0.60",
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // bottom navigation
      bottomNavigationBar: BottomAppBar(
        height: sh * 0.09,
        color: Color(0xFF0C0F14),
        padding: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.all(sw * 0.02),
          child: Consumer(
            builder: (context, ref, child) {
              num count = ref.watch(counter(widget.data_name));
              num base_price = ref.watch(total_price(widget.data_name));
              num Total = base_price * (count > 0 ? count : 1);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: double.infinity,
                    width: sw * 0.4,
                    color: Color(0xFF0C0F14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            count <= 1
                                ? ref
                                          .read(
                                            counter(widget.data_name).notifier,
                                          )
                                          .state =
                                      1
                                : ref
                                      .read(counter(widget.data_name).notifier)
                                      .state--;
                          },
                          child: Container(
                            width: sw * 0.1,
                            height: sh * 0.05,
                            decoration: BoxDecoration(
                              color: Color(0xFF424242).withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(sw * 0.1),
                            ),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: sw * 0.06,
                            ),
                          ),
                        ),
                        Data(
                          text: count.toString(),
                          color: Colors.white,
                          size: sw * 0.07,
                        ),
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(counter(widget.data_name).notifier)
                                .state++;
                          },
                          child: Container(
                            width: sw * 0.1,
                            height: sh * 0.05,
                            decoration: BoxDecoration(
                              color: Color(0xFF424242).withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(sw * 0.1),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.deepOrange,
                              size: sw * 0.06,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: sw * 0.55,
                    padding: EdgeInsets.all(sw * 0.04),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(sw * 0.03),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Data(
                          text: "Add to Cart",
                          color: Colors.white,
                          size: sw * 0.05,
                        ),

                        Row(
                          children: [
                            Data(
                              text: "\$",
                              color: Colors.white,
                              size: sw * 0.05,
                            ),
                            Data(
                              text: Total.toStringAsFixed(2),
                              color: Colors.white,
                              size: sw * 0.05,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
