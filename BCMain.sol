pragma solidity ^0.4.18;


contract BCMain {

    struct  VehicleDetail {
        bytes32 PlateNumber  ;
        bytes32 ImageLicensePlateHash ;
    }

    struct LocationDetail {
        bytes32 GPSPos;
        bytes32 GPSTime;
    }

    struct TariffDetail {
        uint Tariff;
    }

    struct PaymentDetail {
        bytes32 ShipperAccountHash;
        bytes32 CustomsAccountHash;
        uint PaymentAmount;
    }

    struct GoodsDetail {
        bytes32 GoodsDesc;
        uint GoodsValue;
        bytes32 GoodsCurrency;
    }

    mapping (bytes32 => VehicleDetail) public VehicleDetails;
    mapping (bytes32 => LocationDetail) public LocationDetails;
    mapping (bytes32 => PaymentDetail) public PaymentDetails;
    mapping (bytes32 => TariffDetail) public TariffDetails;
    mapping (bytes32 => GoodsDetail) public GoodsDetails;
    bytes32[] public journeyAccounts;

// test

function addCompany (bytes32 companyID) public {
  journeyAccounts.push(companyID);
}

function addVehicleDetail (bytes32 companyID, bytes32 _PlateNumber, bytes32 _ImageLicensePlateHash) public {
    VehicleDetails[companyID].PlateNumber=_PlateNumber;
    VehicleDetails[companyID].ImageLicensePlateHash=_ImageLicensePlateHash;
}

function addLocationDetail (bytes32 companyID, bytes32 _GPSPos, bytes32 _GPSTime) public {
    LocationDetails[companyID].GPSPos=_GPSPos;
    LocationDetails[companyID].GPSTime=_GPSTime;
}

function addTariffDetail (bytes32 companyID, uint _Tariff) public {
    TariffDetails[companyID].Tariff=_Tariff;
}

function addPaymentDetail (bytes32 companyID, bytes32 ShipperAccountHash, bytes32 CustomsAccountHash, uint PaymentAmount) public {
    PaymentDetails[companyID].ShipperAccountHash=ShipperAccountHash;
    PaymentDetails[companyID].CustomsAccountHash=CustomsAccountHash;
    PaymentDetails[companyID].PaymentAmount=PaymentAmount;
}
function addGoodsDetail (bytes32 companyID, bytes32 GoodsDesc, uint GoodsValue, bytes32 GoodsCurrency)  public {
    GoodsDetails[companyID].GoodsDesc=GoodsDesc;
    GoodsDetails[companyID].GoodsValue=GoodsValue;
    GoodsDetails[companyID].GoodsCurrency=GoodsCurrency;
}




    function readJourneyDetail (bytes32 CompanyAddress) view  public returns (bytes32) {
        return VehicleDetails[CompanyAddress].PlateNumber;
    }

    function () payable public {
    }

}
