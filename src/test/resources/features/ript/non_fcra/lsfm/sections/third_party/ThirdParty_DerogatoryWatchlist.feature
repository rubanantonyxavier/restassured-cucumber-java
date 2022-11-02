@api
@non_fcra
@lsfm
@section
@third_party
@derogatory_watchlist
Feature: LSFM - Third Party - Derogatory Watchlist

  @MADLRVP-15487
  Scenario: [MADLRVP-15487] Verify LSFM - DEROGATORY LISTS - Government Watch Lists
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-15487.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/DerogatoryLists/GovernmentWatchList/DerogatoryMatch/MatchData |
    And the response has xpath
      | XPath                                                   | expected |
      | //GovernmentWatchList//MatchData/SearchName/@firstName  | EDWARD   |
      | //GovernmentWatchList//MatchData/SearchName/@middleName | J        |
      | //GovernmentWatchList//MatchData/SearchName/@lastName   | LIPOWSKI |
      | //GovernmentWatchList//MatchData/MatchName/@firstName   | EDWARD   |
      | //GovernmentWatchList//MatchData/MatchName/@middleName  | J        |
      | //GovernmentWatchList//MatchData/MatchName/@lastName    | LIPOWSKI |
