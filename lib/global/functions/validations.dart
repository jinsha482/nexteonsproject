class TextFieldValidation {
  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$')
        .hasMatch(value)) {
      return '8 characters, 1 uppercase letter, 1 lowercase letter, and 1 special character.';
    }
    return null;
  }

  String? oldPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your current password';
    } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$')
        .hasMatch(value)) {
      return 'Wrong entry please enter your current password';
    }
    return null;
  }

  String? userNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    } else if (value.length < 3) {
      return 'Minimum 3 letters required';
    }
    return null;
  }

  String? pinCodeValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    } else if (!RegExp(r'^[1-9][0-9]{5}$').hasMatch(value)) {
      return 'Invalid pincode';
    }
    return null;
  }

  String? phoneNumberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number field cannot be empty';
    } else if (value.length != 10) {
      return 'Invalid mobile number';
    }
    return null;
  }

  String? whatsAppNumberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Whatsapp number field cannot be empty';
    } else if (value.length != 10) {
      return 'Invalid mobile number';
    }
    return null;
  }

  String? amountValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Amount cannot be empty';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Invalid amount';
    }
    return null;
  }
}
