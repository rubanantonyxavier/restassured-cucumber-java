@api
@fcra
@lsfm
@section
@property_detail
@condo_tel
Feature: LSFM FCRA - Property Detail Section - Condo Tel

  @MADLRVP-13969
  Scenario: [MADLRVP-13969] Verify LSFM FCRA - RESORT HOTEL - '501 ATLANTIC AVE, VIRGINIA BEACH, VA 23451'
    Given the request XML filepath is /ript/fcra/lsfm/sections/property_detail/MADLRVP-13969.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //PropertySection/SubjectProperty/CondoTel |
    And the response has xpath
      | XPath                               | expected         |
      | //SubjectProperty/CondoTel/@address | 501 ATLANTIC AVE |
      | //SubjectProperty/CondoTel/@status  | KNOWN CONDOTEL   |

  @MADLRVP-13971
  Scenario: [MADLRVP-13971] Verify LSFM FCRA - CONDO RESORT - '4621 GULF OF MEXICO DR, LONGBOAT KEY, FL 34228'
    Given the request XML filepath is /ript/fcra/lsfm/sections/property_detail/MADLRVP-13971.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //PropertySection/SubjectProperty/CondoTel |
    And the response has xpath
      | XPath                               | expected               |
      | //SubjectProperty/CondoTel/@address | 4621 GULF OF MEXICO DR |
      | //SubjectProperty/CondoTel/@status  | KNOWN CONDOTEL         |

  @MADLRVP-14088
  Scenario: [MADLRVP-14088] Verify LSFM FCRA - CONDOTEL Status : PENDING - '215 N MICHIGAN, CHICAGO, IL, 60601'
    Given the request XML filepath is /ript/fcra/lsfm/sections/property_detail/MADLRVP-14088.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //PropertySection/SubjectProperty/CondoTel |
    And the response has xpath
      | XPath                               | expected       |
      | //SubjectProperty/CondoTel/@address | 215 N MICHIGAN |
      | //SubjectProperty/CondoTel/@status  | PENDING        |
