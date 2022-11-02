@api
@non_fcra
@lsrm
@html
@property
@detail
Feature: LSRM HTML Property Detail Section

  @market_analysis
  @MADLRVP-9286
  Scenario: [MADLRVP-9286] Verify LSRM HTML - PROPERTY DETAIL - Market Analysis
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9286.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                      | expected                         |
      | //div[@id='HP_MARKET_ANALYSIS']//table[@class='subSectionHeader']//tr/td/b | MARKET ANALYSIS                  |
      | //table[@class='market_analysis_table']//tr[1]/td[1]                       | Nearby Sales :                   |
      | //table[@class='market_analysis_table']//tr[1]/td[2]                       | [NOT EMPTY]                      |
      | //table[@class='market_analysis_table']//tr[1]/td[3]                       | Reported Appraised Value:        |
      | //table[@class='market_analysis_table']//tr[1]/td[4]                       | [NOT EMPTY]                      |
      | //table[@class='market_analysis_table']//tr[1]/td[5]                       | Rural Flag:                      |
      | //table[@class='market_analysis_table']//tr[2]/td[1]                       | Max Distance:                    |
      | //table[@class='market_analysis_table']//tr[2]/td[2]                       | [NOT EMPTY]                      |
      | //table[@class='market_analysis_table']//tr[2]/td[3]                       | Nearby Sales High Value:         |
      | //table[@class='market_analysis_table']//tr[2]/td[4]                       | [NOT EMPTY]                      |
      | //table[@class='market_analysis_table']//tr[2]/td[5]                       | Mobile Home:                     |
      | //table[@class='market_analysis_table']//tr[3]/td[1]                       | Average Distance:                |
      | //table[@class='market_analysis_table']//tr[3]/td[2]                       | [NOT EMPTY]                      |
      | //table[@class='market_analysis_table']//tr[3]/td[3]                       | Nearby Sales Average Value:      |
      | //table[@class='market_analysis_table']//tr[3]/td[4]                       | [NOT EMPTY]                      |
      | //table[@class='market_analysis_table']//tr[4]/td[1]                       | Foreclosure Rate in Past 1 yr:   |
      | //table[@class='market_analysis_table']//tr[4]/td[2]                       | [NOT EMPTY]                      |
      | //table[@class='market_analysis_table']//tr[4]/td[3]                       | Nearby Sales Median Value:       |
      | //table[@class='market_analysis_table']//tr[4]/td[4]                       | [NOT EMPTY]                      |
      | //table[@class='market_analysis_table']//tr[5]/td[1]                       | # of Foreclosures in Past 3 yrs: |
      | //table[@class='market_analysis_table']//tr[5]/td[2]                       | [NOT EMPTY]                      |
      | //table[@class='market_analysis_table']//tr[5]/td[3]                       | Nearby Sales Low Value:          |
      | //table[@class='market_analysis_table']//tr[5]/td[4]                       | [NOT EMPTY]                      |
      | //table[@class='market_analysis_table']//tr[6]/td[1]                       | Foreclosure Rate in Past 3 yrs:  |
      | //table[@class='market_analysis_table']//tr[6]/td[2]                       | [NOT EMPTY]                      |
      | //table[@class='market_analysis_table']//tr[6]/td[3]                       | Disaster 1 Date:                 |
      | //table[@class='market_analysis_table']//tr[7]/td[1]                       | Gain on 3 yr Sale Pairs:         |
      | //table[@class='market_analysis_table']//tr[7]/td[2]                       | [NOT EMPTY]                      |
      | //table[@class='market_analysis_table']//tr[7]/td[3]                       | Disaster 1 Type:                 |
      | //table[@class='market_analysis_table']//tr[8]/td[1]                       | Change in 3 yr Loan Pairs:       |
      | //table[@class='market_analysis_table']//tr[8]/td[2]                       | [NOT EMPTY]                      |
      | //table[@class='market_analysis_table']//tr[8]/td[3]                       | Disaster 2 Date:                 |
      | //table[@class='market_analysis_table']//tr[9]/td[1]                       | SuperFund Site:                  |
      | //table[@class='market_analysis_table']//tr[9]/td[3]                       | Disaster 2 Type:                 |

  @subject_property_analysis
  @MADLRVP-9287
  Scenario: [MADLRVP-9287] Verify LSRM HTML - PROPERTY DETAIL - Subject Property Analysis
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9287.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                          | expected                   |
      | //div[@id='HP_SUBJECT_ANALYSIS'][1]//table[@class='subSectionHeader']//tr/td/b | SUBJECT PROPERTY ANALYSIS  |
      | //table[@class='subj_prop_analysis_table']//tr[1]/td[1]                        | Foreclosure in Past 3 yrs: |
      | //table[@class='subj_prop_analysis_table']//tr[1]/td[2]                        | [NOT EMPTY]                |
      | //table[@class='subj_prop_analysis_table']//tr[1]/td[3]                        | Last Transfer Date:        |
      | //table[@class='subj_prop_analysis_table']//tr[1]/td[4]                        | [NOT EMPTY]                |
      | //table[@class='subj_prop_analysis_table']//tr[1]/td[5]                        | Land Use Code:             |
      | //table[@class='subj_prop_analysis_table']//tr[2]/td[1]                        | Sale Gain in Past 3 yrs:   |
      | //table[@class='subj_prop_analysis_table']//tr[2]/td[2]                        | [NOT EMPTY]                |
      | //table[@class='subj_prop_analysis_table']//tr[2]/td[3]                        | Last Transfer Price:       |
      | //table[@class='subj_prop_analysis_table']//tr[2]/td[4]                        | [NOT EMPTY]                |
      | //table[@class='subj_prop_analysis_table']//tr[2]/td[5]/b                      | APN:                       |
      | //table[@class='subj_prop_analysis_table']//tr[2]/td[5]                        | [NOT EMPTY]                |
      | //table[@class='subj_prop_analysis_table']//tr[3]/td[1]                        | Loan Change in Past 3 yrs: |
      | //table[@class='subj_prop_analysis_table']//tr[3]/td[2]                        | [NOT EMPTY]                |
      | //table[@class='subj_prop_analysis_table']//tr[3]/td[3]                        | Active Notice Of Default:  |
      | //table[@class='subj_prop_analysis_table']//tr[3]/td[4]                        | [NOT EMPTY]                |
      | //table[@class='subj_prop_analysis_table']//tr[3]/td[5]/b                      | ALT APN:                   |
      | //table[@class='subj_prop_analysis_table']//tr[3]/td[5]                        | [NOT EMPTY]                |
    And the HTML response has ON-CLICK elements in each XPath that end with the expected content
      | XPath                                                  | expected                                            |
      | //table[@class='subj_prop_analysis_table']//tr[1]/td/a | /PCFRSWebElements/html/RiPTCodeValue.HTML#use_code  |
      | //table[@class='subj_prop_analysis_table']//tr[2]/td/a | /PCFRSWebElements/html/RiPTCodeValue.HTML#sale_code |

  @most_recent_mls_listing_information
  @MADLRVP-9288
  Scenario: [MADLRVP-9288] Verify LSRM HTML - PROPERTY DETAIL - Most Recent MLS Listing Information
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9288.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                          | expected                             |
      | //div[@id='HP_SUBJECT_ANALYSIS'][2]//table[@class='subSectionHeader']//tr/td/b | MOST RECENT MLS LISTING INFORMATION: |
      | //table[@class='mlssection']//tr[1]/td[1]                                      | Amount:                              |
      | //table[@class='mlssection']//tr[1]/td[2]                                      | [NOT EMPTY]                          |
      | //table[@class='mlssection']//tr[1]/td[3]                                      | Date:                                |
      | //table[@class='mlssection']//tr[1]/td[4]                                      | [NOT EMPTY]                          |
      | //table[@class='mlssection']//tr[1]/td[5]                                      | Type:                                |
      | //table[@class='mlssection']//tr[1]/td[6]                                      | [NOT EMPTY]                          |
      | //table[@class='mlssection']//tr[2]/td[1]                                      | Photos:                              |
      | //table[@class='mlssection']//tr[2]/td[2]                                      | [NOT EMPTY]                          |
      | //table[@class='mlssection']//tr[2]/td[3]                                      | Status:                              |
      | //table[@class='mlssection']//tr[2]/td[4]                                      | [NOT EMPTY]                          |
      | //table[@class='mlssection']//tr[2]/td[5]                                      | Agent:                               |
      | //table[@class='mlssection']//tr[2]/td[6]                                      | [NOT EMPTY]                          |

  @heat_map
  @area_map
  @MADLRVP-9289
  Scenario: [MADLRVP-9289] Verify LSRM HTML - PROPERTY DETAIL - Heat Map and Area Map
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9289.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                         | expected                   |
      | //div[@id='HP_HEAT_MAP']//table[@class='subSectionHeader']//b | HEAT MAP                   |
      | //div[@id='HP_AREA_MAP']//table[@class='subSectionHeader']//b | AREA MAP                   |
      | //div[@id='HP_AREA_MAP']//div[@class='maplegend']/span[1]     | Subject Property           |
      | //div[@id='HP_AREA_MAP']//div[@class='maplegend']/span[2]     | Full Value                 |
      | //div[@id='HP_AREA_MAP']//div[@class='maplegend']/span[3]     | Foreclosure/REO/Short Sale |
    And the HTML response has xpath //div[@id='HP_HEAT_MAP']//div[@class='maplegend'] with value (ignoring newline and spaces)
    """
    Sixteen shades of Tan-to-Green shading are used to depict values: tan is lower, green is higher.
    """
    And the HTML response has xpath with IMAGE content
      | XPath                                                     | expected                                                                      |
      | //div[@id='HP_HEAT_MAP']//div[@class='CM_mapBorder']//img | loansafe_full_sale_I.gif                                                      |
      | //div[@id='HP_AREA_MAP']//div[@class='maplegend']/img[1]  | /PCFRSWebElements/images/ui/lsrm/letters/subject.gif                          |
      | //div[@id='HP_AREA_MAP']//div[@class='maplegend']/img[2]  | /PCFRSWebElements/images/ui/lsrm/ui/full_sale/full_sale_empty.gif             |
      | //div[@id='HP_AREA_MAP']//div[@class='maplegend']/img[3]  | /PCFRSWebElements/images/ui/lsrm/ui/distressed_sale/distressed_sale_empty.gif |
    And the HTML response has xpath with MAP content
      | XPath                                       | expected |
      | //div[@id='HP_AREA_MAP']//div[@class='map'] | RoadMap  |

  @recent_subject_property_resale_summary
  @MADLRVP-9290
  Scenario: [MADLRVP-9290] Verify LSRM HTML - PROPERTY DETAIL - RECENT SUBJECT PROPERTY RESALE SUMMARY
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9290.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                              | expected                                                              |
      | //div[@id='recentPropertyResale']//b               | RECENT SUBJECT PROPERTY RESALE SUMMARY                                |
      | //table[@class='lsfm_recent_resale']//tr[1]/td[2]  | Sale Transaction                                                      |
      | //table[@class='lsfm_recent_resale']//tr[1]/td[3]  | Non-Sale Transaction                                                  |
      | //table[@class='lsfm_recent_resale']//tr[2]/td[1]  | Transaction within the last 90 days                                   |
      | //table[@class='lsfm_recent_resale']//tr[2]/td[2]  | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[2]/td[3]  | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[3]/td[1]  | Transaction within the last 12 months                                 |
      | //table[@class='lsfm_recent_resale']//tr[3]/td[2]  | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[3]/td[3]  | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[4]/td[1]  | Last Transaction Date                                                 |
      | //table[@class='lsfm_recent_resale']//tr[4]/td[2]  | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[4]/td[3]  | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[5]/td[1]  | Last Transaction Value                                                |
      | //table[@class='lsfm_recent_resale']//tr[5]/td[2]  | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[5]/td[3]  | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[6]/td[1]  | Transaction Type                                                      |
      | //table[@class='lsfm_recent_resale']//tr[6]/td[2]  | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[6]/td[3]  | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[7]/td[1]  | Deed Type                                                             |
      | //table[@class='lsfm_recent_resale']//tr[7]/td[2]  | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[7]/td[3]  | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[8]/td[1]  | Current Reported Appraised Value to Last Sales Price                  |
      | //table[@class='lsfm_recent_resale']//tr[8]/td[2]  | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[8]/td[3]  | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[9]/td[1]  | Last Nearby Sales Median Value                                        |
      | //table[@class='lsfm_recent_resale']//tr[9]/td[2]  | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[9]/td[3]  | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[10]/td[1] | Current Nearby Sales Median Value                                     |
      | //table[@class='lsfm_recent_resale']//tr[10]/td[2] | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[10]/td[3] | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[11]/td[1] | Last Sales Price to Last Nearby Sales Median Value                    |
      | //table[@class='lsfm_recent_resale']//tr[11]/td[2] | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[11]/td[3] | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[12]/td[1] | Current Reported Appraised Value to Current Nearby Sales Median Value |
      | //table[@class='lsfm_recent_resale']//tr[12]/td[2] | [NOT EMPTY]                                                           |
      | //table[@class='lsfm_recent_resale']//tr[12]/td[3] | [NOT EMPTY]                                                           |

  @subject_property_report
  @first_section
  @MADLRVP-9292
  Scenario: [MADLRVP-9292] Verify LSRM HTML - PROPERTY DETAIL - SUBJECT PROPERTY REPORT - First Section
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9292.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                                | expected                |
      | //div[@id='hpsubjectPropertyReport']/div/span/b                                      | SUBJECT PROPERTY REPORT |
      | //div[@id='hpsubjectPropertyReport']//table[@class='gray_text_table']//tr[1]/td[1]/b | Site Address:           |
      | //div[@id='hpsubjectPropertyReport']//table[@class='gray_text_table']//tr[1]/td[2]   | [NOT EMPTY]             |
      | //div[@id='hpsubjectPropertyReport']//table[@class='gray_text_table']//tr[2]/td[1]/b | Mail Address:           |
      | //div[@id='hpsubjectPropertyReport']//table[@class='gray_text_table']//tr[2]/td[2]   | [NOT EMPTY]             |
      | //div[@id='hpsubjectPropertyReport']//table[@class='gray_text_table']//tr[3]/td[1]/b | Current Owner:          |
      | //div[@id='hpsubjectPropertyReport']//table[@class='gray_text_table']//tr[3]/td[2]   | [NOT EMPTY]             |
      | //div[@id='hpsubjectPropertyReport']//table[@class='gray_text_table']//tr[4]/td[1]/b | Second Owner:           |
      | //div[@id='hpsubjectPropertyReport']//table[@class='gray_text_table']//tr[4]/td[2]   | [empty]                 |
      | //table[@class='gray_text_table property_grid_2_cell']//tr[1]/td[1]/b[1]             | Last Transfer Date:     |
      | //table[@class='gray_text_table property_grid_2_cell']//tr[1]/td[1]/b[2]             | Last Transfer Price:    |
      | //table[@class='gray_text_table property_grid_2_cell']//tr[1]/td[1]/b[3]             | Assessed Land:          |
      | //table[@class='gray_text_table property_grid_2_cell']//tr[1]/td[1]/b[4]             | Assessed Improvement:   |
      | //table[@class='gray_text_table property_grid_2_cell']//tr[1]/td[1]/b[5]             | Assessed Total:         |
      | //table[@class='gray_text_table property_grid_2_cell']//tr[1]/td[1]/b[6]             | Assessed Market:        |
      | //table[@class='gray_text_table property_grid_2_cell']//tr[1]/td[2]/b[1]             | County:                 |
      | //table[@class='gray_text_table property_grid_2_cell']//tr[1]/td[2]/b[2]             | MSA Name:               |
      | //table[@class='gray_text_table property_grid_2_cell']//tr[1]/td[2]/b[3]             | MSA Code:               |
      | //table[@class='gray_text_table property_grid_2_cell']//tr[1]/td[2]/b[4]             | Census Block:           |
      | //table[@class='gray_text_table property_grid_2_cell']//tr[1]/td[2]/b[5]             | School District:        |
      | //table[@class='gray_text_table property_grid_2_cell']//tr[1]/td[2]/b[6]             | APN:                    |
      | //table[@class='gray_text_table property_grid_2_cell']//tr[1]/td[2]/b[7]             | Alternate APN:          |
      | //table[@class='gray_text_table property_grid_2_cell']//tr[2]/td[1]/b[1]             | Legal Desc:             |

  @subject_property_report
  @second_section
  @subject_property_details
  @MADLRVP-9291
  Scenario: [MADLRVP-9291] Verify LSRM HTML - PROPERTY DETAIL - SUBJECT PROPERTY REPORT - Second Section: SUBJECT PROPERTY DETAILS
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9291.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                 | expected                                |
#Subject_Property_Details
      | //div[@id='HP_SUBJECT_DETAIL']//table[@class='subSectionHeader']//b   | SUBJECT PROPERTY DETAILS                |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[1]/td[1]/b | Use Code:                               |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[1]/td[2]/b | Building Sq Ft:                         |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[1]/td[3]/b | Living Sq Ft:                           |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[1]/td[4]/b | $ Per Sq Ft:                            |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[2]/td[1]/b | Lot Size:                               |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[2]/td[2]/b | Bedrooms:                               |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[2]/td[3]/b | Bathrooms:                              |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[2]/td[4]/b | Total Rooms:                            |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[3]/td[1]/b | View:                                   |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[3]/td[2]/b | Improved:                               |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[3]/td[3]/b | Heating:                                |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[3]/td[4]/b | Cooling:                                |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[4]/td[1]/b | Tax Amount:                             |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[4]/td[2]/b | Garage :                                |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[4]/td[3]/b | Stories:                                |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[4]/td[4]/b | Year Built:                             |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[5]/td[1]/b | No. of Units:                           |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[5]/td[2]/b | Pool:                                   |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[5]/td[3]/b | Fireplace:                              |
      | //table[@class='gray_text_table property_grid_4_cell']//tr[5]/td[4]/b | Zoning:                                 |
