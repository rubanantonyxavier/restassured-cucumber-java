@api
@lsfm
@section
@search_summary
@fcra
Feature: LSFM FCRA - Search Summary Section

  @MADLRVP-13548
  Scenario Outline: [MADLRVP-13548] Verify LSFM FCRA - the role of Correspondent appears in the report 4.1
    Given the request XML filepath is /ript/fcra/lsfm/sections/search_summary/MADLRVP-13548.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportResults/LSFM/SearchSummary/SearchSummaryStatus |
      | //SearchSummaryStatus[@actorName='<actor>']            |
    And the response has xpath
      | XPath                                                            | expected      |
      | //SearchSummaryStatus[@actorName='<actor>']/@actorRoleText       | Correspondent |
      | //SearchSummaryStatus[@actorName='<actor>']/@isSearchesPerformed | true          |

    Examples:
      | actor     |
      | 474876997 |

  @MADLRVP-13554
  Scenario Outline: [MADLRVP-13554] Verify LSFM FCRA - the originator search is done by Company Name when no NMLS ID and other NMLS alerts fire
    Given the request XML filepath is /ript/fcra/lsfm/sections/search_summary/MADLRVP-13554.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Alerts/Category[@Name='BROKER'][@Heading='THIRD PARTY'] |
      | //Category[@Name='BROKER']/Flagged/Alert[@Id='NMLS_003']  |
      | //Category[@Name='BROKER']/Flagged/Alert[@Id='NMLS_009']  |
      | //ReportResults/LSFM/SearchSummary/SearchSummaryStatus    |
      | //SearchSummaryStatus[@actorName='<actor>']               |
    And the response has xpath
      | XPath                                                            | expected |
      | //Alert[@Id='NMLS_003']/@ExternalId                              | NMLS_003 |
      | //Alert[@Id='NMLS_003']/@Active                                  | 1        |
      | //Alert[@Id='NMLS_003']/@Status                                  | Y        |
      | //Alert[@Id='NMLS_009']/@ExternalId                              | NMLS_009 |
      | //Alert[@Id='NMLS_009']/@Active                                  | 1        |
      | //Alert[@Id='NMLS_009']/@Status                                  | Y        |
      | //SearchSummaryStatus[@actorName='<actor>']/@actorRoleText       | Lender   |
      | //SearchSummaryStatus[@actorName='<actor>']/@isSearchesPerformed | true     |

    Examples:
      | actor                     |
      | LIVE WELL FINANCIAL, INC. |
