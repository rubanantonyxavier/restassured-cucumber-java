@api
@fcra
@lsrm
@section
@third_party
@nmls
Feature: LSRM FCRA - Third Party - NMLS

  @MADLRVP-13486
  Scenario: [MADLRVP-13486] Verify LSRM FCRA - NMLS search returned state license as approved status
    Given the request XML filepath is /ript/fcra/lsrm/sections/third_party/MADLRVP-13486.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ThirdPartySection/NMLSDetail/NMLSSearchResult[@searchCriteria='283485']             |
      | //ThirdPartySection/NMLSDetail/NMLSSearchResult[@searchCriteria='Vincent SanFilippo'] |
      | //NMLSSearchResult[@searchCriteria='Vincent SanFilippo']//NMLSStateLicense            |
    And the response has xpath
      | XPath                                                                                     | expected   |
      | //NMLSSearchResult[@searchCriteria='283485']/@searchedBy                                  | NMLS ID    |
      | //NMLSSearchResult[@searchCriteria='Vincent SanFilippo']/@searchedBy                      | Originator |
      | //NMLSSearchResult[@searchCriteria='Vincent SanFilippo']//NMLSStateLicense/@licenseNumber | 871898296  |
      | //NMLSSearchResult[@searchCriteria='Vincent SanFilippo']//NMLSStateLicense/@regulator     | CA         |
      | //NMLSSearchResult[@searchCriteria='Vincent SanFilippo']//NMLSStateLicense/@status        | APPROVED   |
      | //NMLSSearchResult[@searchCriteria='Vincent SanFilippo']//NMLSStateLicense/@date          | 04/14/2020 |
    