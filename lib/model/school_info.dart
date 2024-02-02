class SchoolInfo {
  final String name;
  final String officeOfEduCode;
  final String adminStandardsCode;

  SchoolInfo({
    required this.name,
    required this.officeOfEduCode,
    required this.adminStandardsCode,
  });

  SchoolInfo.empty()
      : name = '',
        officeOfEduCode = '',
        adminStandardsCode = '';

  factory SchoolInfo.fromJson(Map<String, dynamic> json) {
    return SchoolInfo(
      name: json['SCHUL_NM'],
      officeOfEduCode: json['ATPT_OFCDC_SC_CODE'],
      adminStandardsCode: json['SD_SCHUL_CODE'],
    );
  }
}
