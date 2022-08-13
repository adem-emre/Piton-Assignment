class ValidationHelper {
  final _mailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
  final _passwordRegex = RegExp(r"^(?=.*[0-9])(?=.*[a-zA-Z])(?=\S+$).{6,20}$");

  String? isEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }

  String? validateMail(String? value) {
    if (isEmpty(value) == null && _mailRegex.hasMatch(value!)) {
      return null;
    }
    return "Mail Address is Invalid";
  }

  String? validatePhone(String value) {
    if (value.length == 10) {
      return null;
    }
    return "Phone Number is Invalid";
  }

  String? validatePassword(String? value) {
    if (isEmpty(value) == null && _passwordRegex.hasMatch(value!)) {
      return null;
    }
    return "password must contain letters and numbers and be 6-20 characters";
  }

  String? conirmPassword(String password, String? confirmPassword) {
    if (password == confirmPassword) {
      return null;
    }
    return "Passwords do not match";
  }
}
