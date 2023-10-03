void main() {
  var name = "Quang";
  String lastname = "vi";
  String name2 = "";

  print("=======================>");
  print(name);

  print("$name$lastname");

  print(name2.isEmpty);

  print(strConnect("VI ĐĂNG QUANG", doB: 2202));

// Cách sử dụng ? và ??)
  print("Vi Đăng Quang sinh ngày ${strNgayThangNam()}");

  // tham số truyền vào là 1 hàm. Function is
  iwanttoWinaScholarship(
      price: 12,
      uni: "Greenwich",
      message: (String abc) {
        print("Xin chào ạ! $abc");
      });

  List<int> arr = [1, 2, 3, 4, 5];
  print("First $arr");
  arr..add(9);
  print("Second $arr");
}

String strConnect(String a, {int doB = 1206}) {
  return "$a sinh ngày $doB";
}

String strNgayThangNam({int? day, int? month, int? year}) {
  String strDay = (day ?? 0) < 10 ? '0$day' : "$day";
  // ?? is defaut value for day
  return "$strDay - $month - $year";
}

// Function with "function as a parameter"
void iwanttoWinaScholarship(
    {int price = 0, String uni = "", Function? message}) {
  print("Dưới đây là hàm truyền vào");
  message!("Xin chào cậu");
}
