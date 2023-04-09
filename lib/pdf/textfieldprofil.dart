import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class sbtTextformfieldProfil {
  static Padding textformfield(
      TextEditingController controller, String hintext) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        /// Türkçe karakter girilmesini en gelleyen kod
        inputFormatters: [
          FilteringTextInputFormatter(RegExp("[a-zA-Z 0-9]"), allow: true),
        ],
        key: Key(hintext),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintext,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 0.0),
          ),
        ),
      ),
    );
  }
}
