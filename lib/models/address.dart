class Address {
  String? name,
      phone,
      cep,
      number,
      street,
      neighborhood,
      complement,
      city,
      state;

  Address({
    this.name,
    this.phone,
    this.cep,
    this.number,
    this.street,
    this.neighborhood,
    this.complement,
    this.city,
    this.state,
  });

  Map<String, dynamic> toJson() {
    return ({
      "name": name,
      "phone": phone,
      "cep": cep,
      "number": number,
      "street": street,
      "neighborhood": neighborhood,
      "complement": complement,
      "city": city,
      "state": state,
    });
  }

  @override
  String toString() {
    return "Nome: $name \nCelular: $phone \nCEP: $cep \nNúmero: $number \nLogradouro: $street \nBairro: $neighborhood \nComplemento: $complement \nCidade: $city  \nEstado: $state";
  }
}