#Subject_Property_Sales_And_Loan_History
      | //table[@class='property_loanHistory data']//tr[1]//b                 | SUBJECT PROPERTY SALES AND LOAN HISTORY |
      | //table[@class='property_loanHistory data']//tr[2]/td[1]              | Sale/ Recording Date                    |
      | //table[@class='property_loanHistory data']//tr[2]/td[2]              | Transfer                                |
      | //table[@class='property_loanHistory data']//tr[2]/td[3]              | Value                                   |
      | //table[@class='property_loanHistory data']//tr[2]/td[4]              | 1st Loan/ 2nd Loan                      |
      | //table[@class='property_loanHistory data']//tr[2]/td[5]              | Loan/ Rate                              |
      | //table[@class='property_loanHistory data']//tr[2]/td[6]              | Deed/ (Val. Sale)                       |
      | //table[@class='property_loanHistory data']//tr[2]/td[7]              | Doc. No.                                |
      | //table[@class='property_loanHistory data']//tr[2]/td[8]              | Transactors                             |
    And the HTML response has ON-CLICK elements in each XPath that end with the expected content
      | XPath                                                                             | expected                                                   |
      | //table[@class='property_loanHistory data']//span[contains(text(),'STNDALNE')]/.. | /PCFRSWebElements/html/RiPTCodeValue.HTML#TRANSACTION_TYPE |
      | //table[@class='property_loanHistory data']//span[contains(text(),'SALE')]/..     | /PCFRSWebElements/html/RiPTCodeValue.HTML#TRANSACTION_TYPE |
      | //table[@class='property_loanHistory data']//span[contains(text(),'NONARMSP')]/.. | /PCFRSWebElements/html/RiPTCodeValue.HTML#TRANSACTION_TYPE |
      | //table[@class='property_loanHistory data']//a[contains(text(),'CASH')]           | /PCFRSWebElements/html/RiPTCodeValue.HTML#loan_type        |
      | //table[@class='property_loanHistory data']//a[contains(text(),'REVOLV')]         | /PCFRSWebElements/html/RiPTCodeValue.HTML#loan_type        |
      | //table[@class='property_loanHistory data']//a[contains(text(),'FIX')]            | /PCFRSWebElements/html/RiPTCodeValue.HTML#interest_type    |
      | //table[@class='property_loanHistory data']//a[contains(text(),'UNKN')]           | /PCFRSWebElements/html/RiPTCodeValue.HTML#loan_type        |
      | //table[@class='property_loanHistory data']//a[contains(text(),'VAR')]            | /PCFRSWebElements/html/RiPTCodeValue.HTML#interest_type    |

  @nearby_properties_review
  @prices_for_nearby_sales
  @MADLRVP-9293
  Scenario: [MADLRVP-9293] Verify LSRM HTML - PROPERTY DETAIL - NEARBY PROPERTIES REVIEW - PRICES FOR NEARBY SALES
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9293.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                             | expected                          |
      | //div[@id='lsfm_nearbyPropertyReview']/div/span/b | NEARBY PROPERTIES REVIEW          |
      | //div[@id='NEARBY_PRICE_GRAPH']//b                | PRICES FOR NEARBY SALES           |
      | //div[@id='pricegraphlegend']/span[1]             | Full Value                        |
      | //div[@id='pricegraphlegend']/span[2]             | Foreclosure/Bank Owned/Short Sale |
    And the HTML response has xpath //table[@class='nearby_sales_chart']//div[@class='fullwidth'][2] with value (ignoring newline and spaces)
    """
    Recent nearby sales sorted by value from high to low.
    All values in thousands of dollars.
    """
    And the HTML response has xpath //table[@class='nearby_sales_chart']//div[@class='fullwidth'][3] with value (ignoring newline and spaces)
    """
    Properties which have a current foreclosure, bank owned,
    or short sale status are shown in the lighter shade.
    """
    And the HTML response has xpath with IMAGE content
      | XPath                                     | expected                                                                      |
      | //div[@id='pricegraphlegend']/span[1]/img | /PCFRSWebElements/images/ui/lsrm/ui/full_sale/full_sale_empty.gif             |
      | //div[@id='pricegraphlegend']/span[2]/img | /PCFRSWebElements/images/ui/lsrm/ui/distressed_sale/distressed_sale_empty.gif |

  @nearby_properties_review
  @nearby_sales
  @summary
  @MADLRVP-9294
  Scenario: [MADLRVP-9294] Verify LSRM HTML - PROPERTY DETAIL - NEARBY PROPERTIES REVIEW - NEARBY SALES SUMMARY
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9294.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                  | expected                                                        |
      | //div[@id='nearby_sales_summary']//table[@class='subSectionHeader']//b | NEARBY SALES: SUMMARY                                           |
      | //table[@class='resaleSummaryData']//tr[1]/td[2]/b                     | Full Value                                                      |
      | //table[@class='resaleSummaryData']//tr[1]/td[3]/b                     | Short Sale                                                      |
      | //table[@class='resaleSummaryData']//tr[1]/td[4]/b                     | Foreclosure / Bank Owned                                        |
      | //table[@class='resaleSummaryData']//tr[2]/td[1]/b                     | Property Count                                                  |
      | //table[@class='resaleSummaryData']//tr[2]/td[2]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[2]/td[3]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[2]/td[4]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[3]/td[1]/b                     | Minimum Sales Price                                             |
      | //table[@class='resaleSummaryData']//tr[3]/td[2]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[3]/td[3]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[3]/td[4]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[4]/td[1]/b                     | Median Sales Price                                              |
      | //table[@class='resaleSummaryData']//tr[4]/td[2]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[4]/td[3]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[4]/td[4]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[5]/td[1]/b                     | Maximum Sales Price                                             |
      | //table[@class='resaleSummaryData']//tr[5]/td[2]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[5]/td[3]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[5]/td[4]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[6]/td[1]/b                     | # of 3 Year Sales Pairs                                         |
      | //table[@class='resaleSummaryData']//tr[6]/td[2]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[6]/td[3]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[6]/td[4]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[7]/td[1]/b                     | # of Sales Pairs with Value Increasing / Average Price Increase |
      | //table[@class='resaleSummaryData']//tr[7]/td[2]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[7]/td[3]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[7]/td[4]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[8]/td[1]/b                     | # of Sales Pairs with Value Decreasing / Average Price Decrease |
      | //table[@class='resaleSummaryData']//tr[8]/td[2]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[8]/td[3]                       | [NOT EMPTY]                                                     |
      | //table[@class='resaleSummaryData']//tr[8]/td[4]                       | [NOT EMPTY]                                                     |

  @nearby_properties_review
  @nearby_sales
  @full_value
  @MADLRVP-9295
  Scenario: [MADLRVP-9295] Verify LSRM HTML - PROPERTY DETAIL - NEARBY PROPERTIES REVIEW - NEARBY SALES FULL VALUE
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9295.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                                     | expected                 |
#Nearby_Sales-Full_Value
      | //div[@id='lsfm_full_value_nearby_sales']//b                                              | NEARBY SALES: FULL VALUE |
      | //div[@id='lsfm_full_value_nearby_sales']//table[@class='data lsfm_nearby_header']//td[2] | Miles                    |
      | //div[@id='lsfm_full_value_nearby_sales']//table[@class='data lsfm_nearby_header']//td[3] | Address                  |
      | //div[@id='lsfm_full_value_nearby_sales']//table[@class='data lsfm_nearby_header']//td[4] | Land Use                 |
      | //div[@id='lsfm_full_value_nearby_sales']//table[@class='data lsfm_nearby_header']//td[5] | Sale Date                |
      | //div[@id='lsfm_full_value_nearby_sales']//table[@class='data lsfm_nearby_header']//td[6] | Sale Value               |
      | //div[@id='lsfm_full_value_nearby_sales']//table[@class='data lsfm_nearby_header']//td[8] | Living Sq Ft             |
      | //div[@id='lsfm_full_value_nearby_sales']//table[@class='data lsfm_nearby_header']//td[9] | $/Sq Ft                  |
