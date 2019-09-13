// To parse this JSON data, do
//
//     final prayer = prayerFromJson(jsonString);

import 'dart:convert';

Prayer prayerFromJson(String str) => Prayer.fromJson(json.decode(str));

String prayerToJson(Prayer data) => json.encode(data.toJson());

class Prayer {
    int id;
    String prayerPoint;
    String status;

    Prayer({
        this.id,
        this.prayerPoint,
        this.status,
    });

    factory Prayer.fromJson(Map<String, dynamic> json) => Prayer(
        id: json["id"],
        prayerPoint: json["prayer_point"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "prayer_point": prayerPoint,
        "status": status,
    };
}
