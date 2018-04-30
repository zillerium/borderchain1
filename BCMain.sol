pragma solidity ^0.4.18;

// this contract stores the inventory strings, the hash of the string, and the keys to storage areas
// to add - events for updates, sha to check passed sha (if an error reject),

contract BCMain {



    struct JourneyDetail {
        bytes32 PlateNumber  ;
        bytes32 ImageLicensePlateHash ;
        bytes32 GPSPos;
        bytes32 GPSTime;
        uint Tariff;
        bytes32 ShipperAccountHash;
        bytes32 CustomsAccountHash;
        uint PaymentAmount;
        bytes32 GoodsDesc;
        uint GoodsValue;
        bytes32 GoodsCurrency;
    }

    mapping (bytes32 => JourneyDetail) JourneyDetails;
    bytes32[] public journeyAccounts;



    function addJourneyDetail (
       bytes32 PlateNumber,
       bytes32 ImageLicensePlateHash,
       bytes32 GPSPos,
       bytes32 GPSTime,
       uint Tariff,
       bytes32 ShipperAccountHash,
       bytes32 CustomsAccountHash,
       uint PaymentAmount,
       bytes32 GoodsDesc,
       uint GoodsValue,
       bytes32 GoodsCurrency,
       bytes32 companyID
       ) public {
        //    JourneyDetail memory jd =   JourneyDetail ({PlateNumber: PlateNumber,
        //    ImageLicensePlateHash: ImageLicensePlateHash,  GPSPos: GPSPos, GPSTime: GPSTime,Tariff: Tariff,
        //    ShipperAccountHash: ShipperAccountHash, CustomsAccountHash: CustomsAccountHash,
        //    PaymentAmount: PaymentAmount, GoodsDesc: GoodsDesc, GoodsValue: GoodsValue, GoodsCurrency: GoodsCurrency});
        //     JourneyDetails.push(jd);

JourneyDetails[companyID].PlateNumber=PlateNumber;
JourneyDetails[companyID].ImageLicensePlateHash=ImageLicensePlateHash;
JourneyDetails[companyID].GPSPos=GPSPos;
JourneyDetails[companyID].GPSTime=GPSTime;
JourneyDetails[companyID].Tariff=Tariff;
JourneyDetails[companyID].ShipperAccountHash=ShipperAccountHash;
JourneyDetails[companyID].CustomsAccountHash=CustomsAccountHash;
JourneyDetails[companyID].PaymentAmount=PaymentAmount;
JourneyDetails[companyID].GoodsDesc=GoodsDesc;
JourneyDetails[companyID].GoodsValue=GoodsValue;
JourneyDetails[companyID].GoodsCurrency=GoodsCurrency;




      //       JourneyDetail thisJourney = JourneyDetails[companyID];

      //            thisJourney.PlateNumber = PlateNumber;
      //            thisJourney.ImageLicensePlateHash = ImageLicensePlateHash;
      //            thisJourney.GPSPos = GPSPos;
      //            thisJourney.GPSTime = GPSTime;
      //            thisJourney.Tariff = Tariff;
      //            thisJourney.ShipperAccountHash = ShipperAccountHash;
      //            thisJourney.CustomsAccountHash = CustomsAccountHash;
      //      thisJourney.PaymentAmount = PaymentAmount;
      //      thisJourney.GoodsDesc = GoodsDesc;
      //      thisJourney.GoodsValue = GoodsValue;
      //      thisJourney.GoodsCurrency = GoodsCurrency;
      //journeyAccounts.push(companyID);


       }

    function addTariff(bytes32 CompanyAddress, uint Tariff) public {
         JourneyDetails[CompanyAddress].Tariff = Tariff;
    }

    function readJourneyDetail (bytes32 CompanyAddress) view  public returns (bytes32) {
        return JourneyDetails[CompanyAddress].PlateNumber;
    }

    function () payable public {
    }

}
