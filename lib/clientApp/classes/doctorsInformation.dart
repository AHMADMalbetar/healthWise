class doctorsInformation
{
  final String doctorName;
  final double doctorRate;
  final String doctorLocation;
  final String doctorWork;
  final String doctorImage;

  doctorsInformation(this.doctorName, this.doctorRate, this.doctorLocation, this.doctorWork, this.doctorImage);
}

List<nursesInformation> docInfo = [
  nursesInformation('Dr.Mohammad', 4.8, '3 Km', 'General', 'Images/doctor1.png'),
  nursesInformation('Dr.Mohammad ', 4.7, '2 Km', 'Lungs ', 'Images/doctor2.png'),
  nursesInformation('Dr.Ramez Istanbouli', 4.8, '4 Km', 'Dentist', 'Images/doctor1.png'),
  nursesInformation('Dr.Bana Hitalani', 4.8, '8 Km', 'Psychaitrist', 'Images/doctor2.png'),
  nursesInformation('Dr.Shahy Brkl', 4.5, '6 Km', 'Surgeon', 'Images/doctor1.png'),
  nursesInformation('Dr.Hassan Obtini', 4.2, '1 Km', 'Cardiologist', 'Images/doctor2.png'),
  nursesInformation('Dr.Mai Bakkour', 4.3, '2 Km', 'General', 'Images/doctor1.png'),
  nursesInformation('Dr.Zainab Ammorah', 4.3, '10 Km', 'Lungs ', 'Images/doctor2.png'),
  nursesInformation('Dr.Ahmad Kaakeh', 4.7, '6 Km', 'Dentist', 'Images/doctor1.png'),
  nursesInformation('Dr.Ahmad Albetar', 4.5, '12 Km', 'Psychaitrist', 'Images/doctor2.png'),
  nursesInformation('Dr.Laith Jawish', 4.4, '15 Km', 'Surgeon', 'Images/doctor1.png'),
  nursesInformation('Dr.Abd aljawad Rabie', 4.3, '6 Km', 'Cardiologist', 'Images/doctor2.png'),
];


class nursesInformation extends doctorsInformation
{
  nursesInformation(super.doctorName, super.doctorRate, super.doctorLocation, super.doctorWork, super.doctorImage);
}

List<nursesInformation> nurseInfo = [
  nursesInformation('Mr.Mohammad ', 4.8, '3 Km', '2 year', 'Images/nurse1.png'),
  nursesInformation('Mr.Mohammad ', 4.7, '2 Km', '3 year', 'Images/nurse2.png'),
  nursesInformation('Mr.Ramez Istanbouli', 4.8, '4 Km', '2 year', 'Images/nurse1.png'),
  nursesInformation('Mrs.Bana Hitalani', 4.8, '1 Km', '1 year', 'Images/nurse2.png'),
  nursesInformation('Mr.Shahy Brkl', 4.5, '3 Km', '6 year', 'Images/nurse1.png'),
  nursesInformation('Mr.Hassan Obtini', 4.2, '3 Km', '4 year', 'Images/nurse2.png'),
  nursesInformation('Mrs.Mai Bakkour', 4.3, '2 Km', '3 year', 'Images/nurse1.png'),
  nursesInformation('Mrs.Zainab Ammorah', 4.3, '3 Km', '2 year', 'Images/nurse2.png'),
  nursesInformation('Mr.Ahmad Kaakeh', 4.7, '6 Km', '1 year', 'Images/nurse1.png'),
  nursesInformation('Mr.Ahmad Albetar', 4.5, '2 Km', '5 year', 'Images/nurse2.png'),
  nursesInformation('Mr.Laith Jawish', 4.4, '5 Km', '1 year', 'Images/nurse1.png'),
  nursesInformation('Mr.Abd aljawad Rabie', 4.3, '6 Km', '2 year', 'Images/nurse2.png'),
];