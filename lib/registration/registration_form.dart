import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:jsskos_app/Authentication/repository/Admission_repository.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  List<Step> stepList() => [
        Step(
            state:
                _activeStepIndex <= 0 ? StepState.indexed : StepState.complete,
            isActive: (_activeStepIndex == 0),
            title: Text("Personal Details",
                style: _activeStepIndex == 0
                    ? const TextStyle(fontWeight: FontWeight.w700)
                    : const TextStyle(fontWeight: FontWeight.w400)),
            content: const Center(
              child: PersonalDetails(),
            )),
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.indexed : StepState.complete,
            isActive: _activeStepIndex == 1,
            title: Text("Contact Details",
                style: _activeStepIndex == 1
                    ? const TextStyle(fontWeight: FontWeight.w700)
                    : const TextStyle(fontWeight: FontWeight.w400)),
            content: const Center(
              child: ContactDetails(),
            )),
        Step(
            state:
                _activeStepIndex <= 2 ? StepState.indexed : StepState.complete,
            isActive: _activeStepIndex == 2,
            title: Text("Education background Details",
                style: _activeStepIndex == 2
                    ? const TextStyle(fontWeight: FontWeight.w700)
                    : const TextStyle(fontWeight: FontWeight.w400)),
            content: const Center(
              child: EducationalBackgroundDetails(),
            )),
        Step(
            state:
                _activeStepIndex <= 3 ? StepState.indexed : StepState.complete,
            isActive: _activeStepIndex == 3,
            title: Text("Document Upload ",
                style: _activeStepIndex == 3
                    ? const TextStyle(fontWeight: FontWeight.w700)
                    : const TextStyle(fontWeight: FontWeight.w400)),
            content: const Center(
              child: DocumentUpload(),
            )),
      ];

  int _activeStepIndex = 0;

  onStepTapped(int val) {
    setState(() {
      _activeStepIndex = val;
    });
  }

  Widget controlsBuilder(context, details) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        if (0 < _activeStepIndex && _activeStepIndex < stepList().length - 1)
          ElevatedButton(
              onPressed: details.onStepCancel, child: const Text('Previous')),
        if (_activeStepIndex < stepList().length - 1)
          ElevatedButton(
              onPressed: details.onStepContinue, child: const Text('Next')),
        if (_activeStepIndex == stepList().length - 1)
          Column(
            children: [
              ElevatedButton(
                  onPressed: details.onStepCancel,
                  child: const Text('Previous')),
              ElevatedButton(
                  onPressed: details.onStepContinue,
                  child: const Text('Submit Online Admission Form')),
            ],
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Registration Form for Secondary",
        style: TextStyle(fontWeight: FontWeight.w900),
      )),
      body: Stepper(
        currentStep: _activeStepIndex,
        onStepTapped: onStepTapped,
        steps: stepList(),
        onStepContinue: () {
          if (_activeStepIndex < (stepList().length - 1)) {
            setState(() {
              _activeStepIndex += 1;
            });
          }
        },
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }

          setState(() {
            _activeStepIndex -= 1;
          });
        },
        controlsBuilder: controlsBuilder,
      ),
    );
  }
}

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final controller = Get.put(AdmissionRepository());
  TextEditingController _nameController = TextEditingController();
  TextEditingController _fatherNameController = TextEditingController();
  TextEditingController _motherNameController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _selectedGender = 'Male'; // Default gender
  TextEditingController _aadhaarNumber =
      TextEditingController(); // Aadhaar Number
  String _selectedReligion = 'Hindu'; // Default religion
  String _selectedCaste = "General";

  final List<String> genderOptions = ['Male', 'Female', 'Other'];

  final List<String> religionOptions = [
    'Hindu',
    'Muslim',
    'Christian',
    'Sikh',
    'Jain',
    'Buddhist',
    'Other'
  ];

  final List<String> casteOptions = [
    "General",
    "Cat-1",
    "OBC",
    "SC",
    "ST",
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _fatherNameController.dispose();
    _motherNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  final GlobalKey<FormState> _personalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _personalKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name of the Candidate',
                  hintText: 'Enter your full name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _fatherNameController,
                decoration: const InputDecoration(
                  labelText: "Father's Name",
                  hintText: "Enter your father's name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _motherNameController,
                decoration: const InputDecoration(
                  labelText: "Mother's Name",
                  hintText: "Enter your mother's name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      controller: TextEditingController(
                        text: "${_selectedDate.toLocal()}".split(' ')[0],
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Date of Birth',
                        hintText: 'Select your date of birth',
                        prefixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(),
                      ),
                      onTap: () => _selectDate(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue!;
                  });
                },
                items:
                    genderOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 12,
                  decoration: const InputDecoration(
                    labelText: 'Aadhaar Number',
                    hintText: 'Enter your 12-digit Aadhaar number',
                    border: OutlineInputBorder(),
                  ),
                  controller: _aadhaarNumber),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: _selectedReligion,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedReligion = newValue!;
                  });
                },
                items: religionOptions
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Religion',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCaste,
                items:
                    casteOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCaste = newValue!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Caste',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  controller.AddpersonalDetails(
                      _nameController.text.trim(),
                      _fatherNameController.text.trim(),
                      _motherNameController.text.trim(),
                      _selectedDate,
                      _selectedGender,
                      _aadhaarNumber.text.trim(),
                      _selectedReligion,
                      _selectedCaste);
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactDetails extends StatefulWidget {
  const ContactDetails({super.key});

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  final controller = Get.put(AdmissionRepository());
  bool _declarationChecked = false;
  final GlobalKey<FormState> _contactKey = GlobalKey<FormState>();
  TextEditingController pincode = TextEditingController();
  TextEditingController postalAdress = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _altPhoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String _selectedState = 'Karnataka'; // Default state
  String _selectedDistrict = 'Mysuru';
  // Default district

  final Map<String, List<String>> stateDistrictMap = {
    'Andhra Pradesh': [
      'Anantapur',
      'Chittoor',
      'East Godavari',
      'Guntur',
      'Krishna',
      'Kurnool',
      'Nellore',
      'Prakasam',
      'Srikakulam',
      'Visakhapatnam',
      'Vizianagaram',
      'West Godavari',
      'YSR District'
    ],
    'Arunachal Pradesh': [
      'Anjaw',
      'Changlang',
      'East Kameng',
      'East Siang',
      'Kamle',
      'Kra Daadi',
      'Kurung Kumey',
      'Lepa Rada',
      'Lohit',
      'Longding',
      'Lower Dibang Valley',
      'Lower Siang',
      'Lower Subansiri',
      'Namsai',
      'Pakke Kessang',
      'Papum Pare',
      'Shi Yomi',
      'Siang',
      'Tawang',
      'Tirap',
      'Upper Dibang Valley',
      'Upper Siang',
      'Upper Subansiri',
      'West Kameng',
      'West Siang'
    ],
    'Assam': [
      'Baksa',
      'Barpeta',
      'Biswanath',
      'Bongaigaon',
      'Cachar',
      'Charaideo',
      'Chirang',
      'Darrang',
      'Dhemaji',
      'Dhubri',
      'Dibrugarh',
      'Dima Hasao',
      'Goalpara',
      'Golaghat',
      'Hailakandi',
      'Hojai',
      'Jorhat',
      'Kamrup',
      'Kamrup Metropolitan',
      'Karbi Anglong',
      'Karimganj',
      'Kokrajhar',
      'Lakhimpur',
      'Majuli',
      'Morigaon',
      'Nagaon',
      'Nalbari',
      'Sivasagar',
      'Sonitpur',
      'South Salmara-Mankachar',
      'Tinsukia',
      'Udalguri',
      'West Karbi Anglong'
    ],
    'Bihar': [
      'Araria',
      'Arwal',
      'Aurangabad',
      'Banka',
      'Begusarai',
      'Bhagalpur',
      'Bhojpur',
      'Buxar',
      'Darbhanga',
      'East Champaran',
      'Gaya',
      'Gopalganj',
      'Jamui',
      'Jehanabad',
      'Kaimur',
      'Katihar',
      'Khagaria',
      'Kishanganj',
      'Lakhisarai',
      'Madhepura',
      'Madhubani',
      'Munger',
      'Muzaffarpur',
      'Nalanda',
      'Nawada',
      'Patna',
      'Purnia',
      'Rohtas',
      'Saharsa',
      'Samastipur',
      'Saran',
      'Sheikhpura',
      'Sheohar',
      'Sitamarhi',
      'Siwan',
      'Supaul',
      'Vaishali',
      'West Champaran'
    ],
    'Chhattisgarh': [
      'Balod',
      'Baloda Bazar',
      'Balrampur',
      'Bastar',
      'Bemetara',
      'Bijapur',
      'Bilaspur',
      'Dantewada',
      'Dhamtari',
      'Durg',
      'Gariaband',
      'Gaurela-Pendra-Marwahi',
      'Janjgir-Champa',
      'Jashpur',
      'Kabirdham',
      'Kanker',
      'Kondagaon',
      'Korba',
      'Koriya',
      'Mahasamund',
      'Mungeli',
      'Narayanpur',
      'Raigarh',
      'Raipur',
      'Rajnandgaon',
      'Sukma',
      'Surajpur',
      'Surguja'
    ],
    'Goa': ['North Goa', 'South Goa'],
    'Gujarat': [
      'Ahmedabad',
      'Amreli',
      'Anand',
      'Aravalli',
      'Banaskantha',
      'Bharuch',
      'Bhavnagar',
      'Botad',
      'Chhota Udaipur',
      'Dahod',
      'Dang',
      'Devbhoomi Dwarka',
      'Gandhinagar',
      'Gir Somnath',
      'Jamnagar',
      'Junagadh',
      'Kheda',
      'Kutch',
      'Mahisagar',
      'Mehsana',
      'Morbi',
      'Narmada',
      'Navsari',
      'Panchmahal',
      'Patan',
      'Porbandar',
      'Rajkot',
      'Sabarkantha',
      'Surat',
      'Surendranagar',
      'Tapi',
      'Vadodara',
      'Valsad'
    ],
    'Haryana': [
      'Ambala',
      'Bhiwani',
      'Charkhi Dadri',
      'Faridabad',
      'Fatehabad',
      'Gurugram',
      'Hisar',
      'Jhajjar',
      'Jind',
      'Kaithal',
      'Karnal',
      'Kurukshetra',
      'Mahendragarh',
      'Nuh',
      'Palwal',
      'Panchkula',
      'Panipat',
      'Rewari',
      'Rohtak',
      'Sirsa',
      'Sonipat',
      'Yamunanagar'
    ],
    'Himachal Pradesh': [
      'Bilaspur',
      'Chamba',
      'Hamirpur',
      'Kangra',
      'Kinnaur',
      'Kullu',
      'Lahaul & Spiti',
      'Mandi',
      'Shimla',
      'Sirmaur',
      'Solan',
      'Una'
    ],
    'Jharkhand': [
      'Bokaro',
      'Chatra',
      'Deoghar',
      'Dhanbad',
      'Dumka',
      'East Singhbhum',
      'Garhwa',
      'Giridih',
      'Godda',
      'Gumla',
      'Hazaribagh',
      'Jamtara',
      'Khunti',
      'Koderma',
      'Latehar',
      'Lohardaga',
      'Pakur',
      'Palamu',
      'Ramgarh',
      'Ranchi',
      'Sahebganj',
      'Seraikela-Kharsawan',
      'Simdega',
      'West Singhbhum'
    ],
    'Karnataka': [
      'Bagalkot',
      'Ballari',
      'Belagavi',
      'Bengaluru Rural',
      'Bengaluru Urban',
      'Bidar',
      'Chamarajanagar',
      'Chikkaballapur',
      'Chikkamagaluru',
      'Chitradurga',
      'Dakshina Kannada',
      'Davanagere',
      'Dharwad',
      'Gadag',
      'Hassan',
      'Haveri',
      'Kalaburagi',
      'Kodagu',
      'Kolar',
      'Koppal',
      'Mandya',
      'Mysuru',
      'Raichur',
      'Ramanagara',
      'Shivamogga',
      'Tumakuru',
      'Udupi',
      'Uttara Kannada',
      'Vijayapura',
      'Yadgir'
    ],
    'Kerala': [
      'Alappuzha',
      'Ernakulam',
      'Idukki',
      'Kannur',
      'Kasaragod',
      'Kollam',
      'Kottayam',
      'Kozhikode',
      'Malappuram',
      'Palakkad',
      'Pathanamthitta',
      'Thiruvananthapuram',
      'Thrissur',
      'Wayanad'
    ],
    'Madhya Pradesh': [
      'Agar Malwa',
      'Alirajpur',
      'Anuppur',
      'Ashoknagar',
      'Balaghat',
      'Barwani',
      'Betul',
      'Bhind',
      'Bhopal',
      'Burhanpur',
      'Chhatarpur',
      'Chhindwara',
      'Damoh',
      'Datia',
      'Dewas',
      'Dhar',
      'Dindori',
      'Guna',
      'Gwalior',
      'Harda',
      'Hoshangabad',
      'Indore',
      'Jabalpur',
      'Jhabua',
      'Katni',
      'Khandwa',
      'Khargone',
      'Mandla',
      'Mandsaur',
      'Morena',
      'Narsinghpur',
      'Neemuch',
      'Panna',
      'Raisen',
      'Rajgarh',
      'Ratlam',
      'Rewa',
      'Sagar',
      'Satna',
      'Sehore',
      'Seoni',
      'Shahdol',
      'Shajapur',
      'Sheopur',
      'Shivpuri',
      'Sidhi',
      'Singrauli',
      'Tikamgarh',
      'Ujjain',
      'Umaria',
      'Vidisha'
    ],
    'Maharashtra': [
      'Ahmednagar',
      'Akola',
      'Amravati',
      'Aurangabad',
      'Beed',
      'Bhandara',
      'Buldhana',
      'Chandrapur',
      'Dhule',
      'Gadchiroli',
      'Gondia',
      'Hingoli',
      'Jalgaon',
      'Jalna',
      'Kolhapur',
      'Latur',
      'Mumbai City',
      'Mumbai Suburban',
      'Nagpur',
      'Nanded',
      'Nandurbar',
      'Nashik',
      'Osmanabad',
      'Palghar',
      'Parbhani',
      'Pune',
      'Raigad',
      'Ratnagiri',
      'Sangli',
      'Satara',
      'Sindhudurg',
      'Solapur',
      'Thane',
      'Wardha',
      'Washim',
      'Yavatmal'
    ],
    'Manipur': [
      'Bishnupur',
      'Chandel',
      'Churachandpur',
      'Imphal East',
      'Imphal West',
      'Jiribam',
      'Kakching',
      'Kamjong',
      'Kangpokpi',
      'Noney',
      'Pherzawl',
      'Senapati',
      'Tamenglong',
      'Tengnoupal',
      'Thoubal',
      'Ukhrul'
    ],
    'Meghalaya': [
      'East Garo Hills',
      'East Jaintia Hills',
      'East Khasi Hills',
      'North Garo Hills',
      'Ri Bhoi',
      'South Garo Hills',
      'South West Garo Hills',
      'South West Khasi Hills',
      'West Garo Hills',
      'West Jaintia Hills',
      'West Khasi Hills'
    ],
    'Mizoram': [
      'Aizawl',
      'Champhai',
      'Hnahthial',
      'Khawzawl',
      'Lawngtlai',
      'Lunglei',
      'Mamit',
      'Saiha',
      'Saitual',
      'Serchhip'
    ],
    'Nagaland': [
      'Dimapur',
      'Kiphire',
      'Kohima',
      'Longleng',
      'Mokokchung',
      'Mon',
      'Peren',
      'Phek',
      'Tuensang',
      'Wokha',
      'Zunheboto'
    ],
    'Odisha': [
      'Angul',
      'Balangir',
      'Balasore',
      'Bargarh',
      'Bhadrak',
      'Boudh',
      'Cuttack',
      'Deogarh',
      'Dhenkanal',
      'Gajapati',
      'Ganjam',
      'Jagatsinghpur',
      'Jajpur',
      'Jharsuguda',
      'Kalahandi',
      'Kandhamal',
      'Kendrapara',
      'Kendujhar',
      'Khordha',
      'Koraput',
      'Malkangiri',
      'Mayurbhanj',
      'Nabarangpur',
      'Nayagarh',
      'Nuapada',
      'Puri',
      'Rayagada',
      'Sambalpur',
      'Subarnapur',
      'Sundargarh'
    ],
    'Punjab': [
      'Amritsar',
      'Barnala',
      'Bathinda',
      'Faridkot',
      'Fatehgarh Sahib',
      'Fazilka',
      'Ferozepur',
      'Gurdaspur',
      'Hoshiarpur',
      'Jalandhar',
      'Kapurthala',
      'Ludhiana',
      'Mansa',
      'Moga',
      'Muktsar',
      'Pathankot',
      'Patiala',
      'Rupnagar',
      'Sahibzada Ajit Singh Nagar',
      'Sangrur',
      'Tarn Taran'
    ],
    'Rajasthan': [
      'Ajmer',
      'Alwar',
      'Banswara',
      'Baran',
      'Barmer',
      'Bharatpur',
      'Bhilwara',
      'Bikaner',
      'Bundi',
      'Chittorgarh',
      'Churu',
      'Dausa',
      'Dholpur',
      'Dungarpur',
      'Hanumangarh',
      'Jaipur',
      'Jaisalmer',
      'Jalore',
      'Jhalawar',
      'Jhunjhunu',
      'Jodhpur',
      'Karauli',
      'Kota',
      'Nagaur',
      'Pali',
      'Pratapgarh',
      'Rajsamand',
      'Sawai Madhopur',
      'Sikar',
      'Sirohi',
      'Sri Ganganagar',
      'Tonk',
      'Udaipur'
    ],
    'Sikkim': ['East Sikkim', 'North Sikkim', 'South Sikkim', 'West Sikkim'],
    'Tamil Nadu': [
      'Ariyalur',
      'Chengalpattu',
      'Chennai',
      'Coimbatore',
      'Cuddalore',
      'Dharmapuri',
      'Dindigul',
      'Erode',
      'Kallakurichi',
      'Kanchipuram',
      'Kanyakumari',
      'Karur',
      'Krishnagiri',
      'Madurai',
      'Nagapattinam',
      'Namakkal',
      'Nilgiris',
      'Perambalur',
      'Pudukkottai',
      'Ramanathapuram',
      'Ranipet',
      'Salem',
      'Sivaganga',
      'Tenkasi',
      'Thanjavur',
      'Theni',
      'Thoothukudi',
      'Tiruchirappalli',
      'Tirunelveli',
      'Tirupathur',
      'Tiruppur',
      'Tiruvallur',
      'Tiruvannamalai',
      'Tiruvarur',
      'Vellore',
      'Viluppuram',
      'Virudhunagar'
    ],
    'Telangana': [
      'Adilabad',
      'Bhadradri Kothagudem',
      'Hyderabad',
      'Jagtial',
      'Jangaon',
      'Jayashankar Bhupalpally',
      'Jogulamba Gadwal',
      'Kamareddy',
      'Karimnagar',
      'Khammam',
      'Komaram Bheem',
      'Mahabubabad',
      'Mahabubnagar',
      'Mancherial',
      'Medak',
      'Medchal Malkajgiri',
      'Mulugu',
      'Nagarkurnool',
      'Nalgonda',
      'Narayanpet',
      'Nirmal',
      'Nizamabad',
      'Peddapalli',
      'Rajanna Sircilla',
      'Ranga Reddy',
      'Sangareddy',
      'Siddipet',
      'Suryapet',
      'Vikarabad',
      'Wanaparthy',
      'Warangal Rural',
      'Warangal Urban',
      'Yadadri Bhuvanagiri'
    ],
    'Tripura': [
      'Dhalai',
      'Gomati',
      'Khowai',
      'North Tripura',
      'Sepahijala',
      'South Tripura',
      'Unakoti',
      'West Tripura'
    ],
    'Uttar Pradesh': [
      'Agra',
      'Aligarh',
      'Ambedkar Nagar',
      'Amethi',
      'Amroha',
      'Auraiya',
      'Ayodhya',
      'Azamgarh',
      'Baghpat',
      'Bahraich',
      'Ballia',
      'Balrampur',
      'Banda',
      'Barabanki',
      'Bareilly',
      'Basti',
      'Bhadohi',
      'Bijnor',
      'Bulandshahr',
      'Chandauli',
      'Chitrakoot',
      'Deoria',
      'Etah',
      'Etawah',
      'Farrukhabad',
      'Fatehpur',
      'Firozabad',
      'Gautam Buddh Nagar',
      'Ghaziabad',
      'Ghazipur',
      'Gonda',
      'Gorakhpur',
      'Hamirpur',
      'Hapur',
      'Hardoi',
      'Hathras',
      'Jalaun',
      'Jaunpur',
      'Jhansi',
      'Kannauj',
      'Kanpur Dehat',
      'Kanpur Nagar',
      'Kasganj',
      'Kaushambi',
      'Kheri',
      'Kushinagar',
      'Lalitpur',
      'Lucknow',
      'Maharajganj',
      'Mahoba',
      'Mainpuri',
      'Mathura',
      'Mau',
      'Meerut',
      'Mirzapur',
      'Moradabad',
      'Muzaffarnagar',
      'Pilibhit',
      'Pratapgarh',
      'Prayagraj',
      'Rae Bareli',
      'Rampur',
      'Saharanpur',
      'Sambhal',
      'Sant Kabir Nagar',
      'Shahjahanpur',
      'Shamli',
      'Shrawasti',
      'Siddharthnagar',
      'Sitapur',
      'Sonbhadra',
      'Sultanpur',
      'Unnao',
      'Varanasi'
    ],
    'Uttarakhand': [
      'Almora',
      'Bageshwar',
      'Chamoli',
      'Champawat',
      'Dehradun',
      'Haridwar',
      'Nainital',
      'Pauri Garhwal',
      'Pithoragarh',
      'Rudraprayag',
      'Tehri Garhwal',
      'Udham Singh Nagar',
      'Uttarkashi'
    ],
    'West Bengal': [
      'Alipurduar',
      'Bankura',
      'Birbhum',
      'Cooch Behar',
      'Dakshin Dinajpur',
      'Darjeeling',
      'Hooghly',
      'Howrah',
      'Jalpaiguri',
      'Jhargram',
      'Kalimpong',
      'Kolkata',
      'Malda',
      'Murshidabad',
      'Nadia',
      'North 24 Parganas',
      'Paschim Bardhaman',
      'Paschim Medinipur',
      'Purba Bardhaman',
      'Purba Medinipur',
      'Purulia',
      'South 24 Parganas',
      'Uttar Dinajpur'
    ],
    'Andaman and Nicobar Islands': [
      'Nicobar',
      'North and Middle Andaman',
      'South Andaman'
    ],
    'Chandigarh': ['Chandigarh'],
    "Dadra and Nagar Haveli": [
      'Dadra and Nagar Haveli',
    ],
    'Daman and Diu': ['Daman', 'Diu'],
    'Lakshadweep': ['Lakshadweep'],
    'Delhi': [
      'Central Delhi',
      'East Delhi',
      'New Delhi',
      'North Delhi',
      'North East Delhi',
      'North West Delhi',
      'Shahdara',
      'South Delhi',
      'South East Delhi',
      'South West Delhi',
      'West Delhi'
    ],
    'Puducherry': ['Karaikal', 'Mahe', 'Puducherry', 'Yanam'],
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _contactKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedState,
                  onChanged: (value) {
                    setState(() {
                      _selectedState = value!;
                      _selectedDistrict = stateDistrictMap[_selectedState]![
                          0]; // Reset District
                    });
                  },
                  items: stateDistrictMap.keys.map((selectedState) {
                    return DropdownMenuItem(
                      value: selectedState,
                      child: Text(selectedState),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Select State',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedDistrict,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDistrict = newValue!;
                    });
                  },
                  items: stateDistrictMap[_selectedState]!
                      .map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  decoration: const InputDecoration(
                    labelText: 'District',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: postalAdress,
                  keyboardType: TextInputType.multiline,
                  maxLines: null, // Allows multiple lines for the address
                  decoration: const InputDecoration(
                    labelText: 'Postal Address',
                    hintText: 'Enter your postal address',
                    border: OutlineInputBorder(),
                  ),
                  // You can use a validator if needed
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter your postal address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: pincode,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'PIN Code',
                    hintText: 'Enter your PIN code',
                    border: OutlineInputBorder(),
                  ),
                  // You can use a validator to ensure proper PIN code format if needed
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter a PIN code';
                    } else if (value.length != 6) {
                      return 'Invalid PIN code';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Enter your phone number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _altPhoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Alternate Phone Number',
                    hintText: 'Enter an alternate phone number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email address',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CheckboxListTile(
                  title: const Text(
                    "I, the deponent, do hereby solemnly declare and verify that the contents of the above declaration are true to the best of my knowledge and belief, and nothing material has been concealed or suppressed by me.",
                    style: TextStyle(fontSize: 16),
                  ),
                  value: _declarationChecked,
                  onChanged: (value) {
                    setState(() {
                      _declarationChecked = value!;
                    });
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {
                      controller.AddContactDetails(
                          _phoneNumberController.text,
                          _altPhoneNumberController.text,
                          _selectedState,
                          _selectedDistrict,
                          postalAdress.text,
                          pincode.text);
                    },
                    child: const Text("Save"))
              ],
            ),
          )),
    );
  }
}