#Nearby_Sales-Full_Value_Details
      | //div[@id='NBRecord1']//table[@class='NBDetail']//tr[1]/td[1]/strong                      | Full Address:            |
      | //div[@id='NBRecord1']//table[@class='NBDetail']//tr[2]/td[1]/strong                      | Zoning                   |
      | //div[@id='NBRecord1']//table[@class='NBDetail']//tr[2]/td[2]/strong                      | Year Built               |
      | //div[@id='NBRecord1']//table[@class='NBDetail']//tr[2]/td[3]/strong                      | Bed/Bath                 |
      | //div[@id='NBRecord1']//table[@class='NBDetail']//tr[2]/td[4]/strong                      | Rooms                    |
      | //div[@id='NBRecord1']//table[@class='NBDetail']//tr[2]/td[5]/strong                      | Pool                     |
      | //div[@id='NBRecord1']//table[@class='NBDetail']//tr[3]/td[1]/strong                      | Lot Sq Ft                |
      | //div[@id='NBRecord1']//table[@class='NBDetail']//tr[3]/td[2]/strong                      | Assessment               |
      | //div[@id='NBRecord1']//table[@class='NBDetail']//tr[3]/td[3]/strong                      | Number of Units:         |
      | //div[@id='NBRecord1']//table[@class='NBDetail']//tr[4]/td[1]/strong                      | APN                      |
      | //div[@id='NBRecord1']//table[@class='NBDetail']//tr[4]/td[2]/strong                      | Alternate APN            |
      | //div[@id='NBRecord1']//table[@class='NBDetail']//tr[5]/td[1]/strong                      | School District          |
      | //div[@id='NBRecord1']//table[@class='NBDetail']//tr[6]/td[1]/strong                      | Legal Desc               |
