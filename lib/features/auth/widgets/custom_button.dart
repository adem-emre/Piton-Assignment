import 'package:flutter/material.dart';
import 'package:piton_assignment/core/extensions/size_extension.dart';

class CustomButton extends StatefulWidget {
  final Color? buttonColor;
  final String label;
  final EdgeInsets? padding;
  final void Function()? onPressed;
  final Future<void> Function()? onFuture;
  const CustomButton(
      {Key? key,
      required this.label,
      this.onPressed,
      this.buttonColor,
      this.padding,
      this.onFuture})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;

  changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.only(top: 12),
      child: SizedBox(
        width: context.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            elevation: 6,
            primary: widget.buttonColor ?? Colors.black,
          ),
          onPressed: () async {
            if (widget.onFuture != null) {
              changeLoading();
              await widget.onFuture!.call();
              changeLoading();
            } else {
              widget.onPressed?.call();
            }
          },
          child: isLoading
              ? const SizedBox(
                  height: 6,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(
                  widget.label,
                ),
        ),
      ),
    );
  }
}
