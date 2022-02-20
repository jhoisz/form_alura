import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_alura/address.dart';
import 'package:google_fonts/google_fonts.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  Address? address;

  final _nameController = TextEditingController();
  final _phoneController = MaskedTextController(mask: '(000) 00000-0000');
  final _cepController = MaskedTextController(mask: '00000-000');
  final _numberController = TextEditingController();
  final _streetController = TextEditingController();
  final _neighborhoodController = TextEditingController();
  final _complementController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 35.0,
            right: 35.0,
            bottom: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cadastro\nde endereço',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
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
                      _nameController,
                    ),
                    buildTextField(
                      'Telefone',
                      TextInputType.number,
                      context,
                      _phoneController,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: buildTextField(
                            'CEP',
                            TextInputType.number,
                            context,
                            _cepController,
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Expanded(
                          child: buildTextField(
                            'Número',
                            TextInputType.phone,
                            context,
                            _numberController,
                          ),
                        ),
                      ],
                    ),
                    buildTextField(
                      'Logradouro',
                      TextInputType.streetAddress,
                      context,
                      _streetController,
                      maxLengthText: 100,
                    ),
                    buildTextField(
                      'Bairro',
                      TextInputType.text,
                      context,
                      _neighborhoodController,
                    ),
                    buildTextField(
                      'Complemento',
                      TextInputType.text,
                      context,
                      _complementController,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: buildTextField(
                            'Estado',
                            TextInputType.text,
                            context,
                            _stateController,
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Expanded(
                          child: buildTextField(
                            'Cidade',
                            TextInputType.text,
                            context,
                            _cityController,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 16,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    primary: const Color(0xFF0123FF),
                  ),
                  onPressed: () {
                    address = Address(
                      name: _nameController.text,
                      phone: _phoneController.text,
                      cep: _cepController.text,
                      number: _numberController.text,
                      street: _streetController.text,
                      neighborhood: _neighborhoodController.text,
                      complement: _complementController.text,
                      state: _stateController.text,
                      city: _cityController.text,
                    );

                    debugPrint(address?.getAddress().toString());
                  },
                  child: Text(
                    'Salvar',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String name,
    TextInputType type,
    BuildContext context,
    TextEditingController controller, {
    int? maxLengthText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.poppins(fontSize: 16),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 16,
          child: TextFormField(
            controller: controller,
            // validator: (value) =>
            //     value!.isEmpty ? 'Email cannot be blank' : null,
            keyboardType: type,
            maxLength: maxLengthText,
            maxLengthEnforcement:
                maxLengthText != null ? MaxLengthEnforcement.enforced : null,
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