#Nearby_Sales-Full_Value_Sales_History
      | //div[@id='NBRecord1']//table[@class='NBHistory data']//tr[1]/td[1]                       | Sales History            |
      | //div[@id='NBRecord1']//table[@class='NBHistory data']//tr[2]/td[1]                       | Sale/ Recording Date     |
      | //div[@id='NBRecord1']//table[@class='NBHistory data']//tr[2]/td[2]                       | Transaction              |
      | //div[@id='NBRecord1']//table[@class='NBHistory data']//tr[2]/td[3]                       | Value                    |
      | //div[@id='NBRecord1']//table[@class='NBHistory data']//tr[2]/td[4]                       | 1st Loan                 |
      | //div[@id='NBRecord1']//table[@class='NBHistory data']//tr[2]/td[5]                       | Deed                     |
      | //div[@id='NBRecord1']//table[@class='NBHistory data']//tr[2]/td[6]                       | Buyer/2nd Buyer          |
      | //div[@id='NBRecord1']//table[@class='NBHistory data']//tr[2]/td[7]                       | Seller/2nd Seller        |
    And the HTML response has ON-CLICK elements in each XPath that end with the expected content
      | XPath                                                                 | expected                                           |
      | //div[@id='lsfm_full_value_nearby_sales']//a[contains(text(),'RSFR')] | /PCFRSWebElements/html/RiPTCodeValue.HTML#use_code |

  @nearby_properties_review
  @nearby_sales
  @foreclosure_bank-owned_short-sale
  @MADLRVP-9296
  Scenario: [MADLRVP-9296] Verify LSRM HTML - PROPERTY DETAIL - NEARBY PROPERTIES REVIEW - NEARBY SALES - FORECLOSURE/BANK-OWNED/SHORT-SALE
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9296.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                                     | expected                                        |
#Nearby_Sales-FORECLOSURE/BANK_OWNED/SHORT_SALE
      | //div[@id='lsfm_distressed_nearby_sales']//b                                              | NEARBY SALES: FORECLOSURE/BANK OWNED/SHORT SALE |
      | //div[@id='lsfm_distressed_nearby_sales']//table[@class='data lsfm_nearby_header']//td[2] | Miles                                           |
      | //div[@id='lsfm_distressed_nearby_sales']//table[@class='data lsfm_nearby_header']//td[3] | Address                                         |
      | //div[@id='lsfm_distressed_nearby_sales']//table[@class='data lsfm_nearby_header']//td[4] | Land Use                                        |
      | //div[@id='lsfm_distressed_nearby_sales']//table[@class='data lsfm_nearby_header']//td[5] | Sale Date                                       |
      | //div[@id='lsfm_distressed_nearby_sales']//table[@class='data lsfm_nearby_header']//td[6] | Sale Value                                      |
      | //div[@id='lsfm_distressed_nearby_sales']//table[@class='data lsfm_nearby_header']//td[8] | Living Sq Ft                                    |
      | //div[@id='lsfm_distressed_nearby_sales']//table[@class='data lsfm_nearby_header']//td[9] | $/Sq Ft                                         |
