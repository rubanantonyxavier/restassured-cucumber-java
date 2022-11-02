@api
@fcra
@lsfm
@section
@third_party
@nmls
Feature: LSFM FCRA - Third Party - NMLS

  @MADLRVP-13368
  Scenario: [MADLRVP-13368] LSFM FCRA - Validate NMLS search will return with no state license match on ID
    Given the request XML filepath is /ript/fcra/lsfm/sections/third_party/MADLRVP-13368.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/NMLSDetail/NMLSSearchResult[@searchedBy='NMLS ID']//NMLSRecords/NMLSRecord |
    And the response has xpath
      | XPath                                                                 | expected                      |
      | //NMLSSearchResult[@searchedBy='NMLS ID']/@searchCriteria             | 411341                        |
      | //NMLSSearchResult[@searchedBy='NMLS ID']//NMLSRecord/@message        | NO MATCHES FOUND              |
      | //NMLSSearchResult[@searchedBy='NMLS ID']//NMLSRecord/@federalMessage | NO FEDERAL REGISTRATION FOUND |
