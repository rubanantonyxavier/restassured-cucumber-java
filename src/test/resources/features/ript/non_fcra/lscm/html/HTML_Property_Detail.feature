@api
@non_fcra
@lscm
@html
@property
@detail
Feature: LSCM HTML Property Detail Section

  @MADLRVP-14167
    @market_analysis
  Scenario Outline: [MADLRVP-14167] Verify LSCM HTML - PROPERTY DETAIL - Market Analysis
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14167.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                               | expected                         |
      | (//div [@id='propertyDetail']//table[@class='subSectionHeader'])[1] | MARKET ANALYSIS                  |
      | <table_xpath>//tr[1]/td[1]/b                                        | Nearby Sales :                   |
      | <table_xpath>//tr[1]/td[2]                                          | [NOT EMPTY]                      |
      | <table_xpath>//tr[1]/td[3]/b                                        | Reported Appraised Value:        |
      | <table_xpath>//tr[1]/td[4]                                          | [NOT EMPTY]                      |
      | <table_xpath>//tr[1]/td[5]/b                                        | Rural Flag:                      |
      | <table_xpath>//tr[1]/td[6]                                          | [NOT EMPTY]                      |
      | <table_xpath>//tr[2]/td[1]/b                                        | Max Distance:                    |
      | <table_xpath>//tr[2]/td[2]                                          | [MATCH --> [\d\.]+ Miles]        |
      | <table_xpath>//tr[2]/td[3]/b                                        | Nearby Sales High Value:         |
      | <table_xpath>//tr[2]/td[4]                                          | [MATCH --> \$[\d,]+]             |
      | <table_xpath>//tr[2]/td[5]/b                                        | Mobile Home:                     |
      | <table_xpath>//tr[3]/td[1]/b                                        | Average Distance:                |
      | <table_xpath>//tr[3]/td[2]                                          | [MATCH --> [\d\.]+ Miles]        |
      | <table_xpath>//tr[3]/td[3]/b                                        | Nearby Sales Average Value:      |
      | <table_xpath>//tr[3]/td[4]                                          | [MATCH --> \$[\d,]+]             |
      | <table_xpath>//tr[4]/td[1]/b                                        | Foreclosure Rate in Past 1 yr:   |
      | <table_xpath>//tr[4]/td[2]                                          | [MATCH --> [\d,\.]+%]            |
      | <table_xpath>//tr[4]/td[3]/b                                        | Nearby Sales Median Value:       |
      | <table_xpath>//tr[4]/td[4]                                          | [MATCH --> \$[\d,]+]             |
      | <table_xpath>//tr[5]/td[1]/b                                        | # of Foreclosures in Past 3 yrs: |
      | <table_xpath>//tr[5]/td[2]                                          | [NOT EMPTY]                      |
      | <table_xpath>//tr[5]/td[3]/b                                        | Nearby Sales Low Value:          |
      | <table_xpath>//tr[5]/td[4]                                          | [MATCH --> \$[\d,]+]             |
      | <table_xpath>//tr[6]/td[1]/b                                        | Foreclosure Rate in Past 3 yrs:  |
      | <table_xpath>//tr[6]/td[2]                                          | [MATCH --> [\d,\.]+%]            |
      | <table_xpath>//tr[6]/td[3]/b                                        | Disaster 1 Date:                 |
      | <table_xpath>//tr[6]/td[4]                                          | [DATE --> MM/dd/yyyy]            |
      | <table_xpath>//tr[7]/td[1]/b                                        | Gain on 3 yr Sale Pairs:         |
      | <table_xpath>//tr[7]/td[2]                                          | [NOT EMPTY]                      |
      | <table_xpath>//tr[7]/td[3]/b                                        | Disaster 1 Type:                 |
      | <table_xpath>//tr[7]/td[4]                                          | [NOT EMPTY]                      |
      | <table_xpath>//tr[8]/td[1]/b                                        | Change in 3 yr Loan Pairs:       |
      | <table_xpath>//tr[8]/td[2]                                          | [NOT EMPTY]                      |
      | <table_xpath>//tr[8]/td[3]/b                                        | Disaster 2 Date:                 |
      | <table_xpath>//tr[9]/td[1]/b                                        | SuperFund Site:                  |
      | <table_xpath>//tr[9]/td[3]/b                                        | Disaster 2 Type:                 |

    Examples:
      | table_xpath                                                                   |
      | (//span[.='MARKET ANALYSIS']/ancestor::td[2]/table[@class='gray_text_table']) |

  @MADLRVP-14168
    @subject_property_analysis
  Scenario Outline: [MADLRVP-14168] Verify LSCM HTML - PROPERTY DETAIL - Subject Property Analysis
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14168.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                               | expected                    |
      | (//div [@id='propertyDetail']//table[@class='subSectionHeader'])[2] | SUBJECT PROPERTY ANALYSIS   |
      | <table_xpath>//tr[1]/td[1]                                          | Foreclosure in Past 3 yrs:  |
      | <table_xpath>//tr[1]/td[2]                                          | [NOT EMPTY]                 |
      | <table_xpath>//tr[1]/td[3]                                          | Last Transfer Date:         |
      | <table_xpath>//tr[1]/td[4]                                          | [DATE --> MM/dd/yyyy]       |
      | <table_xpath>//tr[1]/td[5]/b                                        | Land Use Code:              |
      | <table_xpath>//tr[2]/td[1]                                          | Sale Gain in Past 3 yrs :   |
      | <table_xpath>//tr[2]/td[2]                                          | [NOT EMPTY]                 |
      | <table_xpath>//tr[2]/td[3]                                          | Last Transfer Price:        |
      | <table_xpath>//tr[2]/td[4]                                          | [NOT EMPTY]                 |
      | <table_xpath>//tr[2]/td[5]/b                                        | APN:                        |
      | <table_xpath>//tr[2]/td[5]                                          | [NOT EMPTY]                 |
      | <table_xpath>//tr[3]/td[1]                                          | Loan Change in Past 3 yrs : |
      | <table_xpath>//tr[3]/td[2]                                          | [NOT EMPTY]                 |
      | <table_xpath>//tr[3]/td[3]                                          | Active Notice Of Default:   |
      | <table_xpath>//tr[3]/td[4]                                          | [NOT EMPTY]                 |
      | <table_xpath>//tr[3]/td[5]/b                                        | ALT APN:                    |
      | <table_xpath>//tr[3]/td[5]                                          | [NOT EMPTY]                 |
    And the HTML response has ON-CLICK elements in each XPath that end with the expected content
      | XPath                     | expected                                            |
      | <table_xpath>//tr[1]/td/a | /PCFRSWebElements/html/RiPTCodeValue.HTML#use_code  |
      | <table_xpath>//tr[2]/td/a | /PCFRSWebElements/html/RiPTCodeValue.HTML#sale_code |

    Examples:
      | table_xpath                                                                             |
      | (//span[.='SUBJECT PROPERTY ANALYSIS']/ancestor::td[2]/table[@class='gray_text_table']) |

  @MADLRVP-14169
    @most_recent_mls_listing_information
  Scenario Outline: [MADLRVP-14169] Verify LSCM HTML - PROPERTY DETAIL - Most Recent MLS Listing Information
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14169.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                               | expected                             |
      | (//div [@id='propertyDetail']//table[@class='subSectionHeader'])[3] | MOST RECENT MLS LISTING INFORMATION: |
      | <table_xpath>//tr[1]/td[1]                                          | Amount:                              |
      | <table_xpath>//tr[1]/td[2]                                          | [MATCH --> \$[\d,]+]                 |
      | <table_xpath>//tr[1]/td[3]                                          | Date:                                |
      | <table_xpath>//tr[1]/td[4]                                          | [DATE --> MM/dd/yyyy]                |
      | <table_xpath>//tr[1]/td[5]                                          | Type:                                |
      | <table_xpath>//tr[1]/td[6]                                          | [NOT EMPTY]                          |
      | <table_xpath>//tr[2]/td[1]                                          | Photos:                              |
      | <table_xpath>//tr[2]/td[2]                                          | [MATCH --> [\d]+]                    |
      | <table_xpath>//tr[2]/td[3]                                          | Status:                              |
      | <table_xpath>//tr[2]/td[4]                                          | [NOT EMPTY]                          |
      | <table_xpath>//tr[2]/td[5]                                          | Agent:                               |
      | <table_xpath>//tr[2]/td[6]                                          | [NOT EMPTY]                          |

    Examples:
      | table_xpath                                                                                 |
      | (//b[.='MOST RECENT MLS LISTING INFORMATION:']/ancestor::td[2]//table[@class='mlssection']) |

  @MADLRVP-14170
  @graphs_section
  Scenario: [MADLRVP-14170] Verify LSCM HTML - PROPERTY DETAIL - Graphs section
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14170.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                   | expected                             |
      | (//div[@id='TPSC_MARKET_DETAIL']//b)[1] | 5 YEAR PRICE TREND                   |
      | (//div[@id='TPSC_MARKET_DETAIL']//b)[2] | SALES AND FORECLOSURE ACTIVITY TREND |
    And the HTML response has xpath with GRAPH content
      | XPath                                              | expected  |
      | //div[@id='hpifyt']/div[@class='graph_body']/table | hpi_table |
      | //div[@id='saft']/div                              | saft      |
    And the HTML response has xpath //div[@class='legend'] with value (ignoring newline and spaces)
    """
	This graph illustrates prices for the market surrounding the subject property
	over the course of the last several years, based on closing sale prices.
    """
    And the HTML response has xpath //div[@class='footer']/div[2] with value (ignoring newline and spaces)
    """
	This graph illustrates the number of sales and foreclosures
	over time for the market surrounding the subject property.
    """

  @MADLRVP-14172
  @heat_map
  @area_map
  Scenario: [MADLRVP-14172] Verify LSCM HTML - PROPERTY DETAIL - Heat Map and Area Map
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14172.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                            | expected               |
      | //div[@id='HP_HEAT_MAP']//table[@class='subSectionHeader']//span | HEAT MAP               |
      | //div[@id='HP_AREA_MAP']//table[@class='subSectionHeader']//span | AREA MAP               |
      | //div[@id='HP_AREA_MAP']//div[@class='maplegend']/span[1]        | Subject Property       |
      | //div[@id='HP_AREA_MAP']//div[@class='maplegend']/span[2]        | Full Value             |
      | //div[@id='HP_AREA_MAP']//div[@class='maplegend']/span[3]        | Foreclosure/Bank Owned |
    And the HTML response has xpath //div[@id='HP_HEAT_MAP']//div[@class='maplegend'] with value (ignoring newline and spaces)
    """
    Sixteen shades of Tan-to-Green shading are used to depict values: tan is lower, green is higher.
    """
    And the HTML response has xpath with IMAGE content
      | XPath                                                     | expected                                                                                 |
      | //div[@id='HP_HEAT_MAP']//div[@class='CM_mapBorder']//img | loansafe_full_sale_J.gif                                                                 |
      | //div[@id='HP_AREA_MAP']//div[@class='maplegend']/img[1]  | /PCFRSWebElements/images//letters/subject.gif                                            |
      | //div[@id='HP_AREA_MAP']//div[@class='maplegend']/img[2]  | /PCFRSWebElements/images//ui/collateralManager/full_sale/full_sale_empty.gif             |
      | //div[@id='HP_AREA_MAP']//div[@class='maplegend']/img[3]  | /PCFRSWebElements/images//ui/collateralManager/distressed_sale/distressed_sale_empty.gif |
    And the HTML response has xpath with MAP content
      | XPath                                       | expected |
      | //div[@id='HP_AREA_MAP']//div[@class='map'] | RoadMap  |

  @MADLRVP-14173
    @recent_subject_property_resale_summary
  Scenario Outline: [MADLRVP-14173] Verify LSCM HTML - PROPERTY DETAIL - RECENT SUBJECT PROPERTY RESALE SUMMARY
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14173.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                    | expected                                                              |
      | //div[@id='recentPropertyResale']//*[@class='wide_letter_spacing']//span | RECENT SUBJECT PROPERTY RESALE SUMMARY                                |
      | <table_xpath>//tr[1]/td[2]                                               | Sale Transaction                                                      |
      | <table_xpath>//tr[1]/td[3]                                               | Non-Sale Transaction                                                  |
      | <table_xpath>//tr[2]/td[1]                                               | Transaction within the last 90 days                                   |
      | <table_xpath>//tr[2]/td[2]                                               | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[2]/td[3]                                               | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[3]/td[1]                                               | Transaction within the last 12 months                                 |
      | <table_xpath>//tr[3]/td[2]                                               | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[3]/td[3]                                               | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[4]/td[1]                                               | Last Transaction Date                                                 |
      | <table_xpath>//tr[4]/td[2]                                               | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[4]/td[3]                                               | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[5]/td[1]                                               | Last Transaction Value                                                |
      | <table_xpath>//tr[5]/td[2]                                               | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[5]/td[3]                                               | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[6]/td[1]                                               | Transaction Type                                                      |
      | <table_xpath>//tr[6]/td[2]                                               | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[6]/td[3]                                               | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[7]/td[1]                                               | Deed Type                                                             |
      | <table_xpath>//tr[7]/td[2]                                               | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[7]/td[3]                                               | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[8]/td[1]                                               | Current Reported Appraised Value to Last Sales Price                  |
      | <table_xpath>//tr[8]/td[2]                                               | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[8]/td[3]                                               | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[9]/td[1]                                               | Last Nearby Sales Median Value                                        |
      | <table_xpath>//tr[9]/td[2]                                               | [MATCH --> \$[\d,]+]                                                  |
      | <table_xpath>//tr[9]/td[3]                                               | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[10]/td[1]                                              | Current Nearby Sales Median Value                                     |
      | <table_xpath>//tr[10]/td[2]                                              | [MATCH --> \$[\d,]+]                                                  |
      | <table_xpath>//tr[10]/td[3]                                              | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[11]/td[1]                                              | Last Sales Price to Last Nearby Sales Median Value                    |
      | <table_xpath>//tr[11]/td[2]                                              | [MATCH --> \d{0,2}\.\d{0,2}%]                                         |
      | <table_xpath>//tr[11]/td[3]                                              | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[12]/td[1]                                              | Current Reported Appraised Value to Current Nearby Sales Median Value |
      | <table_xpath>//tr[12]/td[2]                                              | [NOT EMPTY]                                                           |
      | <table_xpath>//tr[12]/td[3]                                              | [NOT EMPTY]                                                           |

    Examples:
      | table_xpath                        |
      | //table[@class='CM_recent_resale'] |

  @MADLRVP-14174
    @subject_property_report
    @first_section
  Scenario Outline: [MADLRVP-14174] Verify LSCM HTML - PROPERTY DETAIL - SUBJECT PROPERTY REPORT - First Subsection
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14174.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                              | expected                |
      | //div[@id='hpsubjectPropertyReport']/div/span/span | SUBJECT PROPERTY REPORT |
      | <table_xpath1>//tr[1]/td[1]/b                      | Site Address:           |
      | <table_xpath1>//tr[1]/td[2]                        | [NOT EMPTY]             |
      | <table_xpath1>//tr[2]/td[1]/b                      | Mail Address:           |
      | <table_xpath1>//tr[2]/td[2]                        | [NOT EMPTY]             |
      | <table_xpath1>//tr[3]/td[1]/b                      | Current Owner:          |
      | <table_xpath1>//tr[3]/td[2]                        | [NOT EMPTY]             |
      | <table_xpath1>//tr[4]/td[1]/b                      | Second Owner:           |
      | <table_xpath1>//tr[4]/td[2]                        | [empty]                 |
      | <table_xpath2>//tr[1]/td[1]/b[1]                   | Last Transfer Date:     |
      | <table_xpath2>//tr[1]/td[1]/b[2]                   | Last Transfer Price:    |
      | <table_xpath2>//tr[1]/td[1]/b[3]                   | Assessed Land:          |
      | <table_xpath2>//tr[1]/td[1]/b[4]                   | Assessed Improvement:   |
      | <table_xpath2>//tr[1]/td[1]/b[5]                   | Assessed Total:         |
      | <table_xpath2>//tr[1]/td[1]/b[6]                   | Assessed Market:        |
      | <table_xpath2>//tr[1]/td[2]/b[1]                   | County:                 |
      | <table_xpath2>//tr[1]/td[2]/b[2]                   | MSA Name:               |
      | <table_xpath2>//tr[1]/td[2]/b[3]                   | MSA Code:               |
      | <table_xpath2>//tr[1]/td[2]/b[4]                   | Census Block:           |
      | <table_xpath2>//tr[1]/td[2]/b[5]                   | School District:        |
      | <table_xpath2>//tr[1]/td[2]/b[6]                   | APN:                    |
      | <table_xpath2>//tr[1]/td[2]/b[7]                   | Alternate APN:          |
      | <table_xpath2>//tr[2]/td[1]/b[1]                   | Legal Desc:             |

    Examples:
      | table_xpath1                                                          | table_xpath2                                  |
      | //div[@id='hpsubjectPropertyReport']//table[@class='gray_text_table'] | //table[@class='gray_text_table grid_2_cell'] |

  @MADLRVP-14175
    @subject_property_report
    @second_section
    @subject_property_details
  Scenario Outline: [MADLRVP-14175] Verify LSRM HTML - PROPERTY DETAIL - SUBJECT PROPERTY REPORT - Second Section: SUBJECT PROPERTY DETAILS
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14175.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                  | expected                                |
#Subject_Property_Details
      | //div[@id='HP_SUBJECT_DETAIL']//table[@class='subSectionHeader']//span | SUBJECT PROPERTY DETAILS                |
      | <spd_table>//tr[1]/td[1]/b                                             | Use Code:                               |
      | <spd_table>//tr[1]/td[2]/b                                             | Building Sq Ft:                         |
      | <spd_table>//tr[1]/td[3]/b                                             | Living Sq Ft:                           |
      | <spd_table>//tr[1]/td[4]/b                                             | $ Per Sq Ft:                            |
      | <spd_table>//tr[2]/td[1]/b                                             | Lot Size:                               |
      | <spd_table>//tr[2]/td[2]/b                                             | Bedrooms:                               |
      | <spd_table>//tr[2]/td[3]/b                                             | Bathrooms:                              |
      | <spd_table>//tr[2]/td[4]/b                                             | Total Rooms:                            |
      | <spd_table>//tr[3]/td[1]/b                                             | View:                                   |
      | <spd_table>//tr[3]/td[2]/b                                             | Improved:                               |
      | <spd_table>//tr[3]/td[3]/b                                             | Heating:                                |
      | <spd_table>//tr[3]/td[4]/b                                             | Cooling:                                |
      | <spd_table>//tr[4]/td[1]/b                                             | Tax Amount:                             |
      | <spd_table>//tr[4]/td[2]/b                                             | Garage :                                |
      | <spd_table>//tr[4]/td[3]/b                                             | Stories:                                |
      | <spd_table>//tr[4]/td[4]/b                                             | Year Built:                             |
      | <spd_table>//tr[5]/td[1]/b                                             | No. of Units:                           |
      | <spd_table>//tr[5]/td[2]/b                                             | Pool:                                   |
      | <spd_table>//tr[5]/td[3]/b                                             | Fireplace:                              |
      | <spd_table>//tr[5]/td[4]/b                                             | Zoning:                                 |
#Subject_Property_Sales_And_Loan_History
      | <spslh_table>//span[@class='wide_letter_spacing']/span                 | SUBJECT PROPERTY SALES AND LOAN HISTORY |
      | <spslh_table>//tr[2]/td[1]                                             | Sale/ Recording Date                    |
      | <spslh_table>//tr[2]/td[2]                                             | Transfer                                |
      | <spslh_table>//tr[2]/td[3]                                             | Value                                   |
      | <spslh_table>//tr[2]/td[4]                                             | 1st Loan/ 2nd Loan                      |
      | <spslh_table>//tr[2]/td[5]                                             | Loan/ Rate                              |
      | <spslh_table>//tr[2]/td[6]                                             | Deed/ (Val. Sale)                       |
      | <spslh_table>//tr[2]/td[7]                                             | Doc. No.                                |
      | <spslh_table>//tr[2]/td[8]                                             | Transactors                             |
    And the HTML response has ON-CLICK elements in each XPath that end with the expected content
      | XPath                                                            | expected                             |
      | <spslh_table>//a[@target='_new'][./span[contains(.,'STNDALNE')]] | /RiPTCodeValue.HTML#TRANSACTION_TYPE |
      | <spslh_table>//a[@target='_new'][./span[contains(.,'SALE')]]     | /RiPTCodeValue.HTML#TRANSACTION_TYPE |
      | <spslh_table>//a[@target='_new'][./span[contains(.,'NONARMSP')]] | /RiPTCodeValue.HTML#TRANSACTION_TYPE |
      | <spslh_table>//a[@target='_new'][contains(.,'FIX')]              | /RiPTCodeValue.HTML#interest_type    |
      | <spslh_table>//a[@target='_new'][contains(.,'VAR')]              | /RiPTCodeValue.HTML#interest_type    |
      | <spslh_table>//a[@target='_new'][contains(.,'REFI')]             | /RiPTCodeValue.HTML#loan_type        |
      | <spslh_table>//a[@target='_new'][contains(.,'REVOLV')]           | /RiPTCodeValue.HTML#loan_type        |
      | <spslh_table>//a[@target='_new'][contains(.,'UNKN')]             | /RiPTCodeValue.HTML#loan_type        |
      | <spslh_table>//a[@target='_new'][contains(.,'TRUST')]            | /RiPTCodeValue.HTML#deed_type        |
      | <spslh_table>//a[@target='_new'][contains(.,'DEED')]             | /RiPTCodeValue.HTML#deed_type        |
      | <spslh_table>//a[@target='_new'][contains(.,'QUIT')]             | /RiPTCodeValue.HTML#deed_type        |
      | <spslh_table>//a[@target='_new'][contains(.,'MORT')]             | /RiPTCodeValue.HTML#deed_type        |
      | <spslh_table>//a[@target='_new'][contains(.,'GRANT')]            | /RiPTCodeValue.HTML#deed_type        |
      | <spslh_table>//a[@target='_new'][contains(.,'(FULL)')]           | /RiPTCodeValue.HTML#sale_code        |

    Examples:
      | spd_table                                     | spslh_table                        |
      | //table[@class='gray_text_table grid_4_cell'] | //table[@class='data loanHistory'] |

  @MADLRVP-14177
  @nearby_properties_review
  @prices_for_nearby_sales
  Scenario: [MADLRVP-14177] Verify LSFM HTML - PROPERTY DETAIL - NEARBY PROPERTIES REVIEW - PRICES FOR NEARBY SALES
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14177.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                   | expected                          |
      | //div[@id='nearbyPropertyReview']/div/span/span                         | NEARBY PROPERTIES REVIEW          |
      | //div[@id='NEARBY_PRICE_GRAPH']//table[@class='subSectionHeader']//span | PRICES FOR NEARBY SALES           |
      | //div[@id='pricegraphlegend']/span[1]                                   | Full Value                        |
      | //div[@id='pricegraphlegend']/span[2]                                   | Foreclosure/Bank Owned/Short Sale |
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
      | XPath                                     | expected                                                                                |
      | //div[@id='pricegraphlegend']/span[1]/img | /PCFRSWebElements/images/ui/collateralManager/full_sale/full_sale_empty.gif             |
      | //div[@id='pricegraphlegend']/span[2]/img | /PCFRSWebElements/images/ui/collateralManager/distressed_sale/distressed_sale_empty.gif |

  @MADLRVP-14178
    @nearby_properties_review
    @nearby_sales
    @summary
  Scenario Outline: [MADLRVP-14178] Verify LSFM HTML - PROPERTY DETAIL - NEARBY PROPERTIES REVIEW - NEARBY SALES SUMMARY
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14178.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                     | expected                                                        |
      | //div[@id='nearby_sales_summary']//table[@class='subSectionHeader']//span | NEARBY SALES: SUMMARY                                           |
      | <table_xpath>//tr[1]/td[2]/b                                              | Full Value                                                      |
      | <table_xpath>//tr[1]/td[3]/b                                              | Short Sale                                                      |
      | <table_xpath>//tr[1]/td[4]/b                                              | Foreclosure / Bank Owned                                        |
      | <table_xpath>//tr[2]/td[1]/b                                              | Property Count                                                  |
      | <table_xpath>//tr[2]/td[2]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[2]/td[3]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[2]/td[4]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[3]/td[1]/b                                              | Minimum Sales Price                                             |
      | <table_xpath>//tr[3]/td[2]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[3]/td[3]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[3]/td[4]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[4]/td[1]/b                                              | Median Sales Price                                              |
      | <table_xpath>//tr[4]/td[2]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[4]/td[3]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[4]/td[4]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[5]/td[1]/b                                              | Maximum Sales Price                                             |
      | <table_xpath>//tr[5]/td[2]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[5]/td[3]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[5]/td[4]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[6]/td[1]/b                                              | # of 3 Year Sales Pairs                                         |
      | <table_xpath>//tr[6]/td[2]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[6]/td[3]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[6]/td[4]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[7]/td[1]/b                                              | # of Sales Pairs with Value Increasing / Average Price Increase |
      | <table_xpath>//tr[7]/td[2]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[7]/td[3]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[7]/td[4]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[8]/td[1]/b                                              | # of Sales Pairs with Value Decreasing / Average Price Decrease |
      | <table_xpath>//tr[8]/td[2]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[8]/td[3]                                                | [NOT EMPTY]                                                     |
      | <table_xpath>//tr[8]/td[4]                                                | [NOT EMPTY]                                                     |

    Examples:
      | table_xpath            |
      | //table[@class='data'] |

  @MADLRVP-14179
    @nearby_properties_review
    @nearby_sales
    @full_value
  Scenario Outline: [MADLRVP-14179] Verify LSFM HTML - PROPERTY DETAIL - NEARBY PROPERTIES REVIEW - NEARBY SALES FULL VALUE
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14179.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                | expected                 |
#Nearby_Sales-Full_Value
      | //div[@id='HP_NEARBY_SALES']//table[@class='subSectionHeader']//span | NEARBY SALES: FULL VALUE |
      | <header_xpath>//td[2]                                                | Miles                    |
      | <header_xpath>//td[3]                                                | Address                  |
      | <header_xpath>//td[4]                                                | Land Use                 |
      | <header_xpath>//td[5]                                                | Sale Date                |
      | <header_xpath>//td[6]                                                | Sale Value               |
      | <header_xpath>//td[8]                                                | Living Sq Ft             |
      | <header_xpath>//td[9]                                                | $/Sq Ft                  |
#Nearby_Sales-Full_Value_Details
      | <details_xpath>//tr[1]/td[1]/strong                                  | Full Address:            |
      | <details_xpath>//tr[2]/td[1]/strong                                  | Zoning                   |
      | <details_xpath>//tr[2]/td[2]/strong                                  | Year Built               |
      | <details_xpath>//tr[2]/td[3]/strong                                  | Bed/Bath                 |
      | <details_xpath>//tr[2]/td[4]/strong                                  | Rooms                    |
      | <details_xpath>//tr[2]/td[5]/strong                                  | Pool                     |
      | <details_xpath>//tr[3]/td[1]/strong                                  | Lot Sq Ft                |
      | <details_xpath>//tr[3]/td[2]/strong                                  | Assessment               |
      | <details_xpath>//tr[3]/td[3]/strong                                  | Number of Units:         |
      | <details_xpath>//tr[4]/td[1]/strong                                  | APN                      |
      | <details_xpath>//tr[4]/td[2]/strong                                  | Alternate APN            |
      | <details_xpath>//tr[5]/td[1]/strong                                  | School District          |
      | <details_xpath>//tr[6]/td[1]/strong                                  | Legal Desc               |
#Nearby_Sales-Full_Value_Sales_History
      | <history_xpath>//tr[1]/td[1]                                         | Sales History            |
      | <history_xpath>//tr[2]/td[1]                                         | Sale/ Recording Date     |
      | <history_xpath>//tr[2]/td[2]                                         | Transaction              |
      | <history_xpath>//tr[2]/td[3]                                         | Value                    |
      | <history_xpath>//tr[2]/td[4]                                         | 1st Loan                 |
      | <history_xpath>//tr[2]/td[5]                                         | Deed                     |
      | <history_xpath>//tr[2]/td[6]                                         | Buyer/2nd Buyer          |
      | <history_xpath>//tr[2]/td[7]                                         | Seller/2nd Seller        |
    And the HTML response has ON-CLICK elements in each XPath that end with the expected content
      | XPath                                     | expected                                           |
      | //tr[@class='NBRow']//a[@style='a:hover'] | /PCFRSWebElements/html/RiPTCodeValue.HTML#use_code |

    Examples:
      | header_xpath                            | details_xpath                                    | history_xpath                                          |
      | //table[@class='data CM_nearby_header'] | //div[@id='NBRecord1']//table[@class='NBDetail'] | //div[@id='NBRecord1']//table[@class='NBHistory data'] |

  @MADLRVP-14180
    @nearby_properties_review
    @nearby_sales
    @foreclosure_bank-owned_short-sale
  Scenario Outline: [MADLRVP-14180] Verify LSFM HTML - PROPERTY DETAIL - NEARBY PROPERTIES REVIEW - NEARBY SALES - FORECLOSURE/BANK-OWNED/SHORT-SALE
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14180.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                        | expected                                        |
#Nearby_Sales-FORECLOSURE/BANK_OWNED/SHORT_SALE
      | //div[@id='distressed_nearby_sales']//table[@class='subSectionHeader']//span | NEARBY SALES: FORECLOSURE/BANK OWNED/SHORT SALE |
      | <short_sale_header>//td[2]                                                   | Miles                                           |
      | <short_sale_header>//td[3]                                                   | Address                                         |
      | <short_sale_header>//td[4]                                                   | Land Use                                        |
      | <short_sale_header>//td[5]                                                   | Sale Date                                       |
      | <short_sale_header>//td[6]                                                   | Sale Value                                      |
      | <short_sale_header>//td[8]                                                   | Living Sq Ft                                    |
      | <short_sale_header>//td[9]                                                   | $/Sq Ft                                         |
#Nearby_Sales-FORECLOSURE/BANK_OWNED/SHORT_SALE_Details
      | <short_sale_details>//tr[1]/td[1]/strong                                     | Full Address:                                   |
      | <short_sale_details>//tr[2]/td[1]/strong                                     | Zoning                                          |
      | <short_sale_details>//tr[2]/td[2]/strong                                     | Year Built                                      |
      | <short_sale_details>//tr[2]/td[3]/strong                                     | Bed/Bath                                        |
      | <short_sale_details>//tr[2]/td[4]/strong                                     | Rooms                                           |
      | <short_sale_details>//tr[2]/td[5]/strong                                     | Pool                                            |
      | <short_sale_details>//tr[3]/td[1]/strong                                     | Lot Sq Ft                                       |
      | <short_sale_details>//tr[3]/td[2]/strong                                     | Assessment                                      |
      | <short_sale_details>//tr[3]/td[3]/strong                                     | Number of Units:                                |
      | <short_sale_details>//tr[4]/td[1]/strong                                     | APN                                             |
      | <short_sale_details>//tr[4]/td[2]/strong                                     | Alternate APN                                   |
      | <short_sale_details>//tr[5]/td[1]/strong                                     | School District                                 |
      | <short_sale_details>//tr[6]/td[1]/strong                                     | Legal Desc                                      |
#Nearby_Sales-FORECLOSURE/BANK_OWNED/SHORT_SALE_Sales_History
      | <history>//tr[1]/td[1]                                                       | Sales History                                   |
      | <history>//tr[2]/td[1]                                                       | Sale/ Recording Date                            |
      | <history>//tr[2]/td[2]                                                       | Transaction                                     |
      | <history>//tr[2]/td[3]                                                       | Value                                           |
      | <history>//tr[2]/td[4]                                                       | 1st Loan                                        |
      | <history>//tr[2]/td[5]                                                       | Deed                                            |
      | <history>//tr[2]/td[6]                                                       | Buyer/2nd Buyer                                 |
      | <history>//tr[2]/td[7]                                                       | Seller/2nd Seller                               |

    Examples:
      | short_sale_header                                                           | short_sale_details                                 | history                                                  |
      | //div[@id='distressed_nearby_sales']//table[@class='data CM_nearby_header'] | //div[@id='NBRecord2_1']//table[@class='NBDetail'] | //div[@id='NBRecord2_1']//table[@class='NBHistory data'] |

  @MADLRVP-14181
    @nearby_properties_review
    @closest_property_records
  Scenario Outline: [MADLRVP-14181] Verify LSFM HTML - PROPERTY DETAIL - NEARBY PROPERTIES REVIEW - CLOSEST PROPERTY RECORDS
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14181.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                    | expected                 |
      | <table_xpath>/preceding-sibling::*//span | CLOSEST PROPERTY RECORDS |
      | <table_xpath>//tr[1]/td[2]               | Distance in Miles        |
      | <table_xpath>//tr[1]/td[3]               | Address                  |
      | <table_xpath>//tr[1]/td[4]               | Land Use                 |
      | <table_xpath>//tr[1]/td[5]               | Lot Sq Ft                |
      | <table_xpath>//tr[1]/td[6]               | Living Sq Ft             |
      | <table_xpath>//tr[1]/td[7]               | Sale Year                |
      | <table_xpath>//tr[1]/td[8]               | Sale Price               |
      | <table_xpath>//tr[1]/td[9]               | Assessed Value           |
      | <table_xpath>//tr[1]/td[10]              | Bed / Bath               |
      | <table_xpath>//tr[1]/td[11]              | Total Rooms              |
      | <table_xpath>//tr[1]/td[12]              | Year Built               |
      | <table_xpath>//tr[1]/td[13]              | Map Code                 |

    Examples:
      | table_xpath                         |
      | //table[@class='data grid_12_cell'] |

  @MADLRVP-14182
    @zip_code_summary
    @market_owner_occupancy_data
  Scenario Outline: [MADLRVP-14182] Verify LSFM HTML - PROPERTY DETAIL - MARKET OWNER OCCUPANCY DATA
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14182.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                  | expected      |
#      First table
      | <section_xpath>//th[1] | Average Value |
      | <section_xpath>//td[1] | [NOT EMPTY]   |
      | <section_xpath>//th[2] | Minimum Value |
      | <section_xpath>//td[2] | [NOT EMPTY]   |
      | <section_xpath>//th[3] | Maximum Value |
      | <section_xpath>//td[3] | [NOT EMPTY]   |
      | <section_xpath>//th[4] | Median Value  |
      | <section_xpath>//td[4] | [NOT EMPTY]   |
#      Second table header left part
      | <second_table>//td[2]  | Miles         |
      | <second_table>//td[3]  | Units         |
      | <second_table>//td[4]  | Own Occ       |
      | <second_table>//td[5]  | Rent Occ      |
      | <second_table>//td[6]  | SFR           |
      | <second_table>//td[7]  | Mult 2-9      |
      | <second_table>//td[8]  | Mult 10+      |
      | <second_table>//td[9]  | Avg Rms       |
      | <second_table>//td[10] | Avg Val       |
#      Second table header right part
      | <second_table>//td[12] | Miles         |
      | <second_table>//td[13] | Units         |
      | <second_table>//td[14] | Own Occ       |
      | <second_table>//td[15] | Rent Occ      |
      | <second_table>//td[16] | SFR           |
      | <second_table>//td[17] | Mult 2-9      |
      | <second_table>//td[18] | Mult 10+      |
      | <second_table>//td[19] | Avg Rms       |
      | <second_table>//td[20] | Avg Val       |

    Examples:
      | section_xpath                                                                     | second_table                                                                                          |
      | //table[@class='borderTable'][.//span[contains(.,'MARKET OWNER OCCUPANCY DATA')]] | //table[@class='borderTable'][.//span[contains(.,'MARKET OWNER OCCUPANCY DATA')]]//tr[@class="row_1"] |

  @buyers_and_sellers
    @MADLRVP-14183
  Scenario Outline: [MADLRVP-14183] Verify LSFM HTML - MARKET DETAIL - ZIP CODE SUMMARY - BUYERS AND SELLERS
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14183.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                        | expected           |
      | <table_xpath>/preceding-sibling::table//span | BUYERS AND SELLERS |
#      Table header
      | <table_xpath>//th[1]                         | Buyer/2nd Buyer    |
      | <table_xpath>//th[2]                         | Seller/2nd Seller  |
      | <table_xpath>//th[3]                         | Lender             |
      | <table_xpath>//th[4]                         | Deed               |
      | <table_xpath>//th[5]                         | Transfer           |
      | <table_xpath>//th[6]                         | Price              |
      | <table_xpath>//th[7]                         | Year               |
      | <table_xpath>//th[8]                         | Map Code           |
#      First row
      | <table_xpath>//tbody/tr[1]                   | [NOT EMPTY]        |

    Examples:
      | table_xpath                               |
      | //table[@class='data buyers_and_sellers'] |