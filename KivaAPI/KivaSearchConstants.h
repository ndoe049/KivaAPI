//
//  KivaLoanSearchConstants.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/15/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//
//	Constants that can be used for searching for loans (http://build.kiva.org/api#GET*|loans|search)

//Loan Status Values
static const NSString *kFundraising			= @"fundraising";
static const NSString *kFunded				= @"funded";
static const NSString *kInRepayment			= @"in_repayment";
static const NSString *kPaid				= @"paid";
static const NSString *kExpired				= @"expired";
static const NSString *kEndedWithLoss		= @"ended_with_loss";

//Gender Values
static const NSString *kMaleGender			= @"male";
static const NSString *kFemaleGender		= @"female";

//Region Values
static const NSString *kNorthAmerica		= @"na";
static const NSString *kCentralAmerica		= @"ca";
static const NSString *kSouthAmerica		= @"sa";
static const NSString *kAfrica				= @"af";
static const NSString *kAsia				= @"as";
static const NSString *kMiddleEast			= @"me";
static const NSString *kEasternEurope		= @"ee";
static const NSString *kWesternEurope		= @"we";
static const NSString *kOceania				= @"oc";

//Country Values
static const NSString *kAfghanistan			= @"AF";
static const NSString *kAlbania				= @"AL";
static const NSString *kArmenia				= @"AM";
static const NSString *kAzerbaijan			= @"AZ";
static const NSString *kBosnia				= @"BA";
static const NSString *kBurkinaFaso			= @"BF";
static const NSString *kBulgaria			= @"BG";
static const NSString *kBurundi				= @"BI";
static const NSString *kBenin				= @"BJ";
static const NSString *kBolivia				= @"BO";
static const NSString *kBrazil				= @"BR";
static const NSString *kBotswana			= @"BW";
static const NSString *kBelize				= @"BZ";
static const NSString *kDemocraticCongo		= @"CD";
static const NSString *kCongo				= @"CG";
static const NSString *kCotedIvoire			= @"CI";
static const NSString *kChile				= @"CL";
static const NSString *kCameroon			= @"CM";
static const NSString *kChina				= @"CN";
static const NSString *kColombia			= @"CO";
static const NSString *kCostaRica			= @"CR";
static const NSString *kDominicanRepublic	= @"DO";
static const NSString *kEcuador				= @"EC";
static const NSString *kEgypt				= @"EG";
static const NSString *kGeorgia				= @"GE";
static const NSString *kGhana				= @"GH";
static const NSString *kGuatemala			= @"GT";
static const NSString *kHonduras			= @"HN";
static const NSString *kHaiti				= @"HT";
static const NSString *kIndonesia			= @"ID";
static const NSString *kIndia				= @"IN";
static const NSString *kIraq				= @"IQ";
static const NSString *kJordan				= @"JO";
static const NSString *kKenya				= @"KE";
static const NSString *kKyrgyzstan			= @"KG";
static const NSString *kCambodia			= @"KH";
static const NSString *kLoas				= @"LA";
static const NSString *kLebanon				= @"LB";
static const NSString *kSriLanka			= @"LK";
static const NSString *kLiberia				= @"LR";
static const NSString *kMoldova				= @"MD";
static const NSString *kMali				= @"ML";
static const NSString *kMyanmar				= @"MM";
static const NSString *kMongolia			= @"MN";
static const NSString *kMauritania			= @"MR";
static const NSString *kMalawi				= @"MW";
static const NSString *kMexico				= @"MX";
static const NSString *kMozambiquw			= @"MZ";
static const NSString *kNamibia				= @"NA";
static const NSString *kNigeria				= @"NG";
static const NSString *kNicaragua			= @"NI";
static const NSString *kNepal				= @"NP";
static const NSString *kPanama				= @"PA";
static const NSString *kPeru				= @"PE";
static const NSString *kPapuaNewGuinea		= @"PG";
static const NSString *kPhilippines			= @"PH";
static const NSString *kPakistan			= @"PK";
static const NSString *kPalestine			= @"PS";
static const NSString *kParaguay			= @"PY";
static const NSString *kRwanda				= @"RW";
static const NSString *kSolomonIslands		= @"SB";
static const NSString *kSingapore			= @"SG";
static const NSString *kSierraLeone			= @"SL";
static const NSString *kSenegal				= @"SN";
static const NSString *kSomalia				= @"SO";
static const NSString *kSuriname			= @"SR";
static const NSString *kElSalvador			= @"SV";
static const NSString *kChad				= @"TD";
static const NSString *kTogo				= @"TG";
static const NSString *kThailand			= @"TH";
static const NSString *kTajikistan			= @"TJ";
static const NSString *kTimorLeste			= @"TL";
static const NSString *kTunisia				= @"TN";
static const NSString *kTurkey				= @"TR";
static const NSString *kTanzania			= @"TZ";
static const NSString *kUkraine				= @"UA";
static const NSString *kUganda				= @"UG";
static const NSString *kUnitedStates		= @"US";
static const NSString *kSaintVincent		= @"VC";
static const NSString *kVietNam				= @"VN";
static const NSString *kVanuatu				= @"VU";
static const NSString *kSamoa				= @"WS";
static const NSString *kYemen				= @"YE";
static const NSString *kSouthAfrica			= @"ZA";
static const NSString *kZambia				= @"ZM";
static const NSString *kZimbabwe			= @"ZW";

