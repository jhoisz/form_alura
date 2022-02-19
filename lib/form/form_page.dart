import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    'Cadastro\n de endereço',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      buildTextField(
                        'Nome',
                        TextInputType.name,
                        context,
                        1.2,
                        8,
                        MaxLengthEnforcement.none,
                      ),
                      buildTextField(
                        'Telefone',
                        TextInputType.number,
                        context,
                        1.2,
                        12,
                        MaxLengthEnforcement.enforced,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildTextField(
                            'CEP',
                            TextInputType.number,
                            context,
                            2.5,
                            8,
                            MaxLengthEnforcement.enforced,
                          ),
                          buildTextField(
                            'Número',
                            TextInputType.phone,
                            context,
                            2.5,
                            8,
                            MaxLengthEnforcement.enforced,
                          ),
                        ],
                      ),
                      buildTextField(
                        'Logradouro',
                        TextInputType.streetAddress,
                        context,
                        1.2,
                        100,
                        MaxLengthEnforcement.enforced,
                      ),
                      buildTextField(
                        'Bairro',
                        TextInputType.text,
                        context,
                        1.2,
                        8,
                        MaxLengthEnforcement.none,
                      ),
                      buildTextField(
                        'Complemento',
                        TextInputType.text,
                        context,
                        1.2,
                        8,
                        MaxLengthEnforcement.none,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildTextField(
                            'Estado',
                            TextInputType.text,
                            context,
                            2.5,
                            8,
                            MaxLengthEnforcement.none,
                          ),
                          buildTextField(
                            'Cidade',
                            TextInputType.text,
                            context,
                            2.5,
                            8,
                            MaxLengthEnforcement.none,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 16,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        primary: const Color(0xFF0123FF)),
                    onPressed: () {
                      // validate();
                    },
                    child: Text(
                      'Salvar',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String name, TextInputType type, BuildContext context,
      num width, int maxLengthText, MaxLengthEnforcement isLimited) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.poppins(fontSize: 18),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / 16,
          child: TextFormField(
            // validator: (value) =>
            //     value!.isEmpty ? 'Email cannot be blank' : null,
            keyboardType: type,
            maxLength: maxLengthText,
            maxLengthEnforcement: isLimited,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFADD6E0).withOpacity(0.44),
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // void validate() {
  //   final FormState? form = _formKey.currentState;
  //   if (form!.validate()) {
  //     print('Form is valid');
  //   } else {
  //     print('Form is not valid');
  //   }
  // }
}
