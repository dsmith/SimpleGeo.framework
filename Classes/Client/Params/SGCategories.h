//
//  SGCategories.h
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

typedef NSString * SGFeatureType;
typedef NSString * SGFeatureCategory;
typedef NSString * SGFeatureSubcategory;

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

#pragma mark Feature Subcategories (Context)

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
#define SGPlacesCategoryArtsAndPerformance @"Arts & Performance"
#define SGPlacesCategoryCasinosAndGambling @"Casinos & Gambling"
#define SGPlacesCategoryCinema @"Cinema"
#define SGPlacesCategoryMuseum @"Museum"
#define SGPlacesCategoryRecreation @"Recreation"
#define SGPlacesCategorySportsAndExercise @"Sports & Exercise"
#define SGPlacesCategoryTravel @"Travel"
#define SGPlacesCategoryBagels @"Bagels"
#define SGPlacesCategoryBakery @"Bakery"
#define SGPlacesCategoryBarsAndPubs @"Bars & Pubs"
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
#define SGPlacesCategoryManufacturing @"Manufacturing"
#define SGPlacesCategoryMiningAndDrilling @"Mining & Drilling"
#define SGPlacesCategoryWholesale @"Wholesale"
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
#define SGPlacesCategoryConferenceCenter @"Conference Center"
#define SGPlacesCategoryEducation @"Education"
#define SGPlacesCategoryExhibitionHall @"Exhibition Hall"
#define SGPlacesCategoryGovernment @"Government"
#define SGPlacesCategoryIndustrialArea @"Industrial Area"
#define SGPlacesCategoryLandmark @"Landmark"
#define SGPlacesCategoryMilitaryArea @"Military Area"
#define SGPlacesCategoryPark @"Park"
#define SGPlacesCategoryPlaceofWorship @"Place of Worship"
#define SGPlacesCategoryScienceFacility @"Science Facility"
#define SGPlacesCategoryShoppingCenter @"Shopping Center"
#define SGPlacesCategoryStructure @"Structure"
#define SGPlacesCategoryAutosAndMotorVehicles @"Autos & Motor Vehicles"
#define SGPlacesCategoryFoodAndBeverages @"Food & Beverages"
#define SGPlacesCategoryHomeAndGarden @"Home & Garden"
#define SGPlacesCategoryShopping @"Shopping"
#define SGPlacesCategoryBanksAndCreditUnions @"Banks & Credit Unions"
#define SGPlacesCategoryBuildingAndTrades @"Building & Trades"
#define SGPlacesCategoryCommunications @"Communications"
#define SGPlacesCategoryHealthServices @"Health Services"
#define SGPlacesCategoryInsurance @"Insurance"
#define SGPlacesCategoryOrganizations @"Organizations"
#define SGPlacesCategoryPersonal @"Personal"
#define SGPlacesCategoryProfessional @"Professional"
#define SGPlacesCategoryRealEstate @"Real Estate"
#define SGPlacesCategoryRetail @"Retail"
#define SGPlacesCategorySocialServices @"Social Services"
#define SGPlacesCategoryUtilities @"Utilities"
#define SGPlacesCategoryAirline @"Airline"
#define SGPlacesCategoryAirport @"Airport"
#define SGPlacesCategoryBusCharters @"Bus Charters"
#define SGPlacesCategoryBusStation @"Bus Station"
#define SGPlacesCategoryBusStop @"Bus Stop"
#define SGPlacesCategoryDepot @"Depot"
#define SGPlacesCategoryFerry @"Ferry"
#define SGPlacesCategoryFerryTerminal @"Ferry Terminal"
#define SGPlacesCategoryFreight @"Freight"
#define SGPlacesCategoryHarbor @"Harbor"
#define SGPlacesCategoryLocalTransit @"Local Transit"
#define SGPlacesCategoryMarine @"Marine"
#define SGPlacesCategoryMetroStation @"Metro Station"
#define SGPlacesCategoryParking @"Parking"
#define SGPlacesCategoryRailroad @"Railroad"
#define SGPlacesCategorySchoolBuses @"School Buses"
#define SGPlacesCategoryTaxi @"Taxi"
#define SGPlacesCategoryTrainStation @"Train Station"
#define SGPlacesCategoryTransitCenter @"Transit Center"

