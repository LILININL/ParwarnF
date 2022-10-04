final usergender = [
  {'gender': 'ชาย', 'value': 'MALE'},
  {'gender': 'หญิง', 'value': 'FEMALE'},
  {'gender': 'อื่นๆ', 'value': 'OTHER'},
  {'gender': 'ไม่ระบุ', 'value': 'NOT_SPECIFIED'}
];

final month = [
  {'monthname': 'มากราคม', 'value': '1'},
  {'monthname': 'กุมภาพันธ์', 'value': '2'},
  {'monthname': 'มีนาคม', 'value': '3'},
  {'monthname': 'เมษายน', 'value': '4'},
  {'monthname': 'พฤษภาคม', 'value': '5'},
  {'monthname': 'มิถุนายน', 'value': '6'},
  {'monthname': 'กรกฎาคม', 'value': '7'},
  {'monthname': 'สิงหาคม', 'value': '8'},
  {'monthname': 'กันยายน', 'value': '9'},
  {'monthname': 'ตุลาคม', 'value': '10'},
  {'monthname': 'พฤศจิกายน', 'value': '11'},
  {'monthname': 'ธันวาคม', 'value': '12'},
];

final dayl = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28',
  '29',
  '30',
  '31'
];

// Dayl() {
//   for (var i = 0; i < day.length; i++) {
//     return DropdownMenuItem(
//       value: day[i],
//       child: Text(day[i]),
//     );
//   }
// }
// final yearl = [
//   {yearloop()}
// ];

yearloop() {
  final yearla = <String>[];
  for (var i = 0; i < 100; i++) {
    yearla.add((DateTime.now().year - i).toString());
  }
  return;
}
//yearlist 
 