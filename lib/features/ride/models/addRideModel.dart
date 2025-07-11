class Addridemodel {
  final int? startingKm;
  final int? endingKm;
  final DateTime? rideDate;
  final String? startingPoint;
  final String? destination;
  final String? startTime;
  final String? endTime;
  final double? fuelAdded;
  final int? odometerAtFuel;
  final String? note;

  Addridemodel({
    this.startingKm,
    this.endingKm,
    this.rideDate,
    this.startingPoint,
    this.destination,
    this.startTime,
    this.endTime,
    this.fuelAdded,
    this.odometerAtFuel,
    this.note,
  });

  Map<String, dynamic> toJson() {
    return {
      'startingKm': startingKm,
      'endingKm': endingKm,
      'rideDate': rideDate?.toIso8601String(),
      'startingPoint': startingPoint,
      'destination': destination,
      'startTime': startTime,
      'endTime': endTime,
      'fuelAdded': fuelAdded,
      'odometerAtFuel': odometerAtFuel,
      'note': note,
    };
  }

  factory Addridemodel.fromJson(Map<String, dynamic> json) {
    return Addridemodel(
      startingKm: json['startingKm'] as int?,
      endingKm: json['endingKm'] as int?,
      rideDate: json['rideDate'] != null
          ? DateTime.parse(json['rideDate'])
          : null,
      startingPoint: json['startingPoint'] as String?,
      destination: json['destination'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      fuelAdded: (json['fuelAdded'] as num?)?.toDouble(),
      odometerAtFuel: json['odometerAtFuel'] as int?,
      note: json['note'] as String?,
    );
  }

  @override
  String toString() {
    return 'Addridemodel{startingKm: $startingKm, endingKm: $endingKm, rideDate: $rideDate, startingPoint: $startingPoint, destination: $destination, startTime: $startTime, endTime: $endTime, fuelAdded: $fuelAdded, odometerAtFuel: $odometerAtFuel, note: $note}';
  }
}
