@api
@non_fcra
@lsrm
@section
@search_summary
Feature: LSRM - Search Summary Section

  @MADLRVP-13547
  Scenario Outline: [MADLRVP-13547] Verify LSRM - the role of Correspondent appears in the report 4.0
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/search_summary/MADLRVP-13547.xml
    When the LSRM request is sent
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

  @MADLRVP-13553
  Scenario Outline: [MADLRVP-13553] Verify LSRM - the originator search is done by Company Name when no NMLS ID and other NMLS alerts fire
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/search_summary/MADLRVP-13553.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Alerts/Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged/Alert[@Id='NMLS_005']           |
      | //Category[@Name='BROKER']/Flagged/Alert[@Id='NMLS_009']           |
      | //ReportResults/LSRM/LSFMResults/SearchSummary/SearchSummaryStatus |
      | //SearchSummaryStatus[@actorName='<actor>']                        |
    And the response has xpath
      | XPath                                                            | expected |
      | //Alert[@Id='NMLS_005']/@ExternalId                              | NMLS_005 |
      | //Alert[@Id='NMLS_005']/@Active                                  | 1        |
      | //Alert[@Id='NMLS_005']/@Status                                  | Y        |
      | //Alert[@Id='NMLS_009']/@ExternalId                              | NMLS_009 |
      | //Alert[@Id='NMLS_009']/@Active                                  | 1        |
      | //Alert[@Id='NMLS_009']/@Status                                  | Y        |
      | //SearchSummaryStatus[@actorName='<actor>']/@actorRoleText       | Lender   |
      | //SearchSummaryStatus[@actorName='<actor>']/@isSearchesPerformed | true     |

    Examples:
      | actor                  |
      | INLANTA MORTGAGE, INC. |

  @MADLRVP-13752
  Scenario: [MADLRVP-13752] Verify LSRM - the suppression of names from Search Summary when no checks are done
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/search_summary/MADLRVP-13752.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ReportResults/LSRM/LSFMResults/SearchSummary/SearchSummaryStatus |
      | //SearchSummaryStatus[@actorName='4TH AND C SMOG INC']             |
      | //SearchSummaryStatus[@actorName='MANCINI, ANGELO']                |
      | //SearchSummaryStatus[@actorName='PAGE, ALEXANDRA']                |
      | //SearchSummaryStatus[@actorName='1754 MM INC']                    |
    And the response has xpath
      | XPath                                                                       | expected       |
      | //SearchSummaryStatus[@actorName='4TH AND C SMOG INC']/@actorRoleText       | PROCESSOR      |
      | //SearchSummaryStatus[@actorName='4TH AND C SMOG INC']/@isSearchesPerformed | false          |
      | //SearchSummaryStatus[@actorName='MANCINI, ANGELO']/@actorRoleText          | PROCESSOR      |
      | //SearchSummaryStatus[@actorName='MANCINI, ANGELO']/@isSearchesPerformed    | false          |
      | //SearchSummaryStatus[@actorName='PAGE, ALEXANDRA']/@actorRoleText          | AccountManager |
      | //SearchSummaryStatus[@actorName='PAGE, ALEXANDRA']/@isSearchesPerformed    | false          |
      | //SearchSummaryStatus[@actorName='1754 MM INC']/@actorRoleText              | AccountManager |
      | //SearchSummaryStatus[@actorName='1754 MM INC']/@isSearchesPerformed        | false          |

  @MADLRVP-13756
  Scenario Outline: [MADLRVP-13756] Verify LSRM - decoupling 3RDP_OFAC_WANTED and LNSFFM_OPR_OFAC_WANTED / LNSFRM_OPR_OFAC_WANTED
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/search_summary/MADLRVP-13756.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ReportResults/LSRM/LSFMResults/SearchSummary/SearchSummaryStatus |
      | //SearchSummaryStatus[@actorName='<actor>']                        |
    And the response has xpath
      | XPath                                                            | expected                         |
      | //SearchSummaryStatus[@actorName='<actor>']/@actorRoleText       | Subject property owner of record |
      | //SearchSummaryStatus[@actorName='<actor>']/@isSearchesPerformed | true                             |
      | //SearchSummaryStatus[@actorName='<actor>']/ofac/@status         | attention                        |
      | //SearchSummaryStatus[@actorName='<actor>']/ofac/@link           | OFAC_SDN_DETAILS                 |

    Examples:
      | actor           |
      | FIGUEROA, JESUS |

  @MADLRVP-13754
  Scenario: [MADLRVP-13754] Verify LSRM - Confirmation of Searches table AND SARA section - Verify 6 relationships are correctly tied in one single request, except for one
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/search_summary/MADLRVP-13754.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //SearchSummary/SearchSummaryStatus[@actorRoleText='CLOSINGCOMPANY']    |
      | //SearchSummary/SearchSummaryStatus[@actorRoleText='CLOSER2']           |
      | //SearchSummary/SearchSummaryStatus[@actorRoleText='CLOSER']            |
      | //SearchSummary/SearchSummaryStatus[@actorRoleText='ATTORNEYCOMPANY']   |
      | //SearchSummary/SearchSummaryStatus[@actorRoleText='ATTORNEY']          |
      | //SearchSummary/SearchSummaryStatus[@actorRoleText='ESCROWCOMPANY']     |
      | //SearchSummary/SearchSummaryStatus[@actorRoleText='ESCROW']            |
      | //SearchSummary/SearchSummaryStatus[@actorRoleText='TITLECOMPANY']      |
      | //SearchSummary/SearchSummaryStatus[@actorRoleText='TITLE']             |
      | //SearchSummary/SearchSummaryStatus[@actorRoleText='SETTLEMENTCOMPANY'] |
      | //SearchSummary/SearchSummaryStatus[@actorRoleText='SETTLEMENTAGENT']   |
      | //SearchSummary/SearchSummaryStatus[@actorRoleText='Notary']            |
    And the response has xpath
      | XPath                                                                  | expected                |
      | //SearchSummaryStatus[@actorRoleText='CLOSINGCOMPANY']/@actorName      | Title Agency of America |
      | //SearchSummaryStatus[@actorRoleText='CLOSINGCOMPANY']/sara/@status    | attention               |
      | //SearchSummaryStatus[@actorRoleText='CLOSINGCOMPANY']/sara/@link      | SARA                    |
      | //SearchSummaryStatus[@actorRoleText='CLOSER2']/@actorName             | Heed, William           |
      | //SearchSummaryStatus[@actorRoleText='CLOSER2']/sara/@status           | attention               |
      | //SearchSummaryStatus[@actorRoleText='CLOSER2']/sara/@link             | SARA                    |
      | //SearchSummaryStatus[@actorRoleText='CLOSER']/@actorName              | Malo, David             |
      | //SearchSummaryStatus[@actorRoleText='CLOSER']/sara/@status            | attention               |
      | //SearchSummaryStatus[@actorRoleText='CLOSER']/sara/@link              | SARA                    |
      | //SearchSummaryStatus[@actorRoleText='ATTORNEYCOMPANY']/@actorName     | Title Agency of America |
      | //SearchSummaryStatus[@actorRoleText='ATTORNEYCOMPANY']/sara/@status   | attention               |
      | //SearchSummaryStatus[@actorRoleText='ATTORNEYCOMPANY']/sara/@link     | SARA                    |
      | //SearchSummaryStatus[@actorRoleText='ATTORNEY']/@actorName            | Skepnek, Katelynn       |
      | //SearchSummaryStatus[@actorRoleText='ATTORNEY']/sara/@status          | attention               |
      | //SearchSummaryStatus[@actorRoleText='ATTORNEY']/sara/@link            | SARA                    |
      | //SearchSummaryStatus[@actorRoleText='ESCROWCOMPANY']/@actorName       | Title Agency of America |
      | //SearchSummaryStatus[@actorRoleText='ESCROWCOMPANY']/sara/@status     | attention               |
      | //SearchSummaryStatus[@actorRoleText='ESCROWCOMPANY']/sara/@link       | SARA                    |
      | //SearchSummaryStatus[@actorRoleText='ESCROW']/@actorName              | Webb, Jessica           |
      | //SearchSummaryStatus[@actorRoleText='ESCROW']/sara/@status            | attention               |
      | //SearchSummaryStatus[@actorRoleText='ESCROW']/sara/@link              | SARA                    |
      | //SearchSummaryStatus[@actorRoleText='TITLECOMPANY']/@actorName        | Title Agency of America |
      | //SearchSummaryStatus[@actorRoleText='TITLECOMPANY']/sara/@status      | attention               |
      | //SearchSummaryStatus[@actorRoleText='TITLECOMPANY']/sara/@link        | SARA                    |
      | //SearchSummaryStatus[@actorRoleText='TITLE']/@actorName               | Wright, Angela          |
      | //SearchSummaryStatus[@actorRoleText='TITLE']/sara/@status             | attention               |
      | //SearchSummaryStatus[@actorRoleText='TITLE']/sara/@link               | SARA                    |
      | //SearchSummaryStatus[@actorRoleText='SETTLEMENTCOMPANY']/@actorName   | Title Agency of America |
      | //SearchSummaryStatus[@actorRoleText='SETTLEMENTCOMPANY']/sara/@status | attention               |
      | //SearchSummaryStatus[@actorRoleText='SETTLEMENTCOMPANY']/sara/@link   | SARA                    |
      | //SearchSummaryStatus[@actorRoleText='SETTLEMENTAGENT']/@actorName     | Honrade, Daniel         |
      | //SearchSummaryStatus[@actorRoleText='SETTLEMENTAGENT']/sara/@status   | attention               |
      | //SearchSummaryStatus[@actorRoleText='SETTLEMENTAGENT']/sara/@link     | SARA                    |
      | //SearchSummaryStatus[@actorRoleText='Notary']/@actorName              | Heed, William           |
      | //SearchSummaryStatus[@actorRoleText='Notary']/sara/@status            | insufficient            |
      | //SearchSummaryStatus[@actorRoleText='Notary']/sara/@link              | SARA                    |

  @MADLRVP-13558
  Scenario: [MADLRVP-13558] Verify LSRM - Verify SARA call when company name contains special characters: / \ ;
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/search_summary/MADLRVP-13558.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ReportResults//SearchSummary/SearchSummaryStatus     |
      | //SearchSummaryStatus[@actorRoleText='CLOSINGCOMPANY'] |
      | //SearchSummaryStatus[@actorRoleText='ESCROWCOMPANY']  |
      | //SearchSummaryStatus[@actorRoleText='TITLECOMPANY']   |
    And the response has xpath
      | XPath                                                               | expected                |
      | //SearchSummaryStatus[@actorRoleText='CLOSINGCOMPANY']/@actorName   | Luciana;Luciana Company |
      | //SearchSummaryStatus[@actorRoleText='CLOSINGCOMPANY']/sara/@status | attention               |
      | //SearchSummaryStatus[@actorRoleText='CLOSINGCOMPANY']/sara/@link   | SARA                    |
      | //SearchSummaryStatus[@actorRoleText='ESCROWCOMPANY']/@actorName    | Lawyers Title/Escrow    |
      | //SearchSummaryStatus[@actorRoleText='ESCROWCOMPANY']/sara/@status  | attention               |
      | //SearchSummaryStatus[@actorRoleText='ESCROWCOMPANY']/sara/@link    | SARA                    |
      | //SearchSummaryStatus[@actorRoleText='TITLECOMPANY']/@actorName     | Ilona Lu Company        |
      | //SearchSummaryStatus[@actorRoleText='TITLECOMPANY']/sara/@status   | attention               |
      | //SearchSummaryStatus[@actorRoleText='TITLECOMPANY']/sara/@link     | SARA                    |
