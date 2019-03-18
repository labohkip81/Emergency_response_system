

class Customer {
    String bloodGroup;
    String healthComplications;
    String doctorNote;

    Customer({
        this.bloodGroup,
        this.healthComplications,
        this.doctorNote,
    });

  Customer.fromMap(Map first);

    String get bloodgroup => bloodGroup;
    String get healthcomplications=> healthComplications;
    String get doctornote => doctorNote;


    factory Customer.fromJson(Map<String, dynamic> data) => new Customer(
        bloodGroup: data["blood_group"],
        healthComplications: data["health_complication"],
        doctorNote: data["doctor_note"],
    );

    Map<String, dynamic> toJson() => {
        "blood_group": bloodGroup,
        "health_complication": healthComplications,
        "doctor_note": doctorNote,
    };
}
