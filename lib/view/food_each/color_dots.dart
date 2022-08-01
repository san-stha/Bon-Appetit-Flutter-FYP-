import 'package:fyp/model/food_model.dart';

// import '/constant/color_properties.dart';
import 'package:flutter/material.dart';

// import '../../models/product.dart';
// import '/utils/size_config.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
    required this.food,
    required this.quantity,
    required this.incrementChange,
    required this.decrementChange,
  }) : super(key: key);

  final FoodModel food;
  final int quantity;
  final Function incrementChange;
  final Function decrementChange;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 3;
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          const Spacer(),
          IconButton(
              onPressed: () {
                decrementChange();
              },
              icon: const Icon(
                Icons.remove_circle,
              )),
          CircleAvatar(
            backgroundColor: Colors.white,
            // radius: const BorderRadius.all(Radius.circular(10)),
            child: Text(
              quantity.toString(),
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    // color: primaryColor,
                    color: Colors.indigo
                  ),
            ),
          ),
          IconButton(
              onPressed: () {
                incrementChange();
              },
              icon: const Icon(Icons.add_circle)),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      padding: const EdgeInsets.all(10),
      height: 100,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? Colors.green : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
