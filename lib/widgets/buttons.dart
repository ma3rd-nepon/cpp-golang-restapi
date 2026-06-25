import "package:flutter/material.dart";


// final defaultIconStyle = IconButton.styleFrom(
//   backgroundColor: const Color.fromARGB(0, 1, 1, 1),
//   foregroundColor: const Color.fromARGB(255, 43, 82, 120),
// );



class CustomButton extends StatelessWidget {
  final Text text;
  final VoidCallback _onPress;
  const CustomButton({
    super.key,
    required this.text,
    required this._onPress
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 53, 53, 53), 
        foregroundColor: Color.fromARGB(0, 1, 1, 1), 
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), 
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)), 
        elevation: 0
      ),
      child: text,
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback _onPress;
  final double? iconSize;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this._onPress,
    this.iconSize=16,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      iconSize: iconSize,
      onPressed: _onPress,
      style: IconButton.styleFrom(
        backgroundColor: const Color.fromARGB(0, 1, 1, 1),
        foregroundColor: const Color.fromARGB(255, 43, 82, 120),
      )
    );
  }
}