#pragma mark Feature Subcategories (Places)

#define SGPlaceSubcategoryAutoRacetrack @"Auto Racetrack"
#define SGPlaceSubcategoryBullRing @"Bull Ring"
#define SGPlaceSubcategoryHorseRacetrack @"Horse Racetrack"
#define SGPlaceSubcategoryIndoorArena @"Indoor Arena"
#define SGPlaceSubcategorySportsClub @"Sports Club"
#define SGPlaceSubcategoryStadium @"Stadium"
#define SGPlaceSubcategoryArtGallery @"Art Gallery"
#define SGPlaceSubcategoryArtsCenter @"Arts Center"
#define SGPlaceSubcategoryCircus @"Circus"
#define SGPlaceSubcategoryDance @"Dance"
#define SGPlaceSubcategoryFestival @"Festival"
#define SGPlaceSubcategoryJazzAndBlues @"Jazz & Blues"
#define SGPlaceSubcategoryMusic @"Music"
#define SGPlaceSubcategoryOpera @"Opera"
#define SGPlaceSubcategorySymphony @"Symphony"
#define SGPlaceSubcategoryTheater @"Theater"
#define SGPlaceSubcategoryComedyClub @"Comedy Club"
#define SGPlaceSubcategoryDriveInTheater @"Drive-In Theater"
#define SGPlaceSubcategoryMovieRental @"Movie Rental"
#define SGPlaceSubcategoryMovieTheater @"Movie Theater"
#define SGPlaceSubcategoryAquarium @"Aquarium"
#define SGPlaceSubcategoryArtMuseum @"Art Museum"
#define SGPlaceSubcategoryBotanicalGarden @"Botanical Garden"
#define SGPlaceSubcategoryHistoryMuseum @"History Museum"
#define SGPlaceSubcategoryObservatory @"Observatory"
#define SGPlaceSubcategoryScienceMuseum @"Science Museum"
#define SGPlaceSubcategoryZoo @"Zoo"
#define SGPlaceSubcategoryAmusementPark @"Amusement Park"
#define SGPlaceSubcategoryArcade @"Arcade"
#define SGPlaceSubcategoryBarbecue @"Barbecue"
#define SGPlaceSubcategoryBoatCharter @"Boat Charter"
#define SGPlaceSubcategoryCampground @"Campground"
#define SGPlaceSubcategoryDanceHall @"Dance Hall"
#define SGPlaceSubcategoryDogPark @"Dog Park"
#define SGPlaceSubcategoryFishing @"Fishing"
#define SGPlaceSubcategoryGardens @"Gardens"
#define SGPlaceSubcategoryGoKarts @"Go Karts"
#define SGPlaceSubcategoryGunRange @"Gun Range"
#define SGPlaceSubcategoryMarina @"Marina"
#define SGPlaceSubcategoryMiniatureGolf @"Miniature Golf"
#define SGPlaceSubcategoryPicnicArea @"Picnic Area"
#define SGPlaceSubcategoryPlayground @"Playground"
#define SGPlaceSubcategorySailingClub @"Sailing Club"
#define SGPlaceSubcategoryThemePark @"Theme Park"
#define SGPlaceSubcategoryWaterPark @"Water Park"
#define SGPlaceSubcategoryAthleticTrack @"Athletic Track"
#define SGPlaceSubcategoryBicycleRental @"Bicycle Rental"
#define SGPlaceSubcategoryBowling @"Bowling"
#define SGPlaceSubcategoryClimbingGym @"Climbing Gym"
#define SGPlaceSubcategoryGolf @"Golf"
#define SGPlaceSubcategoryGym @"Gym"
#define SGPlaceSubcategoryIceRink @"Ice Rink"
#define SGPlaceSubcategoryPlayingField @"Playing Field"
#define SGPlaceSubcategoryRaceTrack @"Race Track"
#define SGPlaceSubcategorySkatePark @"Skate Park"
#define SGPlaceSubcategorySkiResort @"Ski Resort"
#define SGPlaceSubcategorySkiSlope @"Ski Slope"
#define SGPlaceSubcategorySportsCenter @"Sports Center"
#define SGPlaceSubcategoryStables @"Stables"
#define SGPlaceSubcategorySwimmingPool @"Swimming Pool"
#define SGPlaceSubcategoryTennisCourt @"Tennis Court"
#define SGPlaceSubcategoryWinterSports @"Winter Sports"
#define SGPlaceSubcategoryBedAndBreakfast @"Bed & Breakfast"
#define SGPlaceSubcategoryChalets @"Chalets"
#define SGPlaceSubcategoryHostel @"Hostel"
#define SGPlaceSubcategoryHotelsAndMotels @"Hotels & Motels"
#define SGPlaceSubcategoryResort @"Resort"
#define SGPlaceSubcategoryTravelAgent @"Travel Agent"
#define SGPlaceSubcategoryBiergarten @"Biergarten"
#define SGPlaceSubcategoryChampagneBar @"Champagne Bar"
#define SGPlaceSubcategoryDiveBar @"Dive Bar"
#define SGPlaceSubcategoryGayBar @"Gay Bar"
#define SGPlaceSubcategoryHookahBar @"Hookah Bar"
#define SGPlaceSubcategoryLounge @"Lounge"
#define SGPlaceSubcategoryNightclub @"Nightclub"
#define SGPlaceSubcategoryOxygenBar @"Oxygen Bar"
#define SGPlaceSubcategorySportsBar @"Sports Bar"
#define SGPlaceSubcategoryWineBar @"Wine Bar"
#define SGPlaceSubcategoryAquaticFarm @"Aquatic Farm"
#define SGPlaceSubcategoryBerryFarm @"Berry Farm"
#define SGPlaceSubcategoryCrops @"Crops"
#define SGPlaceSubcategoryDairyFarm @"Dairy Farm"
#define SGPlaceSubcategoryFarm @"Farm"
#define SGPlaceSubcategoryFarmAndVeterinaryServices @"Farm & Veterinary Services"
#define SGPlaceSubcategoryFishAndMarineProducts @"Fish & Marine Products"
#define SGPlaceSubcategoryLivestockFarm @"Livestock Farm"
#define SGPlaceSubcategoryNursery @"Nursery"
#define SGPlaceSubcategoryOrchard @"Orchard"
#define SGPlaceSubcategoryPoultryFarm @"Poultry Farm"
#define SGPlaceSubcategoryVineyard @"Vineyard"
#define SGPlaceSubcategoryAerospace @"Aerospace"
#define SGPlaceSubcategoryApparel @"Apparel"
#define SGPlaceSubcategoryBuildingMaterials @"Building Materials"
#define SGPlaceSubcategoryBuildings @"Buildings"
#define SGPlaceSubcategoryChemicalsAndCompounds @"Chemicals & Compounds"
#define SGPlaceSubcategoryElectronics @"Electronics"
#define SGPlaceSubcategoryFood @"Food"
#define SGPlaceSubcategoryFurniture @"Furniture"
#define SGPlaceSubcategoryGlassAndMinerals @"Glass & Minerals"
#define SGPlaceSubcategoryJewelry @"Jewelry"
#define SGPlaceSubcategoryLeatherGoods @"Leather Goods"
#define SGPlaceSubcategoryLumber @"Lumber"
#define SGPlaceSubcategoryMetals @"Metals"
#define SGPlaceSubcategoryMotorVehiclesAndParts @"Motor Vehicles & Parts"
#define SGPlaceSubcategoryMusicalInstruments @"Musical Instruments"
#define SGPlaceSubcategoryPaperProducts @"Paper Products"
#define SGPlaceSubcategoryPetFood @"Pet Food"
#define SGPlaceSubcategoryPetroleumProducts @"Petroleum Products"
#define SGPlaceSubcategoryPottery @"Pottery"
#define SGPlaceSubcategoryPrinting @"Printing"
#define SGPlaceSubcategoryRetailGoods @"Retail Goods"
#define SGPlaceSubcategoryRubberAndPlastics @"Rubber & Plastics"
#define SGPlaceSubcategorySigns @"Signs"
#define SGPlaceSubcategorySoap @"Soap"
#define SGPlaceSubcategoryTextiles @"Textiles"
#define SGPlaceSubcategoryTobaccoProducts @"Tobacco Products"
#define SGPlaceSubcategoryToolsAndMachinery @"Tools & Machinery"
#define SGPlaceSubcategoryToysAndSportingGoods @"Toys & Sporting Goods"
#define SGPlaceSubcategoryWatercraft @"Watercraft"
#define SGPlaceSubcategoryWoodProducts @"Wood Products"
#define SGPlaceSubcategoryAutoParts @"Auto Parts"
#define SGPlaceSubcategoryBeer @"Beer"
#define SGPlaceSubcategoryBooksPeriodicalsAndNewspapers @"Books, Periodicals, & Newspapers"
#define SGPlaceSubcategoryChemicalsAndPlastics @"Chemicals & Plastics"
#define SGPlaceSubcategoryComputers @"Computers"
#define SGPlaceSubcategoryConstructionMaterials @"Construction Materials"
#define SGPlaceSubcategoryDairy @"Dairy"
#define SGPlaceSubcategoryDrugs @"Drugs"
#define SGPlaceSubcategoryDurableGoodsAndEquipment @"Durable Goods & Equipment"
#define SGPlaceSubcategoryElectrical @"Electrical"
#define SGPlaceSubcategoryFarmSupplies @"Farm Supplies"
#define SGPlaceSubcategoryFruitsAndVegetables @"Fruits & Vegetables"
#define SGPlaceSubcategoryGroceries @"Groceries"
#define SGPlaceSubcategoryHardware @"Hardware"
#define SGPlaceSubcategoryHomeFurnishings @"Home Furnishings"
#define SGPlaceSubcategoryMachineryAndSupplies @"Machinery & Supplies"
#define SGPlaceSubcategoryMeat @"Meat"
#define SGPlaceSubcategoryMedicalEquipmentAndSupplies @"Medical Equipment & Supplies"
#define SGPlaceSubcategoryMetalsAndMinerals @"Metals & Minerals"
#define SGPlaceSubcategoryMotorVehicles @"Motor Vehicles"
#define SGPlaceSubcategoryNonDurableGoods @"Non-Durable Goods"
#define SGPlaceSubcategoryOfficeEquipment @"Office Equipment"
#define SGPlaceSubcategoryPaintingSupplies @"Painting Supplies"
#define SGPlaceSubcategoryPetroleum @"Petroleum"
#define SGPlaceSubcategoryPhotographicEquipment @"Photographic Equipment"
#define SGPlaceSubcategoryPlants @"Plants"
#define SGPlaceSubcategoryPoultry @"Poultry"
#define SGPlaceSubcategoryScrap @"Scrap"
#define SGPlaceSubcategorySeafood @"Seafood"
#define SGPlaceSubcategorySportingGoods @"Sporting Goods"
#define SGPlaceSubcategoryStationery @"Stationery"
#define SGPlaceSubcategoryToysAndHobbies @"Toys & Hobbies"
#define SGPlaceSubcategoryVendingMachines @"Vending Machines"
#define SGPlaceSubcategoryWineAndDistilledAlcoholicBeverages @"Wine & Distilled Alcoholic Beverages"
#define SGPlaceSubcategoryMusicPublishers @"Music Publishers"
#define SGPlaceSubcategoryEthnic @"Ethnic"
#define SGPlaceSubcategorySenior @"Senior"
#define SGPlaceSubcategorySocial @"Social"
#define SGPlaceSubcategoryYouth @"Youth"
#define SGPlaceSubcategoryCollege @"College"
#define SGPlaceSubcategoryDanceStudio @"Dance Studio"
#define SGPlaceSubcategoryJuniorCollege @"Junior College"
#define SGPlaceSubcategoryKindergarten @"Kindergarten"
#define SGPlaceSubcategoryLibrary @"Library"
#define SGPlaceSubcategoryMusicSchool @"Music School"
#define SGPlaceSubcategoryPreschool @"Preschool"
#define SGPlaceSubcategorySchool @"School"
#define SGPlaceSubcategorySpecialTraining @"Special Training"
#define SGPlaceSubcategoryUniversity @"University"
#define SGPlaceSubcategoryVocationalSchool @"Vocational School"
#define SGPlaceSubcategoryCityHall @"City Hall"
#define SGPlaceSubcategoryCourtHouse @"Court House"
#define SGPlaceSubcategoryCustomsHouse @"Customs House"
#define SGPlaceSubcategoryDepartmentofMotorVehicles @"Department of Motor Vehicles"
#define SGPlaceSubcategoryEmbassy @"Embassy"
#define SGPlaceSubcategoryFireStation @"Fire Station"
#define SGPlaceSubcategoryJail @"Jail"
#define SGPlaceSubcategoryOffice @"Office"
#define SGPlaceSubcategoryPalace @"Palace"
#define SGPlaceSubcategoryPoliceStation @"Police Station"
#define SGPlaceSubcategoryPostOffice @"Post Office"
#define SGPlaceSubcategoryPrison @"Prison"
#define SGPlaceSubcategoryArchaeologicalSite @"Archaeological Site"
#define SGPlaceSubcategoryBattlefield @"Battlefield"
#define SGPlaceSubcategoryCastle @"Castle"
#define SGPlaceSubcategoryCityWalls @"City Walls"
#define SGPlaceSubcategoryFort @"Fort"
#define SGPlaceSubcategoryFountain @"Fountain"
#define SGPlaceSubcategoryHistoric @"Historic"
#define SGPlaceSubcategoryMarketplace @"Marketplace"
#define SGPlaceSubcategoryMemorial @"Memorial"
#define SGPlaceSubcategoryMonument @"Monument"
#define SGPlaceSubcategoryPlaza @"Plaza"
#define SGPlaceSubcategoryRuins @"Ruins"
#define SGPlaceSubcategoryScenicView @"Scenic View"
#define SGPlaceSubcategorySquare @"Square"
#define SGPlaceSubcategoryTouristAttraction @"Tourist Attraction"
#define SGPlaceSubcategoryTouristInformation @"Tourist Information"
#define SGPlaceSubcategoryUNESCOWorldHeritageSite @"UNESCO World Heritage Site"
#define SGPlaceSubcategoryAirForceBase @"Air Force Base"
#define SGPlaceSubcategoryAirfield @"Airfield"
#define SGPlaceSubcategoryArmory @"Armory"
#define SGPlaceSubcategoryArmyBase @"Army Base"
#define SGPlaceSubcategoryBarracks @"Barracks"
#define SGPlaceSubcategoryBunker @"Bunker"
#define SGPlaceSubcategoryCoastGuardBase @"Coast Guard Base"
#define SGPlaceSubcategoryNavalBase @"Naval Base"
#define SGPlaceSubcategoryRestrictedArea @"Restricted Area"
#define SGPlaceSubcategoryCounty @"County"
#define SGPlaceSubcategoryMunicipal @"Municipal"
#define SGPlaceSubcategoryNational @"National"
#define SGPlaceSubcategoryProvincial @"Provincial"
#define SGPlaceSubcategoryTownCommon @"Town Common"
#define SGPlaceSubcategoryChurch @"Church"
#define SGPlaceSubcategoryMonastery @"Monastery"
#define SGPlaceSubcategoryMosque @"Mosque"
#define SGPlaceSubcategoryShrine @"Shrine"
#define SGPlaceSubcategorySynagogue @"Synagogue"
#define SGPlaceSubcategoryTemple @"Temple"
#define SGPlaceSubcategoryBridge @"Bridge"
#define SGPlaceSubcategoryBuilding @"Building"
#define SGPlaceSubcategoryFactory @"Factory"
#define SGPlaceSubcategoryHistoricBuilding @"Historic Building"
#define SGPlaceSubcategoryOfficeBuilding @"Office Building"
#define SGPlaceSubcategoryPublicBuilding @"Public Building"
#define SGPlaceSubcategoryRestrooms @"Restrooms"
#define SGPlaceSubcategoryShoppingMall @"Shopping Mall"
#define SGPlaceSubcategoryTower @"Tower"
#define SGPlaceSubcategoryTunnel @"Tunnel"
#define SGPlaceSubcategoryWarehouse @"Warehouse"
#define SGPlaceSubcategoryAutoSupplies @"Auto Supplies"
#define SGPlaceSubcategoryAutomobileSales @"Automobile Sales"
#define SGPlaceSubcategoryBoatSales @"Boat Sales"
#define SGPlaceSubcategoryFuelAndGasStation @"Fuel & Gas Station"
#define SGPlaceSubcategoryMotorcycleSales @"Motorcycle Sales"
#define SGPlaceSubcategoryRecreationalVehicleSales @"Recreational Vehicle Sales"
#define SGPlaceSubcategoryBakery @"Bakery"
#define SGPlaceSubcategoryCandy @"Candy"
#define SGPlaceSubcategoryCheese @"Cheese"
#define SGPlaceSubcategoryChocolate @"Chocolate"
#define SGPlaceSubcategoryEthnicFoods @"Ethnic Foods"
#define SGPlaceSubcategoryFarmersMarket @"Farmers Market"
#define SGPlaceSubcategoryGroceriesAndConvenienceStores @"Groceries & Convenience Stores"
#define SGPlaceSubcategoryLiquorAndBeverages @"Liquor & Beverages"
#define SGPlaceSubcategoryMeatAndFish @"Meat & Fish"
#define SGPlaceSubcategorySpecialty @"Specialty"
#define SGPlaceSubcategorySupermarket @"Supermarket"
#define SGPlaceSubcategoryCarpetsAndFloorCoverings @"Carpets & Floor Coverings"
#define SGPlaceSubcategoryGardenSupply @"Garden Supply"
#define SGPlaceSubcategoryHouseholdAppliances @"Household Appliances"
#define SGPlaceSubcategoryKitchenSupply @"Kitchen Supply"
#define SGPlaceSubcategoryMobileHomes @"Mobile Homes"
#define SGPlaceSubcategoryAdult @"Adult"
#define SGPlaceSubcategoryAntiques @"Antiques"
#define SGPlaceSubcategoryBabyStore @"Baby Store"
#define SGPlaceSubcategoryBeautyAndCosmetics @"Beauty & Cosmetics"
#define SGPlaceSubcategoryBicyclesAndSportingGoods @"Bicycles & Sporting Goods"
#define SGPlaceSubcategoryBooks @"Books"
#define SGPlaceSubcategoryBridal @"Bridal"
#define SGPlaceSubcategoryCatalogStore @"Catalog Store"
#define SGPlaceSubcategoryClothingApparelAndFashions @"Clothing, Apparel, & Fashions"
#define SGPlaceSubcategoryComicBooks @"Comic Books"
#define SGPlaceSubcategoryComputersAndHomeElectronics @"Computers & Home Electronics"
#define SGPlaceSubcategoryCraftsAndFabrics @"Crafts & Fabrics"
#define SGPlaceSubcategoryDepartmentStore @"Department Store"
#define SGPlaceSubcategoryDiscountAndVarietyStores @"Discount & Variety Stores"
#define SGPlaceSubcategoryEventTickets @"Event Tickets"
#define SGPlaceSubcategoryFlorist @"Florist"
#define SGPlaceSubcategoryGiftsAndSouvenirs @"Gifts & Souvenirs"
#define SGPlaceSubcategoryHobbiesToysAndGames @"Hobbies, Toys, & Games"
#define SGPlaceSubcategoryLuggageAndLeatherGoods @"Luggage & Leather Goods"
#define SGPlaceSubcategoryMobilePhones @"Mobile Phones"
#define SGPlaceSubcategoryNews @"News"
#define SGPlaceSubcategoryOpticalGoods @"Optical Goods"
#define SGPlaceSubcategoryOptician @"Optician"
#define SGPlaceSubcategoryPartySupplies @"Party Supplies"
#define SGPlaceSubcategoryPawnShop @"Pawn Shop"
#define SGPlaceSubcategoryPetsAndPetSupplies @"Pets & Pet Supplies"
#define SGPlaceSubcategoryPharmacy @"Pharmacy"
#define SGPlaceSubcategoryShoes @"Shoes"
#define SGPlaceSubcategoryStationeryAndOfficeSupplies @"Stationery & Office Supplies"
#define SGPlaceSubcategoryThriftStore @"Thrift Store"
#define SGPlaceSubcategoryTobacco @"Tobacco"
#define SGPlaceSubcategoryUsedMerchandise @"Used Merchandise"
#define SGPlaceSubcategoryATM @"ATM"
#define SGPlaceSubcategoryBank @"Bank"
#define SGPlaceSubcategoryBureaudeChange @"Bureau de Change"
#define SGPlaceSubcategoryFinancialServices @"Financial Services"
#define SGPlaceSubcategoryInvestmentBrokerage @"Investment Brokerage"
#define SGPlaceSubcategoryPestControl @"Pest Control"
#define SGPlaceSubcategoryCleaningAndSanitation @"Cleaning & Sanitation"
#define SGPlaceSubcategoryConstruction @"Construction"
#define SGPlaceSubcategoryEquipmentRental @"Equipment Rental"
#define SGPlaceSubcategoryLandfill @"Landfill"
#define SGPlaceSubcategoryLandscapingServices @"Landscaping Services"
#define SGPlaceSubcategoryLocksmith @"Locksmith"
#define SGPlaceSubcategoryPlumbing @"Plumbing"
#define SGPlaceSubcategoryFilmAndVideoProduction @"Film & Video Production"
#define SGPlaceSubcategoryNewsServices @"News Services"
#define SGPlaceSubcategoryNewspaper @"Newspaper"
#define SGPlaceSubcategoryRadioStation @"Radio Station"
#define SGPlaceSubcategoryTelevisionStation @"Television Station"
#define SGPlaceSubcategoryChiropractor @"Chiropractor"
#define SGPlaceSubcategoryClinic @"Clinic"
#define SGPlaceSubcategoryDentist @"Dentist"
#define SGPlaceSubcategoryDoctor @"Doctor"
#define SGPlaceSubcategoryHealthPractitioner @"Health Practitioner"
#define SGPlaceSubcategoryHospice @"Hospice"
#define SGPlaceSubcategoryHospital @"Hospital"
#define SGPlaceSubcategoryMedicalLab @"Medical Lab"
#define SGPlaceSubcategoryNursingandCareFacility @"Nursing and Care Facility"
#define SGPlaceSubcategoryOptometrist @"Optometrist"
#define SGPlaceSubcategoryPodiatrist @"Podiatrist"
#define SGPlaceSubcategoryHazardInsurance @"Hazard Insurance"
#define SGPlaceSubcategoryHealthInsurance @"Health Insurance"
#define SGPlaceSubcategoryInsuranceAgent @"Insurance Agent"
#define SGPlaceSubcategoryLifeInsurance @"Life Insurance"
#define SGPlaceSubcategoryTitleInsurance @"Title Insurance"
#define SGPlaceSubcategoryCommunityAssociation @"Community Association"
#define SGPlaceSubcategoryLaborOrganization @"Labor Organization"
#define SGPlaceSubcategoryMembershipOrganization @"Membership Organization"
#define SGPlaceSubcategoryNonProfitOrganization @"Non-Profit Organization"
#define SGPlaceSubcategoryPoliticalOrganization @"Political Organization"
#define SGPlaceSubcategoryProfessionalAssociation @"Professional Association"
#define SGPlaceSubcategoryReligiousOrganization @"Religious Organization"
#define SGPlaceSubcategoryBarber @"Barber"
#define SGPlaceSubcategoryBeautySalon @"Beauty Salon"
#define SGPlaceSubcategoryDaySpa @"Day Spa"
#define SGPlaceSubcategoryHairRemoval @"Hair Removal"
#define SGPlaceSubcategoryMassage @"Massage"
#define SGPlaceSubcategoryNailSalon @"Nail Salon"
#define SGPlaceSubcategoryPiercing @"Piercing"
#define SGPlaceSubcategoryPsychicsAndAstrologers @"Psychics & Astrologers"
#define SGPlaceSubcategorySauna @"Sauna"
#define SGPlaceSubcategoryShoeRepairAndShine @"Shoe Repair & Shine"
#define SGPlaceSubcategorySkinCare @"Skin Care"
#define SGPlaceSubcategoryTanningParlor @"Tanning Parlor"
#define SGPlaceSubcategoryTattooParlor @"Tattoo Parlor"
#define SGPlaceSubcategoryAccountingAndTaxPreparation @"Accounting & Tax Preparation"
#define SGPlaceSubcategoryAdvertising @"Advertising"
#define SGPlaceSubcategoryArtServices @"Art Services"
#define SGPlaceSubcategoryBusinessServices @"Business Services"
#define SGPlaceSubcategoryComputerServices @"Computer Services"
#define SGPlaceSubcategoryCreditReportingAndCollection @"Credit Reporting & Collection"
#define SGPlaceSubcategoryDetectiveAndSecurityServices @"Detective & Security Services"
#define SGPlaceSubcategoryEmploymentAgencies @"Employment Agencies"
#define SGPlaceSubcategoryEngineering @"Engineering"
#define SGPlaceSubcategoryLawyerAndLegalServices @"Lawyer & Legal Services"
#define SGPlaceSubcategoryManagementAndConsulting @"Management & Consulting"
#define SGPlaceSubcategoryPrintingAndPhotocopies @"Printing & Photocopies"
#define SGPlaceSubcategoryResearch @"Research"
#define SGPlaceSubcategorySecretarialServices @"Secretarial Services"
#define SGPlaceSubcategoryTestingLab @"Testing Lab"
#define SGPlaceSubcategoryArchitect @"Architect"
#define SGPlaceSubcategoryDeveloper @"Developer"
#define SGPlaceSubcategoryRealEstateAgent @"Real Estate Agent"
#define SGPlaceSubcategoryRealEstateOperator @"Real Estate Operator"
#define SGPlaceSubcategoryRealEstateServices @"Real Estate Services"
#define SGPlaceSubcategorySurveying @"Surveying"
#define SGPlaceSubcategoryAnimalServices @"Animal Services"
#define SGPlaceSubcategoryAutoRental @"Auto Rental"
#define SGPlaceSubcategoryAutoRepair @"Auto Repair"
#define SGPlaceSubcategoryCarWash @"Car Wash"
#define SGPlaceSubcategoryDrivingSchool @"Driving School"
#define SGPlaceSubcategoryEventSpace @"Event Space"
#define SGPlaceSubcategoryFuneralServices @"Funeral Services"
#define SGPlaceSubcategoryLaundryAndDryCleaning @"Laundry & Dry Cleaning"
#define SGPlaceSubcategoryPetBoarding @"Pet Boarding"
#define SGPlaceSubcategoryPhotofinishing @"Photofinishing"
#define SGPlaceSubcategoryPortraitStudio @"Portrait Studio"
#define SGPlaceSubcategoryRepairShop @"Repair Shop"
#define SGPlaceSubcategorySelfServiceLaundry @"Self-Service Laundry"
#define SGPlaceSubcategoryStorage @"Storage"
#define SGPlaceSubcategoryVeterinaryServices @"Veterinary Services"
#define SGPlaceSubcategoryEmissionsTesting @"Emissions Testing"
#define SGPlaceSubcategoryAdultCare @"Adult Care"
#define SGPlaceSubcategoryChildCare @"Child Care"
#define SGPlaceSubcategoryJobTraining @"Job Training"
#define SGPlaceSubcategoryRetirementHome @"Retirement Home"
#define SGPlaceSubcategoryCable @"Cable"
#define SGPlaceSubcategoryElectric @"Electric"
#define SGPlaceSubcategoryFuelOilAndLPG @"Fuel Oil & LPG"
#define SGPlaceSubcategoryMobilePhone @"Mobile Phone"
#define SGPlaceSubcategoryNaturalGas @"Natural Gas"
#define SGPlaceSubcategoryRecycling @"Recycling"
#define SGPlaceSubcategoryRefuse @"Refuse"
#define SGPlaceSubcategorySewage @"Sewage"
#define SGPlaceSubcategoryTelephone @"Telephone"
#define SGPlaceSubcategoryWater @"Water"
#define SGPlaceSubcategoryDomestic @"Domestic"
#define SGPlaceSubcategoryGeneralAviation @"General Aviation"
#define SGPlaceSubcategoryInternational @"International"
#define SGPlaceSubcategoryBus @"Bus"
#define SGPlaceSubcategoryTrain @"Train"
#define SGPlaceSubcategoryBicycle @"Bicycle"
#define SGPlaceSubcategoryGarage @"Garage"
#define SGPlaceSubcategoryLot @"Lot"
#define SGPlaceSubcategoryLightRail @"Light Rail"
#define SGPlaceSubcategoryRail @"Rail"
#define SGPlaceSubcategoryFreight @"Freight"
#define SGPlaceSubcategoryPassenger @"Passenger"
