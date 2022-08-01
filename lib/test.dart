// ignore_for_file: avoid_print
void main() {
  final data = {
    'w_center': {
      'children': [
        {
          'w_text': {
            'text': 'Helo',
          }
        },
        {
          'w_text': {
            'text': 'Hola',
          }
        },
        {
          'w_text': {
            'text': 'Bye',
          }
        }
      ]
    }
  };
  var x = 'w_center.children.0.w_text.text';
  var l = x.split('.');
  dynamic d;
  for (dynamic i in l) {
    if (int.tryParse(i) != null) {
      i = int.parse(i);
    }
    if (d == null) {
      d = data[i];
    } else {
      d = d[i];
    }
    print(d);
  }
}
