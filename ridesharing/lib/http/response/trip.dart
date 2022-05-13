
class Trip {

  String date;
  String seat;
  String number;
  String name;
  String start;
  String end;
  String model;
  String tripid;
  String type;
  String userid;

	Trip.fromJsonMap(Map<String, dynamic> map): 
		date = map["date"],
		seat = map["seat"],
		number = map["number"],
		name = map["name"],
		start = map["start"],
		end = map["end"],
		model = map["model"],
		tripid = map["tripid"],
		type = map["type"],
		userid = map["userid"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['date'] = date;
		data['seat'] = seat;
		data['number'] = number;
		data['name'] = name;
		data['start'] = start;
		data['end'] = end;
		data['model'] = model;
		data['tripid'] = tripid;
		data['type'] = type;
		data['userid'] = userid;
		return data;
	}
}
