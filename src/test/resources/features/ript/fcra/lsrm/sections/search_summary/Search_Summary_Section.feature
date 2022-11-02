@api
@lsrm
@section
@search_summary
@fcra
Feature: LSRM FCRA - Search Summary Section

  @MADLRVP-13549
  Scenario Outline: [MADLRVP-13549] Verify LSRM FCRA - the role of Correspondent appears in the report 4.1
    Given the request XML filepath is /ript/fcra/lsrm/sections/search_summary/MADLRVP-13549.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ReportResults/LSRM/LSFMResults/SearchSummary/SearchSummaryStatus |
      | //SearchSummaryStatus[@actorName='<actor>']                        |
    And the response has xpath
      | XPath                                                            | expected      |
      | //SearchSummaryStatus[@actorName='<actor>']/@actorRoleText       | Correspondent |
      | //SearchSummaryStatus[@actorName='<actor>']/@isSearchesPerformed | true          |

    Examples:
      | actor     |
      | 474876992 |

  @MADLRVP-13555
  Scenario Outline: [MADLRVP-13555] Verify LSRM FCRA - the originator search is done by Company Name when no NMLS ID and NMLS_001 fires
    Given the request XML filepath is /ript/fcra/lsrm/sections/search_summary/MADLRVP-13555.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Alerts/Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged/Alert[@Id='NMLS_001']           |
      | //ReportResults/LSRM/LSFMResults/SearchSummary/SearchSummaryStatus |
      | //SearchSummaryStatus[@actorName='<actor>']                        |
    And the response has xpath
      | XPath                                                            | expected |
      | //Alert[@Id='NMLS_001']/@ExternalId                              | NMLS_001 |
      | //Alert[@Id='NMLS_001']/@Active                                  | 1        |
      | //Alert[@Id='NMLS_001']/@Status                                  | Y        |
      | //SearchSummaryStatus[@actorName='<actor>']/@actorRoleText       | Lender   |
      | //SearchSummaryStatus[@actorName='<actor>']/@isSearchesPerformed | true     |

    Examples:
      | actor                 |
      | MORTGAGE GRADER, INC. |
