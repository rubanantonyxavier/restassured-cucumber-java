@api
@non_fcra
@lsrm
@section
@third_party
@derogatory_watchlist
Feature: LSRM - Third Party - Derogatory Watchlist

  @MADLRVP-15488
  Scenario: [MADLRVP-15488] Verify LSRM - DEROGATORY LISTS - Government Watch Lists
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/third_party/MADLRVP-15488.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ThirdPartySection/DerogatoryLists/GovernmentWatchList/DerogatoryMatch/MatchData |
    And the response has xpath
      | XPath                                                    | expected                  |
      | //GovernmentWatchList//MatchData/SearchName/@companyName | FLAMINGO MEDICAL SUPPLIES |
      | //GovernmentWatchList//MatchData/MatchName/@companyName  | FLAMINGO MEDICAL SUPPLIES |
