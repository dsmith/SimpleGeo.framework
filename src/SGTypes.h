//
//  SGTypes.h
//  SimpleGeo.framework
//
//  Copyright (c) 2010, SimpleGeo Inc.
//  All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the <organization> nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#pragma mark Context Filters

#define SGContextFilterQuery @"query"
#define SGContextFilterFeatures @"features"
#define SGContextFilterWeather @"weather"
#define SGContextFilterAddress @"address"
#define SGContextFilterDemographics @"demographics"
#define SGContextFilterIntersections @"intersections"

#pragma mark Feature Types

#define SGFeatureTypeRegion @"Region"
#define SGFeatureTypeEntertainment @"Entertainment"
#define SGFeatureTypeFoodAndDrink @"Food & Drink"
#define SGFeatureTypeManufacturingAndWholesaleGoods @"Manufacturing & Wholesale Goods"
#define SGFeatureTypePhysicalFeature @"Physical Feature"
#define SGFeatureTypePublicPlace @"Public Place"
#define SGFeatureTypeRetailGoods @"Retail Goods"
#define SGFeatureTypeServices @"Services"
#define SGFeatureTypeTransportation @"Transportation"

#pragma mark Feature Categories (Context)

#define SGFeatureCategoryAdministrative @"Administrative"
#define SGFeatureCategoryCommercialArea @"Commercial Area"
#define SGFeatureCategoryDMA @"DMA"
#define SGFeatureCategoryLegislativeDistrict @"Legislative District"
#define SGFeatureCategoryLocality @"Locality"
#define SGFeatureCategoryMunicipality @"Municipality"
#define SGFeatureCategoryNational @"National"
#define SGFeatureCategoryNeighborhood @"Neighborhood"
#define SGFeatureCategoryPostalCode @"Postal Code"
#define SGFeatureCategoryProtectedArea @"Protected Area"
#define SGFeatureCategoryRegion @"Region"
#define SGFeatureCategoryResidentialArea @"Residential Area"
#define SGFeatureCategorySchoolDistrict @"School District"
#define SGFeatureCategorySubnational @"Subnational"
#define SGFeatureCategoryTimeZone @"Time Zone"
#define SGFeatureCategoryUSCensus @"US Census"
#define SGFeatureSubcategoryConsolidatedCity @"Consolidated City"
#define SGFeatureSubcategoryCounty @"County"
#define SGFeatureSubcategoryParish @"Parish"
#define SGFeatureSubcategoryBusinessDistrict @"Business District"
#define SGFeatureSubcategoryOfficePark @"Office Park"
#define SGFeatureSubcategoryMunicipal @"Municipal"
#define SGFeatureSubcategoryNational @"National"
#define SGFeatureSubcategoryProvincialLower @"Provincial (Lower)"
#define SGFeatureSubcategoryProvincialUpper @"Provincial (Upper)"
#define SGFeatureSubcategoryBorough @"Borough"
#define SGFeatureSubcategoryCity @"City"
#define SGFeatureSubcategoryHamlet @"Hamlet"
#define SGFeatureSubcategorySubdivision @"Subdivision"
#define SGFeatureSubcategorySuburb @"Suburb"
#define SGFeatureSubcategoryTown @"Town"
#define SGFeatureSubcategoryVillage @"Village"
#define SGFeatureSubcategoryCountry @"Country"
#define SGFeatureSubcategoryTerritory @"Territory"
#define SGFeatureSubcategoryForest @"Forest"
#define SGFeatureSubcategoryNatureReserve @"Nature Reserve"
#define SGFeatureSubcategoryPrimary @"Primary"
#define SGFeatureSubcategorySecondary @"Secondary"
#define SGFeatureSubcategoryUnified @"Unified"
#define SGFeatureSubcategoryProvince @"Province"
#define SGFeatureSubcategoryState @"State"
#define SGFeatureSubcategoryBlock @"Block"
#define SGFeatureSubcategoryBlockGroup @"Block Group"
#define SGFeatureSubcategoryMSA @"MSA"
#define SGFeatureSubcategoryTract @"Tract"

#pragma mark Feature Categories (Places)