#Nearby_Sales-FORECLOSURE/BANK_OWNED/SHORT_SALE_Details
      | //div[@id='NBRecord2_1']//table[@class='NBDetail']//tr[1]/td[1]/strong                    | Full Address:                                   |
      | //div[@id='NBRecord2_1']//table[@class='NBDetail']//tr[2]/td[1]/strong                    | Zoning                                          |
      | //div[@id='NBRecord2_1']//table[@class='NBDetail']//tr[2]/td[2]/strong                    | Year Built                                      |
      | //div[@id='NBRecord2_1']//table[@class='NBDetail']//tr[2]/td[3]/strong                    | Bed/Bath                                        |
      | //div[@id='NBRecord2_1']//table[@class='NBDetail']//tr[2]/td[4]/strong                    | Rooms                                           |
      | //div[@id='NBRecord2_1']//table[@class='NBDetail']//tr[2]/td[5]/strong                    | Pool                                            |
      | //div[@id='NBRecord2_1']//table[@class='NBDetail']//tr[3]/td[1]/strong                    | Lot Sq Ft                                       |
      | //div[@id='NBRecord2_1']//table[@class='NBDetail']//tr[3]/td[2]/strong                    | Assessment                                      |
      | //div[@id='NBRecord2_1']//table[@class='NBDetail']//tr[3]/td[3]/strong                    | Number of Units:                                |
      | //div[@id='NBRecord2_1']//table[@class='NBDetail']//tr[4]/td[1]/strong                    | APN                                             |
      | //div[@id='NBRecord2_1']//table[@class='NBDetail']//tr[4]/td[2]/strong                    | Alternate APN                                   |
      | //div[@id='NBRecord2_1']//table[@class='NBDetail']//tr[5]/td[1]/strong                    | School District                                 |
      | //div[@id='NBRecord2_1']//table[@class='NBDetail']//tr[6]/td[1]/strong                    | Legal Desc                                      |
