@api
@non_fcra
@lsfm
@section
@property_detail
@condo_tel
Feature: LSFM - Property Detail Section - Condo Tel

  @MADLRVP-15957
  Scenario: [MADLRVP-15957] Verify LSFM - RESORT CONDO - '320 ARTIST ROAD, SANTA FE, NM 87501'
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-15957.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //PropertySection/SubjectProperty/CondoTel |
    And the response has xpath
      | XPath                              | expected       |
      | //SubjectProperty/CondoTel/@status | KNOWN CONDOTEL |

  @MADLRVP-15958
  Scenario: [MADLRVP-15958] Verify LSFM - NOT A CONDOTEL - '430 S GULFVIEW BLVD, CLEARWATER, FL 33767'
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-15958.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //PropertySection/SubjectProperty/CondoTel |
    And the response has xpath
      | XPath                              | expected       |
      | //SubjectProperty/CondoTel/@status | NOT A CONDOTEL |

  @MADLRVP-15959
  Scenario: [MADLRVP-15959] Verify LSFM - CONDOTEL - '1865 BEACH BLVD, BILOXI, MS 39531'
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-15959.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //PropertySection/SubjectProperty/CondoTel |
    And the response has xpath
      | XPath                              | expected       |
      | //SubjectProperty/CondoTel/@status | KNOWN CONDOTEL |

