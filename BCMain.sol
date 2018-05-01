pragma solidity ^0.4.18;

// storing strings is very expensive so this presently has mostly bytes32 as a storage.
// we need to use a data store such as IPFS in conjunction with the contract.

contract BCMain {

    struct  CompanyDetail {
        bytes32 CompanyIDHash;
        bytes32 CompanyName;
    }

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
// 0xa7ffc6f8bf1ed76651c14756a061d662f580ff4de43b49fa82d80a4b80f8434a
    struct PaymentDetail {
        bytes32 ShipperAccountHash;
        bytes32 CustomsAccountHash;
        uint PaymentAmount;
        bytes32 GoodsCurrency;
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
    mapping (bytes32 => CompanyDetail) public CompanyDetails;
    bytes32[] public journeyCertificates;

// hash of all journey data, stored on IPFS
function addCertificate(bytes32 certificateID) public {
  journeyCertificates.push(certificateID);
}

function addCompanyDetail (bytes32 companyID, bytes32 _CompanyName) public {
    CompanyDetails[companyID]=_companyID;
    CompanyDetails[companyID]=_CompanyName;
}

function addVehicleDetail (bytes32 certificateID, bytes32 _PlateNumber, bytes32 _ImageLicensePlateHash) public {
    VehicleDetails[certificateID].PlateNumber=_PlateNumber;
    VehicleDetails[certificateID].ImageLicensePlateHash=_ImageLicensePlateHash;
}

function addLocationDetail (bytes32 certificateID, bytes32 _GPSPos, bytes32 _GPSTime) public {
    LocationDetails[certificateID].GPSPos=_GPSPos;
    LocationDetails[certificateID].GPSTime=_GPSTime;
}

function addTariffDetail (bytes32 certificateID, uint _Tariff) public {
    TariffDetails[certificateID].Tariff=_Tariff;
}

function addPaymentDetail (bytes32 certificateID, bytes32 _ShipperAccountHash,
bytes32 _CustomsAccountHash, uint _PaymentAmount, bytes32 _GoodsCurrency) public {
    PaymentDetails[certificateID].ShipperAccountHash=_ShipperAccountHash;
    PaymentDetails[certificateID].CustomsAccountHash=_CustomsAccountHash;
    PaymentDetails[certificateID].PaymentAmount=_PaymentAmount;
    PaymentDetails[certificateID].GoodsCurrency=_GoodsCurrency;
}
function addGoodsDetail (bytes32 certificateID, bytes32 _GoodsDesc, uint _GoodsValue, bytes32 _GoodsCurrency)  public {
    GoodsDetails[certificateID].GoodsDesc=_GoodsDesc;
    GoodsDetails[certificateID].GoodsValue=_GoodsValue;
    GoodsDetails[certificateID].GoodsCurrency=_GoodsCurrency;
}

    function readVehicleDetails (bytes32 certificateID) view  public returns (bytes32, bytes32) {
        return (VehicleDetails[certificateID].PlateNumber, VehicleDetails[certificateID].ImageLicensePlateHash);
    }

    function readPaymentDetails (bytes32 certificateID) view  public returns (bytes32, bytes32, uint, bytes32) {
        return (PaymentDetails[certificateID].ShipperAccountHash,
        PaymentDetails[certificateID].CustomsAccountHash,
        PaymentDetails[certificateID].PaymentAmount,
        PaymentDetails[certificateID].GoodsCurrency
        );
    }

    function readGoodsDetails (bytes32 certificateID) view  public returns (bytes32, uint, bytes32) {
        return (GoodsDetails[certificateID].GoodsDesc,
        GoodsDetails[certificateID].GoodsValue,
        GoodsDetails[certificateID].GoodsCurrency);
    }

    function readLocationDetails (bytes32 certificateID) public  returns (bytes32, bytes32) {
        return (LocationDetails[certificateID].GPSPos,
        LocationDetails[certificateID].GPSTime);
    }

    function readCompanyDetails (bytes32 companyID) public  returns (bytes32) {
        return (CompanyDetails[companyID].CompanyName);
    }

    function readTariffDetails (bytes32 certificateID) public  returns (uint) {
        return (TariffDetails[certificateID].Tariff);
    }

    function () payable public {
    }

}