#Nearby_Sales-FORECLOSURE/BANK_OWNED/SHORT_SALE_Sales_History
      | //div[@id='NBRecord2_1']//table[@class='NBHistory data']//tr[1]/td[1]                     | Sales History                                   |
      | //div[@id='NBRecord2_1']//table[@class='NBHistory data']//tr[2]/td[1]                     | Sale/ Recording Date                            |
      | //div[@id='NBRecord2_1']//table[@class='NBHistory data']//tr[2]/td[2]                     | Transaction                                     |
      | //div[@id='NBRecord2_1']//table[@class='NBHistory data']//tr[2]/td[3]                     | Value                                           |
      | //div[@id='NBRecord2_1']//table[@class='NBHistory data']//tr[2]/td[4]                     | 1st Loan                                        |
      | //div[@id='NBRecord2_1']//table[@class='NBHistory data']//tr[2]/td[5]                     | Deed                                            |
      | //div[@id='NBRecord2_1']//table[@class='NBHistory data']//tr[2]/td[6]                     | Buyer/2nd Buyer                                 |
      | //div[@id='NBRecord2_1']//table[@class='NBHistory data']//tr[2]/td[7]                     | Seller/2nd Seller                               |
    And the HTML response has ON-CLICK elements in each XPath that end with the expected content
      | XPath                                                                 | expected                                           |
      | //div[@id='lsfm_distressed_nearby_sales']//a[contains(text(),'RSFR')] | /PCFRSWebElements/html/RiPTCodeValue.HTML#use_code |

  @nearby_properties_review
  @closest_property_records
  @MADLRVP-9297
  Scenario: [MADLRVP-9297] Verify LSRM HTML - PROPERTY DETAIL - NEARBY PROPERTIES REVIEW - CLOSEST PROPERTY RECORDS
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9297.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                        | expected                 |
      | //table[@class='data closest']/..//b         | CLOSEST PROPERTY RECORDS |
      | //table[@class='data closest']//tr[1]/td[2]  | Distance in Miles        |
      | //table[@class='data closest']//tr[1]/td[3]  | Address                  |
      | //table[@class='data closest']//tr[1]/td[4]  | Land Use                 |
      | //table[@class='data closest']//tr[1]/td[5]  | Lot Sq Ft                |
      | //table[@class='data closest']//tr[1]/td[6]  | Living Sq Ft             |
      | //table[@class='data closest']//tr[1]/td[7]  | Sale Year                |
      | //table[@class='data closest']//tr[1]/td[8]  | Sale Price               |
      | //table[@class='data closest']//tr[1]/td[9]  | Assessed Value           |
      | //table[@class='data closest']//tr[1]/td[10] | Bed / Bath               |
      | //table[@class='data closest']//tr[1]/td[11] | Total Rooms              |
      | //table[@class='data closest']//tr[1]/td[12] | Year Built               |
      | //table[@class='data closest']//tr[1]/td[13] | Map Code                 |



