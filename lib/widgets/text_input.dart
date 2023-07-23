import 'package:flutter/material.dart';

import '../constants/colors.dart';

class TextInput extends StatefulWidget {
  final String textlabel;
  final String iconlabel;
  final TextEditingController controller;
  final bool keyboardType;

  const TextInput({
    Key? key,
    required String this.textlabel,
    required String this.iconlabel,
    required TextEditingController this.controller,
    this.keyboardType = false
  }) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late String _textlabel;
  late String _iconlabel;
  late TextEditingController _controller;
  late bool _keyboardType;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textlabel = widget.textlabel;
    _controller = widget.controller;
    _iconlabel = widget.iconlabel;
    _keyboardType = widget.keyboardType;
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: _keyboardType?TextInputType.number:TextInputType.text,
      controller: _controller,
      decoration: InputDecoration(
        prefixIcon: _iconlabel=="null"?null:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            _iconlabel,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ),
        fillColor: white_light,
        label: Text(
          _textlabel,
          style: TextStyle(
            color: gray,
          ),
        ),
        filled: true,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide.none),
      ),
    );
  }
}
