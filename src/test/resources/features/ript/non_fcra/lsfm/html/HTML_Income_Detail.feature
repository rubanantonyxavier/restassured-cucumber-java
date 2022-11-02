@api
@non_fcra
@lsfm
@html
@income
@detail
Feature: LSFM HTML Income Detail Section

  @salary_or_employer_validation
  @employer_data_verification
  @MADLRVP-9150
  Scenario: [MADLRVP-9150] Verify LSFM HTML - INCOME DETAIL - SALARY/EMPLOYER VALIDATION - EMPLOYER DATA VERIFICATION
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9150.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                     | expected                                      |
      | //div[@id='IncomeBorrowerB0R0']/div/span/b                | SALARY/EMPLOYER VALIDATION: CLINTARNI, DONALD |
      | //div[@id='IV_EMP_VERIFICATION0']/table[1]//b             | EMPLOYER DATA VERIFICATION                    |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[1]/td[1]   | EMPLOYER TRACE                                |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[1]/td[2]   | BORROWER REPORTED DATA                        |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[1]/td[3]   | VERIFIED RESULTS                              |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[1]/td[4]   | STATUS                                        |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[2]/td[1]   | Company Matched:                              |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[2]/td[2]   | [NOT EMPTY]                                   |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[2]/td[3]   | [NOT EMPTY]                                   |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[3]/td[1]   | Area Code Matched:                            |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[3]/td[2]   | [NOT EMPTY]                                   |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[3]/td[3]   | [NOT EMPTY]                                   |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[4]/td[1]   | Phone Matched:                                |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[4]/td[2]   | [NOT EMPTY]                                   |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[4]/td[3]   | [NOT EMPTY]                                   |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[5]/td[1]   | Address City, State Zip                       |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[5]/td[2]   | [NOT EMPTY]                                   |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[5]/td[3]   | [NOT EMPTY]                                   |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[6]/td[1]   | Cell Phone:                                   |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[6]/td[2]   | [NOT EMPTY]                                   |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[6]/td[3]   | [NOT EMPTY]                                   |
      | //div[@id='IV_EMP_VERIFICATION0']/table[3]//tr[1]/td[1]   | OVERALL ANALYSIS:                             |
      | //div[@id='IV_EMP_VERIFICATION0']/table[3]//tr[1]/td[2]/b | [NOT EMPTY]                                   |
      | //div[@id='IV_EMP_VERIFICATION0']/div/text()[2]           | Matched                                       |
      | //div[@id='IV_EMP_VERIFICATION0']/div/text()[3]           | Not Matched                                   |
      | //div[@id='IV_EMP_VERIFICATION0']/div/text()[4]           | No Entry/Unable to Verify                     |
      | //div[@id='IV_EMP_VERIFICATION0']/div/text()[5]           | Employer Information                          |
    And the HTML response has xpath with IMAGE content
      | XPath                                                       | expected                                                       |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[2]/td[4]/img | .gif                                                           |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[3]/td[4]/img | .gif                                                           |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[4]/td[4]/img | .gif                                                           |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[5]/td[4]/img | .gif                                                           |
      | //div[@id='IV_EMP_VERIFICATION0']/table[2]//tr[6]/td[4]/img | .gif                                                           |
      | //div[@id='IV_EMP_VERIFICATION0']/table[3]//tr[1]/td[2]/img | .gif                                                           |
      | //div[@id='IV_EMP_VERIFICATION0']/div/span[1]/img           | /PCFRSWebElements/images/ui/lsfm/analysis/status_match.gif     |
      | //div[@id='IV_EMP_VERIFICATION0']/div/span[2]/img           | /PCFRSWebElements/images/ui/lsfm/analysis/status_not_match.gif |
      | //div[@id='IV_EMP_VERIFICATION0']/div/span[3]/img           | /PCFRSWebElements/images/ui/lsfm/analysis/status_no_entry.gif  |
      | //div[@id='IV_EMP_VERIFICATION0']/div/span[4]/img           | /PCFRSWebElements/images/ui/lsfm/analysis/status_info.gif      |

  @salary_or_employer_validation
  @employer_site_map
  @MADLRVP-9155
  Scenario: [MADLRVP-9155] Verify LSFM HTML - INCOME DETAIL - SALARY/EMPLOYER VALIDATION - EMPLOYER SITE MAP
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9155.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                      | expected            |
      | //div[@id='IV_EMP_SITEMAP0']//table//b     | EMPLOYER SITE MAP   |
      | //div[@id='IV_EMP_SITEMAP0']/div/div//b[1] | VALIDATED LOCATION: |
      | //div[@id='IV_EMP_SITEMAP0']/div/div//b[2] | USE CODE:           |
      | //div[@id='IV_EMP_SITEMAP0']/div/div//b[3] | INPUT LOCATION:     |
      | //div[@id='IV_EMP_SITEMAP0']/div/div//b[4] | USE CODE:           |
    And the HTML response has xpath with MAP content
      | XPath                                                   | expected   |
      | //div[@id='IV_EMP_SITEMAP0']//div[@class='employerMap'] | EmpSiteMap |

  @marijuana_registered_business_search
  @MADLRVP-9151
  Scenario: [MADLRVP-9151] Verify LSFM HTML - INCOME DETAIL - MARIJUANA REGISTERED BUSINESS SEARCH
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9151.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                              | expected                                           |
      | //div[@id='MRB_SEARCH0']/span/b                                    | MARIJUANA-REGISTERED BUSINESS SEARCH: Mills, Devon |
      | //div[@id='IC_MRB_SEARCH']//table[@class='subSectionHeader']//b    | MARIJUANA-REGISTERED BUSINESS SEARCH               |
      | //div[@id='IC_MRB_SEARCH']//table[2]/text()[1]                     | # Possible Matches Found: 1                        |
      | //div[@id='IC_MRB_SEARCH']//table[@class='mrbResult']//tr[1]/td[1] | Company Name:                                      |
      | //div[@id='IC_MRB_SEARCH']//table[@class='mrbResult']//tr[1]/td[2] | [NOT EMPTY]                                        |
      | //div[@id='IC_MRB_SEARCH']//table[@class='mrbResult']//tr[2]/td[1] | Employer Identification Number (EIN):              |
      | //div[@id='IC_MRB_SEARCH']//table[@class='mrbResult']//tr[2]/td[2] | [NOT EMPTY]                                        |
      | //div[@id='IC_MRB_SEARCH']//table[@class='mrbResult']//tr[3]/td[1] | SIC Code / Description:                            |
      | //div[@id='IC_MRB_SEARCH']//table[@class='mrbResult']//tr[3]/td[2] | [NOT EMPTY]                                        |
      | //div[@id='IC_MRB_SEARCH']//table[@class='mrbResult']//tr[4]/td[1] | Year Established / Years in Business:              |
      | //div[@id='IC_MRB_SEARCH']//table[@class='mrbResult']//tr[4]/td[2] | [NOT EMPTY]                                        |
      | //div[@id='IC_MRB_SEARCH']//table[@class='mrbResult']//tr[5]/td[1] | Physical Address City, State, Zip:                 |
      | //div[@id='IC_MRB_SEARCH']//table[@class='mrbResult']//tr[5]/td[2] | [NOT EMPTY]                                        |
      | //div[@id='IC_MRB_SEARCH']//table[@class='mrbResult']//tr[7]/td[1] | Mailing Address City, State, Zip:                  |
      | //div[@id='IC_MRB_SEARCH']//table[@class='mrbResult']//tr[7]/td[2] | [NOT EMPTY]                                        |
      | //div[@id='IC_MRB_SEARCH']//table[@class='mrbResult']//tr[8]/td[1] | Phone / Website:                                   |
      | //div[@id='IC_MRB_SEARCH']//table[@class='mrbResult']//tr[8]/td[2] | [NOT EMPTY]                                        |
      | //div[@id='IC_MRB_SEARCH']//table[@class='mrbResult']//tr[9]/td[1] | Company Executives:                                |
      | //div[@id='IC_MRB_SEARCH']//table[@class='mrbResult']//tr[9]/td[2] | [NOT EMPTY]                                        |

  @borrower_associated_marijuana_registered_business_search
  @MADLRVP-9152
  Scenario: [MADLRVP-9152] Verify LSFM HTML - INCOME DETAIL - BORROWER ASSOCIATED MARIJUANA REGISTERED BUSINESS SEARCH
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9152.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                         | expected                                                               |
      | //div[@id='MRB_BUSINESS_SEARCH0']/span/b      | BORROWER ASSOCIATED MARIJUANA-REGISTERED BUSINESS SEARCH: Mills, Devon |
      | //div[@id='IC_MRB_BUSINESS_SEARCH']//table//b | BORROWER ASSOCIATED MARIJUANA-REGISTERED BUSINESS SEARCH               |
      | //div[@id='IC_MRB_BUSINESS_SEARCH']//table[2] | No Marijuana-Registered Business found                                 |

  @borrower_associated_business_search
  @MADLRVP-9153
  Scenario: [MADLRVP-9153] Verify LSFM HTML - INCOME DETAIL - BORROWER ASSOCIATED BUSINESS SEARCH
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9153.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                  | expected                                                  |
      | //div[@id='BUS_SEARCH0']//span/b                       | BORROWER ASSOCIATED BUSINESS SEARCH: Fred-Miranda, Iliana |
      | //div[@id='BUS_SEARCH_DETAIL0']//table[1]//b           | BORROWER ASSOCIATED BUSINESS SEARCH                       |
      | //div[@id='BUS_SEARCH_DETAIL0']//table[2]//tr[1]/td[1] | Company Name:                                             |
      | //div[@id='BUS_SEARCH_DETAIL0']//table[2]//tr[1]/td[2] | [NOT EMPTY]                                               |
      | //div[@id='BUS_SEARCH_DETAIL0']//table[2]//tr[2]/td[1] | Address City, State Zip                                   |
      | //div[@id='BUS_SEARCH_DETAIL0']//table[2]//tr[2]/td[2] | [NOT EMPTY]                                               |
      | //div[@id='BUS_SEARCH_DETAIL0']//table[2]//tr[3]/td[1] | Phone:                                                    |
      | //div[@id='BUS_SEARCH_DETAIL0']//table[2]//tr[3]/td[2] | [NOT EMPTY]                                               |
      | //div[@id='BUS_SEARCH_DETAIL0']//table[2]//tr[4]/td[1] | Date Last Seen:                                           |
      | //div[@id='BUS_SEARCH_DETAIL0']//table[2]//tr[4]/td[2] | [NOT EMPTY]                                               |

  @neighborhood_income_graph
  @MADLRVP-9154
  Scenario: [MADLRVP-9154] Verify LSFM HTML - INCOME DETAIL - NEIGHBORHOOD INCOME GRAPH
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9154.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                 | expected                  |
      | //div[@id='nhiGraph']//span/b                         | NEIGHBORHOOD INCOME GRAPH |
      | //div[@id='nhiGraph']//div[@class='borderDiv']/div[1] | Estimated Income          |
      | //table[@id='nhigTable']//tr[1]/td[1]                 | Year                      |
      | //div[@class='nhigLegend']/span[1]                    | Borrower                  |
      | //div[@class='nhigLegend']/span[2]                    | Subject                   |
      | //div[@class='nhigLegend']/span[3]                    | Disclosed Income          |
    And the HTML response has xpath with IMAGE content
      | XPath                                  | expected                                                   |
      | //div[@class='nhigLegend']/span[1]/img | /PCFRSWebElements/images/ui/lsfm/pixels/borrower_pixel.png |
      | //div[@class='nhigLegend']/span[2]/img | /PCFRSWebElements/images/ui/lsfm/pixels/yellow_pixel.gif   |
      | //div[@class='nhigLegend']/span[3]/img | /PCFRSWebElements/images/ui/lsfm/pixels/red_pixel.gif      |
    And the HTML response has xpath //div[@class='nhigLegend']/div[1] with value (ignoring newline and spaces)
    """
    Bar values reflect neighborhood incomes of borrower's past residences.
    """
    And the HTML response has xpath //div[@class='nhigLegend']/div[2] with value (ignoring newline and spaces)
    """
    Insufficient salary reports to plot Validated Income Range.
    """
    And the HTML response has xpath //div[@class='nhigLegend']/div[3] with value (ignoring newline and spaces)
    """
    Click here for a land-use code definition guide.
    """
    And the HTML response has ON-CLICK elements in each XPath that end with the expected content
      | XPath                               | expected                                           |
      | //div[@class='nhigLegend']/div[3]/a | /PCFRSWebElements/html/RiPTCodeValue.HTML#use_code |