//Sector Values
static const NSString *kAgriculture			= @"Agriculture";
static const NSString *kArts				= @"Arts";
static const NSString *kClothing			= @"Clothing";
static const NSString *kConstruction		= @"Construction";
static const NSString *kEducation			= @"Education";
static const NSString *kEntertainment		= @"Entertainment";
static const NSString *kFood				= @"Food";
static const NSString *kHealth				= @"Health";
static const NSString *kHousing				= @"Housing";
static const NSString *kManufacturing		= @"Manufacturing";
static const NSString *kPersonalUse			= @"Personal Use";
static const NSString *kRetail				= @"Retail";
static const NSString *kServices			= @"Services";
static const NSString *kTransportation		= @"Transportation";
static const NSString *kWholesale			= @"Wholesale";

//Theme Values
static const NSString *kGreen				= @"Green";
static const NSString *kHigherEducation		= @"Higher Education";
static const NSString *kArabYouth			= @"Arab Youth";
static const NSString *kKivaCityLa			= @"Kiva City LA";
static const NSString *kIslamicFinance		= @"IslamicFinance";
static const NSString *kYouth				= @"Youth";
static const NSString *kStartUp				= @"Start-Up";
static const NSString *kWatherAndSanitation	= @"Water and Sanitation";
static const NSString *kVunerableGroups		= @"Vunerable Groups";
static const NSString *kFairTrade			= @"Fair Trade";
static const NSString *kRuralExclusion		= @"Rural Exclusion";
static const NSString *kMobileTechnology	= @"Mobile Technology";
static const NSString *kUnderfundedAreas	= @"Underfunded Areas";
static const NSString *kConflictZones		= @"Conflict Zones";
static const NSString *kJobCreation			= @"Job Creation";
static const NSString *kSME					= @"SME";
static const NSString *kGrowingBusinesses	= @"Growing Businesses";
static const NSString *kKivaCityDetroit		= @"Kiva City Detroit";
//static const NSString *kHealth				= @"Health;
static const NSString *kDisasterRecovery	= @"Disaster recovery";
static const NSString *kFlexibleCreditStudy	= @"Flexible Credit Study";
static const NSString *kInnovativeLoans		= @"Innovative Loans";

//Borrower Type Values (if not specified defaults to 'both')
static const NSString *kIndividual			= @"individuals";
static const NSString *kGroups				= @"groups";

//Sorting Values (if not specified defaults to 'newest')
static const NSString *kPopularity			= @"popularity";
static const NSString *kLoanAmount			= @"loan_amount";
static const NSString *kExpiration			= @"expiration";
static const NSString *kNewest				= @"newest";
static const NSString *kOldest				= @"oldest";
static const NSString *kAmountRemaining		= @"amount_remaining";
static const NSString *kRepaymentTerm		= @"repayment_term";
static const NSString *kRandom				= @"random";
