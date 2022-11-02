@api
@non_fcra
@lsfm
@section
@third_party
@ofac_watchlist
Feature: LSFM - Third Party - OFAC Watchlist

  @MADLRVP-13744
  Scenario: [MADLRVP-13744] LSFM - Check the functionality of LEGACY_WL_INPUT=Y [For companies]
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-13744.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //SearchSummaryStatus[@actorName='Edwards CPA PA'] |
      | //SearchSummaryStatus[@actorName='CUBATABACO']     |
    And the response has xpath
      | XPath                                                             | expected                  |
      | //SearchSummaryStatus[@actorName='Edwards CPA PA']/othgvt/@status | attention                 |
      | //SearchSummaryStatus[@actorName='Edwards CPA PA']/othgvt/@link   | WAT_3RD_PARTY_GOV_DETAILS |
      | //SearchSummaryStatus[@actorName='CUBATABACO']/ofac/@status       | attention                 |
      | //SearchSummaryStatus[@actorName='CUBATABACO']/ofac/@link         | OFAC_SDN_DETAILS          |

  @MADLRVP-13745
  Scenario: [MADLRVP-13745] LSFM - Check the functionality of LEGACY_WL_INPUT=N [For companies]
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-13745.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //SearchSummaryStatus[@actorName='AEROCARIBBEAN AIRLINES'] |
      | //SearchSummaryStatus[@actorName=', CIMEX IBERICA']        |
    And the response has xpath
      | XPath                                                                     | expected     |
      | //SearchSummaryStatus[@actorName='AEROCARIBBEAN AIRLINES']/ofac/@status   | insufficient |
      | //SearchSummaryStatus[@actorName='AEROCARIBBEAN AIRLINES']/ofac/@link     | [empty]      |
      | //SearchSummaryStatus[@actorName='AEROCARIBBEAN AIRLINES']/gsa/@status    | insufficient |
      | //SearchSummaryStatus[@actorName='AEROCARIBBEAN AIRLINES']/gsa/@link      | [empty]      |
      | //SearchSummaryStatus[@actorName='AEROCARIBBEAN AIRLINES']/othgvt/@status | insufficient |
      | //SearchSummaryStatus[@actorName='AEROCARIBBEAN AIRLINES']/othgvt/@link   | [empty]      |
      | //SearchSummaryStatus[@actorName=', CIMEX IBERICA']/ofac/@status          | insufficient |
      | //SearchSummaryStatus[@actorName=', CIMEX IBERICA']/ofac/@link            | [empty]      |
      | //SearchSummaryStatus[@actorName=', CIMEX IBERICA']/gsa/@status           | insufficient |
      | //SearchSummaryStatus[@actorName=', CIMEX IBERICA']/gsa/@link             | [empty]      |
      | //SearchSummaryStatus[@actorName=', CIMEX IBERICA']/othgvt/@status        | insufficient |
      | //SearchSummaryStatus[@actorName=', CIMEX IBERICA']/othgvt/@link          | [empty]      |
