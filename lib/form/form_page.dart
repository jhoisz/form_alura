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

  // create function for count one more one

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
            Expanded(
              child: ListView(
                children: [
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
                          validator: (text) {
                            if ((text?.length ?? 0) < 10) {
                              return 'Mínimo de 10 caracteres';
                            }
                            return null;
                          },
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
                          validator: (value) {
                            return null;
                          },
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
                                isLast: true,
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
                        validateForm();
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
          ],
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
    String? Function(String?)? validator,
    bool isLast = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.poppins(fontSize: 16),
        ),
        TextFormField(
          controller: controller,
          validator: validator ??
              (value) {
                return (value?.isEmpty ?? true)
                    ? 'Campo $name não pode ficar vazio'
                    : null;
              },
          keyboardType: type,
          textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
          maxLength: maxLengthText,
          maxLengthEnforcement:
              maxLengthText != null ? MaxLengthEnforcement.enforced : null,
          style: GoogleFonts.poppins(fontSize: 14.0),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 10.0,
            ),
            errorStyle: GoogleFonts.poppins(
              fontSize: 11.0,
              textStyle: const TextStyle(
                overflow: TextOverflow.visible,
              ),
            ),
            filled: true,
            fillColor: const Color(0xFFADD6E0).withOpacity(0.44),
            counterText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  void validateForm() {
    final FormState? form = _formKey.currentState;
    if (form?.validate() ?? false) {
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
    } else {
      debugPrint('Formulário inválido');
    }
  }
}