class EducationalBackgroundDetails extends StatefulWidget {
  const EducationalBackgroundDetails({super.key});

  @override
  State<EducationalBackgroundDetails> createState() =>
      _EducationalBackgroundDetailsState();
}

class _EducationalBackgroundDetailsState
    extends State<EducationalBackgroundDetails> {
  final controller = Get.put(AdmissionRepository());
  final GlobalKey<FormState> _eduKey = GlobalKey<FormState>();
  String _selectedCourse = "Admission in 10th Class";
  String _selectedDistrict = "Mysuru";
  String _selectedArea = "Hunsur";
  List<String> _selectedSubjects = [];
  List<String> _selectedLangSubjects = [];

  final List<String> subjects = [
    "Mathematics - 211",
    "Science and Technology - 212",
    "Social Science - 213 ",
    "Economics - 214 ",
    "Business Studies - 215",
    "Home Science - 216"
  ];
  final List<String> Langsubjects = [
    "Kannada - 208",
    "English - 202",
    "Hindi - 201"
  ];

  final List<String> courses = [
    "Admission in 10th Class"
    // Add more course options as needed
  ];
  final Map<String, List<String>> districtAreasMap = {
    'Bagalkot': ['Badami', 'Hungund', 'Bilagi'],
    'Ballari': ['Bellary City', 'Siruguppa', 'Hospet'],
    'Belagavi': ['Belgaum City', 'Gokak', 'Khanapur'],
    'Bengaluru Rural': ['Devanahalli', 'Nelamangala', 'Doddaballapur'],
    'Bengaluru Urban': ['Bengaluru', 'Yelahanka', 'Peenya'],
    'Bidar': ['Bidar City', 'Aurad', 'Basavakalyan'],
    'Chamarajanagar': ['Chamarajanagar', 'Gundlupet', 'Kollegal'],
    'Chikkaballapur': ['Chikkaballapur', 'Chintamani', 'Sidlaghatta'],
    'Chikkamagaluru': ['Chikkamagaluru', 'Kadur', 'Tarikere'],
    'Chitradurga': ['Chitradurga', 'Hosadurga', 'Holalkere'],
    'Dakshina Kannada': ['Mangaluru', 'Bantwal', 'Puttur'],
    'Davanagere': ['Davanagere', 'Harihar', 'Jagalur'],
    'Dharwad': ['Dharwad', 'Hubbali', 'Kalghatgi'],
    'Gadag': ['Gadag-Betageri', 'Mundargi', 'Nargund'],
    'Hassan': ['Hassan', 'Alur', 'Arkalgud'],
    'Haveri': ['Haveri', 'Byadagi', 'Ranebennur'],
    'Kalaburagi': ['Kalaburagi', 'Afzalpur', 'Jevargi'],
    'Kodagu': ['Madikeri', 'Somvarpet', 'Virajpet'],
    'Kolar': ['Kolar', 'Bangarapet', 'Mulbagal'],
    'Koppal': ['Koppal', 'Gangawati', 'Yelburga'],
    'Mandya': ['Mandya', 'Malavalli', 'Pandavapura'],
    'Mysuru': ['Mysuru', 'Mandya', 'Hunsur'],
    'Raichur': ['Raichur', 'Lingsugur', 'Manvi'],
    'Ramanagara': ['Ramanagara', 'Channarayapatna', 'Magadi'],
    'Shivamogga': ['Shivamogga', 'Bhadravati', 'Sorab'],
    'Tumakuru': ['Tumakuru', 'Gubbi', 'Koratagere'],
    'Udupi': ['Udupi', 'Karkala', 'Kundapura'],
    'Uttara Kannada': ['Karwar', 'Sirsi', 'Bhatkal'],
    'Vijayapura': ['Vijayapura', 'Indi', 'Bijapur'],
    'Yadgir': ['Yadgir', 'Shahpur', 'Shorapur'],
  };

  String _selectedMedium = 'English';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _eduKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Medium of Study',
                    border: OutlineInputBorder(),
                  ),
                  value:
                      _selectedMedium, // Provide the currently selected value
                  items: const [
                    DropdownMenuItem(
                      value: 'English',
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: 'Kannada',
                      child: Text('Kannada'),
                    ),
                  ],
                  onChanged: (value) {
                    // Handle when an option is selected
                    setState(() {
                      _selectedMedium = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  value: _selectedCourse,
                  onChanged: (value) {
                    setState(() {
                      _selectedCourse = value!;
                    });
                  },
                  items: courses.map((course) {
                    return DropdownMenuItem(
                      value: course,
                      child: Text(course),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Course Applied for',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Center(
                  child: Text(
                    "Select Subjects for Secondary (10th  Std) :  ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    "Group – A  ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Center(
                  child: Text(
                    "Languages & Code No.",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: Langsubjects.asMap().entries.map((entry) {
                      final index = entry.key;
                      final subject = entry.value;
                      final isEven =
                          index % 2 == 0; // Check if the index is even
                      return Container(
                        color: isEven ? Colors.grey[200] : Colors.transparent,
                        child: CheckboxListTile(
                          title: Text(subject),
                          value: _selectedSubjects.contains(subject),
                          onChanged: (checked) {
                            setState(() {
                              if (checked!) {
                                if (_selectedSubjects.length < 3) {
                                  _selectedSubjects.add(subject);
                                }
                              } else {
                                _selectedSubjects.remove(subject);
                              }
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Center(
                  child: Text(
                    "Group – B  ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Center(
                  child: Text(
                    "Select Optional Maximum  Subjects Three (3) & Code No.",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: subjects.asMap().entries.map((entry) {
                      final index = entry.key;
                      final subject = entry.value;
                      final isEven =
                          index % 2 == 0; // Check if the index is even
                      return Container(
                        color: isEven ? Colors.grey[200] : Colors.transparent,
                        child: CheckboxListTile(
                          title: Text(subject),
                          value: _selectedLangSubjects.contains(subject),
                          onChanged: (checked) {
                            setState(() {
                              if (checked!) {
                                if (_selectedLangSubjects.length < 3) {
                                  _selectedLangSubjects.add(subject);
                                }
                              } else {
                                _selectedLangSubjects.remove(subject);
                              }
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Center(
                  child: Text(
                    "Study Center Preference ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                // Dropdown for District selection
                DropdownButtonFormField<String>(
                  value: _selectedDistrict,
                  onChanged: (value) {
                    setState(() {
                      _selectedDistrict = value!;
                      _selectedArea = districtAreasMap[_selectedDistrict]![
                          0]; // Reset selected area
                    });
                  },
                  items: districtAreasMap.keys.map((district) {
                    return DropdownMenuItem(
                      value: district,
                      child: Text(district),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Select District',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                // Dropdown for Area selection based on selected district
                if (_selectedDistrict != null)
                  DropdownButtonFormField<String>(
                    value: _selectedArea,
                    onChanged: (value) {
                      setState(() {
                        _selectedArea = value!;
                      });
                    },
                    items: districtAreasMap[_selectedDistrict]?.map((area) {
                      return DropdownMenuItem(
                        value: area,
                        child: Text(area),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Select Area',
                      border: OutlineInputBorder(),
                    ),
                  ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      controller.AddEducationalBackgroundDetails(
                          _selectedCourse,
                          _selectedMedium,
                          _selectedArea,
                          _selectedDistrict,
                          _selectedSubjects,
                          _selectedLangSubjects);
                    },
                    child: const Text("Save"))
              ],
            ),
          )),
    );
  }
}

class DocumentUpload extends StatefulWidget {
  const DocumentUpload({super.key});

  @override
  State<DocumentUpload> createState() => _DocumentUploadState();
}

class _DocumentUploadState extends State<DocumentUpload> {
  final GlobalKey<FormState> _docUploadKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
            key: _docUploadKey,
            child: Column(
              children: [
                ImageUploadWidget(),
                const SizedBox(
                  height: 16,
                )
              ],
            )),
      ),
    );
  }
}

class ImageUploadWidget extends StatefulWidget {
  @override
  _ImageUploadWidgetState createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  final controller = Get.put(AdmissionRepository());
  XFile? _photo;
  XFile? _signature;
  PlatformFile? _certificate;
  XFile? _aadhaar;
  PlatformFile? _address;
  PlatformFile? _caste;
  PlatformFile? _anyOther;
  PlatformFile? _disability;
  bool isLoading = false;
  late File photo;
  late File signature;
  late File aadhar;
  late File certificate;
  late File caste;
  late File disability;
  late File address;
  late File anyOther;

  getCertificateFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: false);

      if (result != null) {
        setState(() {
          _certificate = result.files.first;
          certificate = File(result.files.first.path!);
        });
      }

      setState(() {
        isLoading = true;
      });
    } catch (e) {
      print(e);
    }
  }

  getPhotoByGallery() async {
    final image = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);

    setState(() {
      _photo = image;
      photo = File(image!.path);
    });
  }

  getSignatureByGallery() async {
    final image = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);

    setState(() {
      _signature = image;
      signature = File(image!.path);
    });
  }

  getAadhaarByGallery() async {
    final image = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);

    setState(() {
      _aadhaar = image;
      aadhar = File(image!.path);
    });
  }

  getAddressFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: false);

      if (result != null) {
        setState(() {
          _address = result!.files.first;
          address = File(result.files.first.path!);
        });
      }

      setState(() {
        isLoading = true;
      });
    } catch (e) {
      print(e);
    }
  }

  getCasteFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: false);

      if (result != null) {
        setState(() {
          _caste = result!.files.first;
          caste = File(result.files.first.path!);
        });
      }

      setState(() {
        isLoading = true;
      });
    } catch (e) {
      print(e);
    }
  }

  getDisabilityFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: false);

      if (result != null) {
        setState(() {
          _disability = result!.files.first;
          disability = File(result.files.first.path!);
        });
      }

      setState(() {
        isLoading = true;
      });
    } catch (e) {
      print(e);
    }
  }

  getOtherFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: false);

      if (result != null) {
        setState(() {
          _anyOther = result!.files.first;
          anyOther = File(result.files.first.path!);
        });
      }

      setState(() {
        isLoading = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity, // Set the width of the box
          height: 100, // Set the height of the box
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(
                  255, 123, 120, 120), // Set the border color
              width: 2.0, // Set the border width
            ),
          ),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: getPhotoByGallery,
                icon: const Icon(Icons.photo),
                label: const Text('Upload Photo (JPEG ONLY)'),
              ),
              if (_photo != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(_photo!.name,
                      style: const TextStyle(color: Colors.green)),
                )
              // Image.file(
              //   File(_aadhaar!.path),
              //   width: 150,
              //   height: 150,
              //   fit: BoxFit.cover,
              // )
              else
                const Center(
                    child: Text(
                  "No file choosen",
                  style: TextStyle(color: Colors.red),
                )),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity, // Set the width of the box
          height: 100, // Set the height of the box
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(
                  255, 123, 120, 120), // Set the border color
              width: 2.0, // Set the border width
            ),
          ),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: getSignatureByGallery,
                icon: const Icon(Icons.photo),
                label: const Text('Upload Signature (JPEG ONLY)'),
              ),
              if (_signature != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(_signature!.name,
                      style: const TextStyle(color: Colors.green)),
                )
              // Image.file(
              //   File(_aadhaar!.path),
              //   width: 150,
              //   height: 150,
              //   fit: BoxFit.cover,
              // )
              else
                const Center(
                  child: Text(
                    "No file choosen",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity, // Set the width of the box
          height: 170, // Set the height of the box
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(
                  255, 123, 120, 120), // Set the border color
              width: 2.0, // Set the border width
            ),
          ),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: getCertificateFile,
                icon: const Icon(Icons.photo),
                label: const Text('Upload Certificate'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: Text(
                      "7th, 8th, 9th and 10th  (pass/fail ) class school Leaving Certificate (TC)"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (_certificate != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    _certificate!.name,
                    style: const TextStyle(color: Colors.green),
                  ),
                )
              // Image.file(
              //   File(_aadhaar!.path),
              //   width: 150,
              //   height: 150,
              //   fit: BoxFit.cover,
              // )
              else
                const Center(
                    child: Text(
                  "No file choosen",
                  style: TextStyle(color: Colors.red),
                )),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity, // Set the width of the box
          height: 100, // Set the height of the box
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(
                  255, 123, 120, 120), // Set the border color
              width: 2.0, // Set the border width
            ),
          ),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: getAadhaarByGallery,
                icon: const Icon(Icons.photo),
                label: const Text('Upload Aadhaar Card (JPEG ONLY)'),
              ),
              if (_aadhaar != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    _aadhaar!.name,
                    style: const TextStyle(color: Colors.green),
                  ),
                )
              // Image.file(
              //   File(_aadhaar!.path),
              //   width: 150,
              //   height: 150,
              //   fit: BoxFit.cover,
              // )
              else
                const Center(
                    child: Text(
                  "No file choosen",
                  style: TextStyle(color: Colors.red),
                )),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity, // Set the width of the box
          height: 100, // Set the height of the box
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(
                  255, 123, 120, 120), // Set the border color
              width: 2.0, // Set the border width
            ),
          ),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: getAddressFile,
                icon: const Icon(Icons.photo),
                label: const Text('Upload Address Proof'),
              ),
              if (_address != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    _address!.name,
                    style: const TextStyle(color: Colors.green),
                  ),
                )
              // Image.file(
              //   File(_aadhaar!.path),
              //   width: 150,
              //   height: 150,
              //   fit: BoxFit.cover,
              // )
              else
                const Center(
                    child: Text(
                  "No file choosen",
                  style: TextStyle(color: Colors.red),
                )),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity, // Set the width of the box
          height: 100, // Set the height of the box
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(
                  255, 123, 120, 120), // Set the border color
              width: 2.0, // Set the border width
            ),
          ),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: getCasteFile,
                icon: const Icon(Icons.photo),
                label: const Text('Upload Category/Caste Certificate'),
              ),
              const SizedBox(
                height: 10,
              ),
              if (_caste != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    _caste!.name,
                    style: const TextStyle(color: Colors.green),
                  ),
                )
              else
                const Center(
                    child: Text(
                  "No file choosen",
                  style: TextStyle(color: Colors.red),
                )),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity, // Set the width of the box
          height: 100, // Set the height of the box
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(
                  255, 123, 120, 120), // Set the border color
              width: 2.0, // Set the border width
            ),
          ),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: getDisabilityFile,
                icon: const Icon(Icons.photo),
                label: const Text('Upload Disability Certificate'),
              ),
              const SizedBox(
                height: 10,
              ),
              if (_disability != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    _disability!.name,
                    style: const TextStyle(color: Colors.green),
                  ),
                )
              else
                const Center(
                    child: Text(
                  "No file choosen",
                  style: TextStyle(color: Colors.red),
                )),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity, // Set the width of the box
          height: 100, // Set the height of the box
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(
                  255, 123, 120, 120), // Set the border color
              width: 2.0, // Set the border width
            ),
          ),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: getOtherFile,
                icon: const Icon(Icons.photo),
                label: const Text('Upload Any other Certificate'),
              ),
              const SizedBox(
                height: 10,
              ),
              if (_anyOther != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    _anyOther!.name,
                    style: const TextStyle(color: Colors.green),
                  ),
                )
              else
                const Center(
                    child: Text(
                  "No file choosen",
                  style: TextStyle(color: Colors.red),
                )),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
            onPressed: () {
              controller.UploadDocuments(photo, "Photo");
              controller.UploadDocuments(signature, "Signature");
              controller.UploadDocuments(aadhar, "Aadhaar");
              controller.UploadDocuments(
                  certificate, "Certificate 7th,8th,9th");
              controller.UploadDocuments(address, "Address Proof");
              controller.UploadDocuments(caste, "Category/Caste Certificate");
              controller.UploadDocuments(disability, "Disability Certificate");
              controller.UploadDocuments(anyOther, "Any Other Certificate");
            },
            child: Text("Save"))
      ],
    );
  }
}
