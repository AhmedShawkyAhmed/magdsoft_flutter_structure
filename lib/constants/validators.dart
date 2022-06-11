String? phoneValidator(String? value) {
  if (value!.isNotEmpty) {
    if (value.length != 11) return 'Mobile Number must be of 11 digit';
    String phoneNetwork = value.substring(0, 3);
    if (!(phoneNetwork == "010" ||
        phoneNetwork == "011" ||
        phoneNetwork == "012" ||
        phoneNetwork == "015")) {
      return 'Please enter correct phone number.';
    }
  } else {
    return 'Please enter your phone number.';
  }
  return null;
}

String? emailValidator(String? value) {
  return value!.length < 12 || !value.contains("@")
      ? 'Please enter a valid email (contains @).'
      : null;
}

String? passwordValidator(String? value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value!.isEmpty || value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  /*  for Strong Password * -> Yousef@123
  else if (!regex.hasMatch(value)) {
    return 'Please enter strong password.';
  }
  */
  return null;
}

String? nameValidator(String? value) {
  return value!.length < 3 ? 'Please enter your full name.' : null;
}