#define SGPlacesCategoryArena @"Arena"
#define SGPlacesCategoryAutoRacetrack @"Auto Racetrack"
#define SGPlacesCategoryBullRing @"Bull Ring"
#define SGPlacesCategoryHorseRacetrack @"Horse Racetrack"
#define SGPlacesCategoryIndoorArena @"Indoor Arena"
#define SGPlacesCategorySportsClub @"Sports Club"
#define SGPlacesCategoryStadium @"Stadium"
#define SGPlacesCategoryArtsAndPerformance @"Arts & Performance"
#define SGPlacesCategoryArtGallery @"Art Gallery"
#define SGPlacesCategoryArtsCenter @"Arts Center"
#define SGPlacesCategoryCircus @"Circus"
#define SGPlacesCategoryDance @"Dance"
#define SGPlacesCategoryFestival @"Festival"
#define SGPlacesCategoryJazzAndBlues @"Jazz & Blues"
#define SGPlacesCategoryMusic @"Music"
#define SGPlacesCategoryOpera @"Opera"
#define SGPlacesCategorySymphony @"Symphony"
#define SGPlacesCategoryTheater @"Theater"
#define SGPlacesCategoryComedyClub @"Comedy Club"
#define SGPlacesCategoryCasinosAndGambling @"Casinos & Gambling"
#define SGPlacesCategoryCinema @"Cinema"
#define SGPlacesCategoryDriveInTheater @"Drive-In Theater"
#define SGPlacesCategoryMovieRental @"Movie Rental"
#define SGPlacesCategoryMovieTheater @"Movie Theater"
#define SGPlacesCategoryMuseum @"Museum"
#define SGPlacesCategoryAquarium @"Aquarium"
#define SGPlacesCategoryArtMuseum @"Art Museum"
#define SGPlacesCategoryBotanicalGarden @"Botanical Garden"
#define SGPlacesCategoryHistoryMuseum @"History Museum"
#define SGPlacesCategoryObservatory @"Observatory"
#define SGPlacesCategoryScienceMuseum @"Science Museum"
#define SGPlacesCategoryZoo @"Zoo"
#define SGPlacesCategoryRecreation @"Recreation"
#define SGPlacesCategoryAmusementPark @"Amusement Park"
#define SGPlacesCategoryArcade @"Arcade"
#define SGPlacesCategoryBarbecue @"Barbecue"
#define SGPlacesCategoryBoatCharter @"Boat Charter"
#define SGPlacesCategoryCampground @"Campground"
#define SGPlacesCategoryDanceHall @"Dance Hall"
#define SGPlacesCategoryDogPark @"Dog Park"
#define SGPlacesCategoryFishing @"Fishing"
#define SGPlacesCategoryGardens @"Gardens"
#define SGPlacesCategoryGoKarts @"Go Karts"
#define SGPlacesCategoryGunRange @"Gun Range"
#define SGPlacesCategoryMarina @"Marina"
#define SGPlacesCategoryMiniatureGolf @"Miniature Golf"
#define SGPlacesCategoryPicnicArea @"Picnic Area"
#define SGPlacesCategoryPlayground @"Playground"
#define SGPlacesCategorySailingClub @"Sailing Club"
#define SGPlacesCategoryThemePark @"Theme Park"
#define SGPlacesCategoryWaterPark @"Water Park"
#define SGPlacesCategorySportsAndExercise @"Sports & Exercise"
#define SGPlacesCategoryAthleticTrack @"Athletic Track"
#define SGPlacesCategoryBicycleRental @"Bicycle Rental"
#define SGPlacesCategoryBowling @"Bowling"
#define SGPlacesCategoryClimbingGym @"Climbing Gym"
#define SGPlacesCategoryGolf @"Golf"
#define SGPlacesCategoryGym @"Gym"
#define SGPlacesCategoryIceRink @"Ice Rink"
#define SGPlacesCategoryPlayingField @"Playing Field"
#define SGPlacesCategoryRaceTrack @"Race Track"
#define SGPlacesCategorySkatePark @"Skate Park"
#define SGPlacesCategorySkiResort @"Ski Resort"
#define SGPlacesCategorySkiSlope @"Ski Slope"
#define SGPlacesCategorySportsCenter @"Sports Center"
#define SGPlacesCategoryStables @"Stables"
#define SGPlacesCategorySwimmingPool @"Swimming Pool"
#define SGPlacesCategoryTennisCourt @"Tennis Court"
#define SGPlacesCategoryWinterSports @"Winter Sports"
#define SGPlacesCategoryTravel @"Travel"
#define SGPlacesCategoryBedAndBreakfast @"Bed & Breakfast"
#define SGPlacesCategoryChalets @"Chalets"
#define SGPlacesCategoryHostel @"Hostel"
#define SGPlacesCategoryHotelsAndMotels @"Hotels & Motels"
#define SGPlacesCategoryResort @"Resort"
#define SGPlacesCategoryTravelAgent @"Travel Agent"
#define SGPlacesCategoryBagels @"Bagels"
#define SGPlacesCategoryBakery @"Bakery"
#define SGPlacesCategoryBarsAndPubs @"Bars & Pubs"
#define SGPlacesCategoryBiergarten @"Biergarten"
#define SGPlacesCategoryChampagneBar @"Champagne Bar"
#define SGPlacesCategoryDiveBar @"Dive Bar"
#define SGPlacesCategoryGayBar @"Gay Bar"
#define SGPlacesCategoryHookahBar @"Hookah Bar"
#define SGPlacesCategoryLounge @"Lounge"
#define SGPlacesCategoryNightclub @"Nightclub"
#define SGPlacesCategoryOxygenBar @"Oxygen Bar"
#define SGPlacesCategorySportsBar @"Sports Bar"
#define SGPlacesCategoryWineBar @"Wine Bar"
#define SGPlacesCategoryBrewery @"Brewery"
#define SGPlacesCategoryCafe @"Cafe"
#define SGPlacesCategoryCoffeeAndTea @"Coffee & Tea"
#define SGPlacesCategoryDeli @"Deli"
#define SGPlacesCategoryDistillery @"Distillery"
#define SGPlacesCategoryDonuts @"Donuts"
#define SGPlacesCategoryFastFood @"Fast Food"
#define SGPlacesCategoryFoodCourt @"Food Court"
#define SGPlacesCategoryIceCream @"Ice Cream"
#define SGPlacesCategoryInternetCafe @"Internet Cafe"
#define SGPlacesCategoryJuiceBar @"Juice Bar"
#define SGPlacesCategoryRestaurant @"Restaurant"
#define SGPlacesCategoryTeaRoom @"Tea Room"
#define SGPlacesCategoryWinery @"Winery"
#define SGPlacesCategoryFarming @"Farming"
#define SGPlacesCategoryAquaticFarm @"Aquatic Farm"
#define SGPlacesCategoryBerryFarm @"Berry Farm"
#define SGPlacesCategoryCrops @"Crops"
#define SGPlacesCategoryDairyFarm @"Dairy Farm"
#define SGPlacesCategoryFarm @"Farm"
#define SGPlacesCategoryFarmAndVeterinaryServices @"Farm & Veterinary Services"
#define SGPlacesCategoryFishAndMarineProducts @"Fish & Marine Products"
#define SGPlacesCategoryLivestockFarm @"Livestock Farm"
#define SGPlacesCategoryNursery @"Nursery"
#define SGPlacesCategoryOrchard @"Orchard"
#define SGPlacesCategoryPoultryFarm @"Poultry Farm"
#define SGPlacesCategoryVineyard @"Vineyard"
#define SGPlacesCategoryManufacturing @"Manufacturing"
#define SGPlacesCategoryAerospace @"Aerospace"
#define SGPlacesCategoryApparel @"Apparel"
#define SGPlacesCategoryBuildingMaterials @"Building Materials"
#define SGPlacesCategoryBuildings @"Buildings"
#define SGPlacesCategoryChemicalsAndCompounds @"Chemicals & Compounds"
#define SGPlacesCategoryElectronics @"Electronics"
#define SGPlacesCategoryFood @"Food"
#define SGPlacesCategoryFurniture @"Furniture"
#define SGPlacesCategoryGlassAndMinerals @"Glass & Minerals"
#define SGPlacesCategoryJewelry @"Jewelry"
#define SGPlacesCategoryLeatherGoods @"Leather Goods"
#define SGPlacesCategoryLumber @"Lumber"
#define SGPlacesCategoryMetals @"Metals"
#define SGPlacesCategoryMotorVehiclesAndParts @"Motor Vehicles & Parts"
#define SGPlacesCategoryMusicalInstruments @"Musical Instruments"
#define SGPlacesCategoryPaperProducts @"Paper Products"
#define SGPlacesCategoryPetFood @"Pet Food"
#define SGPlacesCategoryPetroleumProducts @"Petroleum Products"
#define SGPlacesCategoryPottery @"Pottery"
#define SGPlacesCategoryPrinting @"Printing"
#define SGPlacesCategoryRetailGoods @"Retail Goods"
#define SGPlacesCategoryRubberAndPlastics @"Rubber & Plastics"
#define SGPlacesCategorySigns @"Signs"
#define SGPlacesCategorySoap @"Soap"
#define SGPlacesCategoryTextiles @"Textiles"
#define SGPlacesCategoryTobaccoProducts @"Tobacco Products"
#define SGPlacesCategoryToolsAndMachinery @"Tools & Machinery"
#define SGPlacesCategoryToysAndSportingGoods @"Toys & Sporting Goods"
#define SGPlacesCategoryWatercraft @"Watercraft"
#define SGPlacesCategoryWoodProducts @"Wood Products"
#define SGPlacesCategoryMiningAndDrilling @"Mining & Drilling"
#define SGPlacesCategoryWholesale @"Wholesale"
#define SGPlacesCategoryAutoParts @"Auto Parts"
#define SGPlacesCategoryBeer @"Beer"
#define SGPlacesCategoryBooksPeriodicalsAndNewspapers @"Books, Periodicals, & Newspapers"
#define SGPlacesCategoryChemicalsAndPlastics @"Chemicals & Plastics"
#define SGPlacesCategoryComputers @"Computers"
#define SGPlacesCategoryConstructionMaterials @"Construction Materials"
#define SGPlacesCategoryDairy @"Dairy"
#define SGPlacesCategoryDrugs @"Drugs"
#define SGPlacesCategoryDurableGoodsAndEquipment @"Durable Goods & Equipment"
#define SGPlacesCategoryElectrical @"Electrical"
#define SGPlacesCategoryFarmSupplies @"Farm Supplies"
#define SGPlacesCategoryFruitsAndVegetables @"Fruits & Vegetables"
#define SGPlacesCategoryGroceries @"Groceries"
#define SGPlacesCategoryHardware @"Hardware"
#define SGPlacesCategoryHomeFurnishings @"Home Furnishings"
#define SGPlacesCategoryMachineryAndSupplies @"Machinery & Supplies"
#define SGPlacesCategoryMeat @"Meat"
#define SGPlacesCategoryMedicalEquipmentAndSupplies @"Medical Equipment & Supplies"
#define SGPlacesCategoryMetalsAndMinerals @"Metals & Minerals"
#define SGPlacesCategoryMotorVehicles @"Motor Vehicles"
#define SGPlacesCategoryNonDurableGoods @"Non-Durable Goods"
#define SGPlacesCategoryOfficeEquipment @"Office Equipment"
#define SGPlacesCategoryPaintingSupplies @"Painting Supplies"
#define SGPlacesCategoryPetroleum @"Petroleum"
#define SGPlacesCategoryPhotographicEquipment @"Photographic Equipment"
#define SGPlacesCategoryPlants @"Plants"
#define SGPlacesCategoryPoultry @"Poultry"
#define SGPlacesCategoryScrap @"Scrap"
#define SGPlacesCategorySeafood @"Seafood"
#define SGPlacesCategorySportingGoods @"Sporting Goods"
#define SGPlacesCategoryStationery @"Stationery"
#define SGPlacesCategoryToysAndHobbies @"Toys & Hobbies"
#define SGPlacesCategoryVendingMachines @"Vending Machines"
#define SGPlacesCategoryWineAndDistilledAlcoholicBeverages @"Wine & Distilled Alcoholic Beverages"
#define SGPlacesCategoryMusicPublishers @"Music Publishers"
#define SGPlacesCategoryBasin @"Basin"
#define SGPlacesCategoryBeach @"Beach"
#define SGPlacesCategoryCanyon @"Canyon"
#define SGPlacesCategoryForest @"Forest"
#define SGPlacesCategoryGrassland @"Grassland"
#define SGPlacesCategoryIsland @"Island"
#define SGPlacesCategoryLake @"Lake"
#define SGPlacesCategoryLandfill @"Landfill"
#define SGPlacesCategoryMine @"Mine"
#define SGPlacesCategoryMountain @"Mountain"
#define SGPlacesCategoryPond @"Pond"
#define SGPlacesCategoryQuarry @"Quarry"
#define SGPlacesCategoryReservoir @"Reservoir"
#define SGPlacesCategoryWell @"Well"
#define SGPlacesCategoryAnimalShelter @"Animal Shelter"
#define SGPlacesCategoryCemetery @"Cemetery"
#define SGPlacesCategoryCommercialArea @"Commercial Area"
#define SGPlacesCategoryCommunityCenter @"Community Center"
#define SGPlacesCategoryEthnic @"Ethnic"
#define SGPlacesCategorySenior @"Senior"
#define SGPlacesCategorySocial @"Social"
#define SGPlacesCategoryYouth @"Youth"
#define SGPlacesCategoryConferenceCenter @"Conference Center"
#define SGPlacesCategoryEducation @"Education"
#define SGPlacesCategoryCollege @"College"
#define SGPlacesCategoryDanceStudio @"Dance Studio"
#define SGPlacesCategoryJuniorCollege @"Junior College"
#define SGPlacesCategoryKindergarten @"Kindergarten"
#define SGPlacesCategoryLibrary @"Library"
#define SGPlacesCategoryMusicSchool @"Music School"
#define SGPlacesCategoryPreschool @"Preschool"
#define SGPlacesCategorySchool @"School"
#define SGPlacesCategorySpecialTraining @"Special Training"
#define SGPlacesCategoryUniversity @"University"
#define SGPlacesCategoryVocationalSchool @"Vocational School"
#define SGPlacesCategoryExhibitionHall @"Exhibition Hall"
#define SGPlacesCategoryGovernment @"Government"
#define SGPlacesCategoryCityHall @"City Hall"
#define SGPlacesCategoryCourtHouse @"Court House"
#define SGPlacesCategoryCustomsHouse @"Customs House"
#define SGPlacesCategoryDepartmentofMotorVehicles @"Department of Motor Vehicles"
#define SGPlacesCategoryEmbassy @"Embassy"
#define SGPlacesCategoryFireStation @"Fire Station"
#define SGPlacesCategoryJail @"Jail"
#define SGPlacesCategoryOffice @"Office"
#define SGPlacesCategoryPalace @"Palace"
#define SGPlacesCategoryPoliceStation @"Police Station"
#define SGPlacesCategoryPostOffice @"Post Office"
#define SGPlacesCategoryPrison @"Prison"
#define SGPlacesCategoryIndustrialArea @"Industrial Area"
#define SGPlacesCategoryLandmark @"Landmark"
#define SGPlacesCategoryArchaeologicalSite @"Archaeological Site"
#define SGPlacesCategoryBattlefield @"Battlefield"
#define SGPlacesCategoryCastle @"Castle"
#define SGPlacesCategoryCityWalls @"City Walls"
#define SGPlacesCategoryFort @"Fort"
#define SGPlacesCategoryFountain @"Fountain"
#define SGPlacesCategoryHistoric @"Historic"
#define SGPlacesCategoryMarketplace @"Marketplace"
#define SGPlacesCategoryMemorial @"Memorial"
#define SGPlacesCategoryMonument @"Monument"
#define SGPlacesCategoryPlaza @"Plaza"
#define SGPlacesCategoryRuins @"Ruins"
#define SGPlacesCategoryScenicView @"Scenic View"
#define SGPlacesCategorySquare @"Square"
#define SGPlacesCategoryTouristAttraction @"Tourist Attraction"
#define SGPlacesCategoryTouristInformation @"Tourist Information"
#define SGPlacesCategoryUNESCOWorldHeritageSite @"UNESCO World Heritage Site"
#define SGPlacesCategoryMilitaryArea @"Military Area"
#define SGPlacesCategoryAirForceBase @"Air Force Base"
#define SGPlacesCategoryAirfield @"Airfield"
#define SGPlacesCategoryArmory @"Armory"
#define SGPlacesCategoryArmyBase @"Army Base"
#define SGPlacesCategoryBarracks @"Barracks"
#define SGPlacesCategoryBunker @"Bunker"
#define SGPlacesCategoryCoastGuardBase @"Coast Guard Base"
#define SGPlacesCategoryNavalBase @"Naval Base"
#define SGPlacesCategoryRestrictedArea @"Restricted Area"
#define SGPlacesCategoryPark @"Park"
#define SGPlacesCategoryCounty @"County"
#define SGPlacesCategoryMunicipal @"Municipal"
#define SGPlacesCategoryNational @"National"
#define SGPlacesCategoryProvincial @"Provincial"
#define SGPlacesCategoryTownCommon @"Town Common"
#define SGPlacesCategoryPlaceofWorship @"Place of Worship"
#define SGPlacesCategoryChurch @"Church"
#define SGPlacesCategoryMonastery @"Monastery"
#define SGPlacesCategoryMosque @"Mosque"
#define SGPlacesCategoryShrine @"Shrine"
#define SGPlacesCategorySynagogue @"Synagogue"
#define SGPlacesCategoryTemple @"Temple"
#define SGPlacesCategoryScienceFacility @"Science Facility"
#define SGPlacesCategoryShoppingCenter @"Shopping Center"
#define SGPlacesCategoryStructure @"Structure"
#define SGPlacesCategoryBridge @"Bridge"
#define SGPlacesCategoryBuilding @"Building"
#define SGPlacesCategoryFactory @"Factory"
#define SGPlacesCategoryHistoricBuilding @"Historic Building"
#define SGPlacesCategoryOfficeBuilding @"Office Building"
#define SGPlacesCategoryPublicBuilding @"Public Building"
#define SGPlacesCategoryRestrooms @"Restrooms"
#define SGPlacesCategoryShoppingMall @"Shopping Mall"
#define SGPlacesCategoryTower @"Tower"
#define SGPlacesCategoryTunnel @"Tunnel"
#define SGPlacesCategoryWarehouse @"Warehouse"
#define SGPlacesCategoryAutosAndMotorVehicles @"Autos & Motor Vehicles"
#define SGPlacesCategoryAutoSupplies @"Auto Supplies"
#define SGPlacesCategoryAutomobileSales @"Automobile Sales"
#define SGPlacesCategoryBoatSales @"Boat Sales"
#define SGPlacesCategoryFuelAndGasStation @"Fuel & Gas Station"
#define SGPlacesCategoryMotorcycleSales @"Motorcycle Sales"
#define SGPlacesCategoryRecreationalVehicleSales @"Recreational Vehicle Sales"
#define SGPlacesCategoryFoodAndBeverages @"Food & Beverages"
#define SGPlacesCategoryCandy @"Candy"
#define SGPlacesCategoryCheese @"Cheese"
#define SGPlacesCategoryChocolate @"Chocolate"
#define SGPlacesCategoryEthnicFoods @"Ethnic Foods"
#define SGPlacesCategoryFarmersMarket @"Farmers Market"
#define SGPlacesCategoryGroceriesAndConvenienceStores @"Groceries & Convenience Stores"
#define SGPlacesCategoryLiquorAndBeverages @"Liquor & Beverages"
#define SGPlacesCategoryMeatAndFish @"Meat & Fish"
#define SGPlacesCategorySpecialty @"Specialty"
#define SGPlacesCategorySupermarket @"Supermarket"
#define SGPlacesCategoryHomeAndGarden @"Home & Garden"
#define SGPlacesCategoryCarpetsAndFloorCoverings @"Carpets & Floor Coverings"
#define SGPlacesCategoryGardenSupply @"Garden Supply"
#define SGPlacesCategoryHouseholdAppliances @"Household Appliances"
#define SGPlacesCategoryKitchenSupply @"Kitchen Supply"
#define SGPlacesCategoryMobileHomes @"Mobile Homes"
#define SGPlacesCategoryShopping @"Shopping"
#define SGPlacesCategoryAdult @"Adult"
#define SGPlacesCategoryAntiques @"Antiques"
#define SGPlacesCategoryBabyStore @"Baby Store"
#define SGPlacesCategoryBeautyAndCosmetics @"Beauty & Cosmetics"
#define SGPlacesCategoryBicyclesAndSportingGoods @"Bicycles & Sporting Goods"
#define SGPlacesCategoryBooks @"Books"
#define SGPlacesCategoryBridal @"Bridal"
#define SGPlacesCategoryCatalogStore @"Catalog Store"
#define SGPlacesCategoryClothingApparelAndFashions @"Clothing, Apparel, & Fashions"
#define SGPlacesCategoryComicBooks @"Comic Books"
#define SGPlacesCategoryComputersAndHomeElectronics @"Computers & Home Electronics"
#define SGPlacesCategoryCraftsAndFabrics @"Crafts & Fabrics"
#define SGPlacesCategoryDepartmentStore @"Department Store"
#define SGPlacesCategoryDiscountAndVarietyStores @"Discount & Variety Stores"
#define SGPlacesCategoryEventTickets @"Event Tickets"
#define SGPlacesCategoryFlorist @"Florist"
#define SGPlacesCategoryGiftsAndSouvenirs @"Gifts & Souvenirs"
#define SGPlacesCategoryHobbiesToysAndGames @"Hobbies, Toys, & Games"
#define SGPlacesCategoryLuggageAndLeatherGoods @"Luggage & Leather Goods"
#define SGPlacesCategoryMobilePhones @"Mobile Phones"
#define SGPlacesCategoryNews @"News"
#define SGPlacesCategoryOpticalGoods @"Optical Goods"
#define SGPlacesCategoryOptician @"Optician"
#define SGPlacesCategoryPartySupplies @"Party Supplies"
#define SGPlacesCategoryPawnShop @"Pawn Shop"
#define SGPlacesCategoryPetsAndPetSupplies @"Pets & Pet Supplies"
#define SGPlacesCategoryPharmacy @"Pharmacy"
#define SGPlacesCategoryShoes @"Shoes"
#define SGPlacesCategoryStationeryAndOfficeSupplies @"Stationery & Office Supplies"
#define SGPlacesCategoryThriftStore @"Thrift Store"
#define SGPlacesCategoryTobacco @"Tobacco"
#define SGPlacesCategoryUsedMerchandise @"Used Merchandise"
#define SGPlacesCategoryBanksAndCreditUnions @"Banks & Credit Unions"
#define SGPlacesCategoryATM @"ATM"
#define SGPlacesCategoryBank @"Bank"
#define SGPlacesCategoryBureaudeChange @"Bureau de Change"
#define SGPlacesCategoryFinancialServices @"Financial Services"
#define SGPlacesCategoryInvestmentBrokerage @"Investment Brokerage"
#define SGPlacesCategoryBuildingAndTrades @"Building & Trades"
#define SGPlacesCategoryPestControl @"Pest Control"
#define SGPlacesCategoryCleaningAndSanitation @"Cleaning & Sanitation"
#define SGPlacesCategoryConstruction @"Construction"
#define SGPlacesCategoryEquipmentRental @"Equipment Rental"
#define SGPlacesCategoryLandscapingServices @"Landscaping Services"
#define SGPlacesCategoryLocksmith @"Locksmith"
#define SGPlacesCategoryPlumbing @"Plumbing"
#define SGPlacesCategoryCommunications @"Communications"
#define SGPlacesCategoryFilmAndVideoProduction @"Film & Video Production"
#define SGPlacesCategoryNewsServices @"News Services"
#define SGPlacesCategoryNewspaper @"Newspaper"
#define SGPlacesCategoryRadioStation @"Radio Station"
#define SGPlacesCategoryTelevisionStation @"Television Station"
#define SGPlacesCategoryHealthServices @"Health Services"
#define SGPlacesCategoryChiropractor @"Chiropractor"
#define SGPlacesCategoryClinic @"Clinic"
#define SGPlacesCategoryDentist @"Dentist"
#define SGPlacesCategoryDoctor @"Doctor"
#define SGPlacesCategoryHealthPractitioner @"Health Practitioner"
#define SGPlacesCategoryHospice @"Hospice"
#define SGPlacesCategoryHospital @"Hospital"
#define SGPlacesCategoryMedicalLab @"Medical Lab"
#define SGPlacesCategoryNursingandCareFacility @"Nursing and Care Facility"
#define SGPlacesCategoryOptometrist @"Optometrist"
#define SGPlacesCategoryPodiatrist @"Podiatrist"
#define SGPlacesCategoryInsurance @"Insurance"
#define SGPlacesCategoryHazardInsurance @"Hazard Insurance"
#define SGPlacesCategoryHealthInsurance @"Health Insurance"
#define SGPlacesCategoryInsuranceAgent @"Insurance Agent"
#define SGPlacesCategoryLifeInsurance @"Life Insurance"
#define SGPlacesCategoryTitleInsurance @"Title Insurance"
#define SGPlacesCategoryOrganizations @"Organizations"
#define SGPlacesCategoryCommunityAssociation @"Community Association"
#define SGPlacesCategoryLaborOrganization @"Labor Organization"
#define SGPlacesCategoryMembershipOrganization @"Membership Organization"
#define SGPlacesCategoryNonProfitOrganization @"Non-Profit Organization"
#define SGPlacesCategoryPoliticalOrganization @"Political Organization"
#define SGPlacesCategoryProfessionalAssociation @"Professional Association"
#define SGPlacesCategoryReligiousOrganization @"Religious Organization"
#define SGPlacesCategoryPersonal @"Personal"
#define SGPlacesCategoryBarber @"Barber"
#define SGPlacesCategoryBeautySalon @"Beauty Salon"
#define SGPlacesCategoryDaySpa @"Day Spa"
#define SGPlacesCategoryHairRemoval @"Hair Removal"
#define SGPlacesCategoryMassage @"Massage"
#define SGPlacesCategoryNailSalon @"Nail Salon"
#define SGPlacesCategoryPiercing @"Piercing"
#define SGPlacesCategoryPsychicsAndAstrologers @"Psychics & Astrologers"
#define SGPlacesCategorySauna @"Sauna"
#define SGPlacesCategoryShoeRepairAndShine @"Shoe Repair & Shine"
#define SGPlacesCategorySkinCare @"Skin Care"
#define SGPlacesCategoryTanningParlor @"Tanning Parlor"
#define SGPlacesCategoryTattooParlor @"Tattoo Parlor"
#define SGPlacesCategoryProfessional @"Professional"
#define SGPlacesCategoryAccountingAndTaxPreparation @"Accounting & Tax Preparation"
#define SGPlacesCategoryAdvertising @"Advertising"
#define SGPlacesCategoryArtServices @"Art Services"
#define SGPlacesCategoryBusinessServices @"Business Services"
#define SGPlacesCategoryComputerServices @"Computer Services"
#define SGPlacesCategoryCreditReportingAndCollection @"Credit Reporting & Collection"
#define SGPlacesCategoryDetectiveAndSecurityServices @"Detective & Security Services"
#define SGPlacesCategoryEmploymentAgencies @"Employment Agencies"
#define SGPlacesCategoryEngineering @"Engineering"
#define SGPlacesCategoryLawyerAndLegalServices @"Lawyer & Legal Services"
#define SGPlacesCategoryManagementAndConsulting @"Management & Consulting"
#define SGPlacesCategoryPrintingAndPhotocopies @"Printing & Photocopies"
#define SGPlacesCategoryResearch @"Research"
#define SGPlacesCategorySecretarialServices @"Secretarial Services"
#define SGPlacesCategoryTestingLab @"Testing Lab"
#define SGPlacesCategoryRealEstate @"Real Estate"
#define SGPlacesCategoryArchitect @"Architect"
#define SGPlacesCategoryDeveloper @"Developer"
#define SGPlacesCategoryRealEstateAgent @"Real Estate Agent"
#define SGPlacesCategoryRealEstateOperator @"Real Estate Operator"
#define SGPlacesCategoryRealEstateServices @"Real Estate Services"
#define SGPlacesCategorySurveying @"Surveying"
#define SGPlacesCategoryRetail @"Retail"
#define SGPlacesCategoryAnimalServices @"Animal Services"
#define SGPlacesCategoryAutoRental @"Auto Rental"
#define SGPlacesCategoryAutoRepair @"Auto Repair"
#define SGPlacesCategoryCarWash @"Car Wash"
#define SGPlacesCategoryDrivingSchool @"Driving School"
#define SGPlacesCategoryEventSpace @"Event Space"
#define SGPlacesCategoryFuneralServices @"Funeral Services"
#define SGPlacesCategoryLaundryAndDryCleaning @"Laundry & Dry Cleaning"
#define SGPlacesCategoryPetBoarding @"Pet Boarding"
#define SGPlacesCategoryPhotofinishing @"Photofinishing"
#define SGPlacesCategoryPortraitStudio @"Portrait Studio"
#define SGPlacesCategoryRepairShop @"Repair Shop"
#define SGPlacesCategorySelfServiceLaundry @"Self-Service Laundry"
#define SGPlacesCategoryStorage @"Storage"
#define SGPlacesCategoryVeterinaryServices @"Veterinary Services"
#define SGPlacesCategoryEmissionsTesting @"Emissions Testing"
#define SGPlacesCategorySocialServices @"Social Services"
#define SGPlacesCategoryAdultCare @"Adult Care"
#define SGPlacesCategoryChildCare @"Child Care"
#define SGPlacesCategoryJobTraining @"Job Training"
#define SGPlacesCategoryRetirementHome @"Retirement Home"
#define SGPlacesCategoryUtilities @"Utilities"
#define SGPlacesCategoryCable @"Cable"
#define SGPlacesCategoryElectric @"Electric"
#define SGPlacesCategoryFuelOilAndLPG @"Fuel Oil & LPG"
#define SGPlacesCategoryMobilePhone @"Mobile Phone"
#define SGPlacesCategoryNaturalGas @"Natural Gas"
#define SGPlacesCategoryRecycling @"Recycling"
#define SGPlacesCategoryRefuse @"Refuse"
#define SGPlacesCategorySewage @"Sewage"
#define SGPlacesCategoryTelephone @"Telephone"
#define SGPlacesCategoryWater @"Water"
#define SGPlacesCategoryAirline @"Airline"
#define SGPlacesCategoryAirport @"Airport"
#define SGPlacesCategoryDomestic @"Domestic"
#define SGPlacesCategoryGeneralAviation @"General Aviation"
#define SGPlacesCategoryInternational @"International"
#define SGPlacesCategoryBusCharters @"Bus Charters"
#define SGPlacesCategoryBusStation @"Bus Station"
#define SGPlacesCategoryBusStop @"Bus Stop"
#define SGPlacesCategoryDepot @"Depot"
#define SGPlacesCategoryBus @"Bus"
#define SGPlacesCategoryTrain @"Train"
#define SGPlacesCategoryFerry @"Ferry"
#define SGPlacesCategoryFerryTerminal @"Ferry Terminal"
#define SGPlacesCategoryFreight @"Freight"
#define SGPlacesCategoryHarbor @"Harbor"
#define SGPlacesCategoryLocalTransit @"Local Transit"
#define SGPlacesCategoryMarine @"Marine"
#define SGPlacesCategoryMetroStation @"Metro Station"
#define SGPlacesCategoryParking @"Parking"
#define SGPlacesCategoryBicycle @"Bicycle"
#define SGPlacesCategoryGarage @"Garage"
#define SGPlacesCategoryLot @"Lot"
#define SGPlacesCategoryRailroad @"Railroad"
#define SGPlacesCategorySchoolBuses @"School Buses"
#define SGPlacesCategoryTaxi @"Taxi"
#define SGPlacesCategoryTrainStation @"Train Station"
#define SGPlacesCategoryLightRail @"Light Rail"
#define SGPlacesCategoryRail @"Rail"
#define SGPlacesCategoryTransitCenter @"Transit Center"
#define SGPlacesCategoryPassenger @"Passenger"
