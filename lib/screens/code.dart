// VIGENERE CIPHER
class VigenereCipher {
  String key;
  VigenereCipher(this.key);
  String encrypt(String input) {
    key = this.key;
    input = input.replaceAll(' ', '');
    key = key.replaceAll(' ', '');
    input = input.toUpperCase();
    key = key.toUpperCase();
    String output = "";
    int j = 0;
    for (int i = 0; i < input.length; i++) {
      if (input[i].isNotEmpty) {
        output += String.fromCharCode(
            (input.codeUnitAt(i) + key.codeUnitAt(j)) % 26 + 65);
      } else {
        output += input[i];
      }
      if (j < key.length - 1) {
        j++;
      } else {
        j = 0;
      }
    }
    return output;
  }

  int mod(int val, int mod) {
    return (val % mod + mod) % mod;
  }

  String decrypt(String input) {
    key = this.key;
    input = input.replaceAll(' ', '');
    key = key.replaceAll(' ', '');
    input = input.toUpperCase();
    key = key.toUpperCase();
    String output = "";
    int j = 0;

    for (int i = 0; i < input.length; i++) {
      if (input[i].isNotEmpty) {
        output += String.fromCharCode(
            mod((input.codeUnitAt(i) - key.codeUnitAt(j)), 26) + 65);
      } else {
        output += input[i];
      }

      if (j < key.length - 1)
        j++;
      else
        j = 0;
    }
    return output;
  }
}
