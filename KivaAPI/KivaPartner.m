//
//  KivaPartner.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/13/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaPartner.h"
#import "KivaImage.h"
#import "KivaPartnerCountry.h"

static const NSString *kAvgLoanSizePercent			= @"average_loan_size_percent_per_capita_income";
static const NSString *kChargeFees					= @"charges_fees_and_interest";
static const NSString *kCountries					= @"countries";
static const NSString *kCurrencyExchangeLossRate	= @"currency_exchange_loss_rate";
static const NSString *kDefaultRate					= @"default_rate";
static const NSString *kDefaultRateNote				= @"default_rate_note";
static const NSString *kDelinquencyRate				= @"delinquency_rate";
static const NSString *kDelinquencyRateNote			= @"delinquency_rate_note";
static const NSString *kPartnerId					= @"id";
static const NSString *kImage						= @"image";
static const NSString *kLoansAtRiskRate				= @"loans_at_risk_rate";
static const NSString *kLoansPosted					= @"loans_posted";
static const NSString *kPortfolioYieldNote			= @"portfolio_yield_note";
static const NSString *kRating						= @"rating";
static const NSString *kStartDate					= @"start_date";
static const NSString *kStatus						= @"status";
static const NSString *kName						= @"name";
static const NSString *kTotalAmountRaised			= @"total_amount_raised";
static const NSString *kUrl							= @"url";

@implementation KivaPartner

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		_name = [dictionary objectForKey:kName];
		_url = [NSURL URLWithString:[dictionary objectForKey:kUrl]];
		_averageLoanSizePercentPerCapitaIncome = [NSNumber numberWithFloat:[[dictionary objectForKey:kAvgLoanSizePercent] floatValue]];
		_chargesFeesAndInterest = [dictionary objectForKey:kChargeFees];
		
		NSArray *countryArray = [dictionary objectForKey:kCountries];
		NSMutableArray *countryValues = [[NSMutableArray alloc] init];
		if (countryArray) {
			for (NSDictionary *d in countryArray) {
				[countryValues addObject:[[KivaPartnerCountry alloc] initWithDictionary:d]];
			}
		}
		
		_countries = [NSArray arrayWithArray:countryValues];
		_currencyExchangeLossRate = [NSNumber numberWithFloat:[[dictionary objectForKey:kCurrencyExchangeLossRate] floatValue]];
		_defaultRate = [NSNumber numberWithFloat:[[dictionary objectForKey:kDefaultRate] floatValue]];
		_defaultRateNote = [dictionary objectForKey:kDefaultRateNote];
		_delinquencyRate = [NSNumber numberWithFloat:[[dictionary objectForKey:kDelinquencyRate] floatValue]];
		_defaultRateNote = [dictionary objectForKey:kDelinquencyRateNote];
		_partnerId = [NSNumber numberWithInt:[[dictionary objectForKey:kPartnerId] intValue]];
		_image = [[KivaImage alloc] initWithDictionary:[dictionary objectForKey:kImage]];
		_loansAtRiskRate = [NSNumber numberWithInt:[[dictionary objectForKey:kLoansAtRiskRate] intValue]];
		_loansPosted = [NSNumber numberWithInt:[[dictionary objectForKey:kLoansPosted] intValue]];
		_portfolioYieldNote = [dictionary objectForKey:kPortfolioYieldNote];
		_rating = [dictionary objectForKey:kRating];
		
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
		_startDate = [formatter dateFromString:[dictionary objectForKey:kStartDate]];
		_status = [dictionary objectForKey:kStatus];
		_totalAmountRaised = [NSNumber numberWithFloat:[[dictionary objectForKey:kTotalAmountRaised] floatValue]];
	}

	return self;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"KivaPartner[name = %@, url = %@, averageLoanSizePercentPerCapitaIncome = %f, chargesFeesAndInterest = %d, countries = %@, currencyExchangeLossRate = %f, defaultRate = %f, defaultRateNote = %@, delinquencyRate= %f, delinquencyRateNote = %@, partnerId = %d, image = %@, loansAtRiskRate = %d, loansPosted = %d, portfolioYieldNote = %@, rating = %@, startDate = %@, status = %@, totalAmountRaised = %f]",
			_name,
			_url,
			[_averageLoanSizePercentPerCapitaIncome floatValue],
			_chargesFeesAndInterest,
			_countries,
			[_currencyExchangeLossRate floatValue],
			[_defaultRate floatValue],
			_defaultRateNote,
			[_delinquencyRate floatValue],
			_delinquencyRateNote,
			[_partnerId intValue],
			_image,
			[_loansAtRiskRate intValue],
			[_loansPosted intValue],
			_portfolioYieldNote,
			_rating,
			_startDate,
			_status,
			[_totalAmountRaised floatValue]];
}

@end
