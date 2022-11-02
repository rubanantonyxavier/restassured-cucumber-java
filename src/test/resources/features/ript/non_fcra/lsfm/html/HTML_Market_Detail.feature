@api
@non_fcra
@lsfm
@html
@market
@detail
Feature: LSFM HTML MARKET DETAIL Section

  @first_section
  @MADLRVP-9162
  Scenario: [MADLRVP-9162] Verify LSFM HTML - MARKET DETAIL - First section
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9162.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with IMAGE content
      | XPath                                                       | expected                                                 |
      | //div[@id='marketDetail']/img[@alt='Market Detail Section'] | /PCFRSWebElements/images/ui/lsfm/market_detail_white.gif |
    And the HTML response has xpath with TEXT content
      | XPath                              | expected                             |
      | //div[@id='TPSC_MARKET_DETAIL']//b | 5 YEAR PRICE TREND                   |
      | //div[@id='saft']//b               | SALES AND FORECLOSURE ACTIVITY TREND |
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

  @zip_code_summary
  @MADLRVP-9163
  Scenario: [MADLRVP-9163] Verify LSFM HTML - MARKET DETAIL - ZIP CODE SUMMARY
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9163.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with IMAGE content
      | XPath                                                       | expected                                                 |
      | //div[@id='marketDetail']/img[@alt='Market Detail Section'] | /PCFRSWebElements/images/ui/lsfm/market_detail_white.gif |
    And the HTML response has xpath with TEXT content
      | XPath                                                             | expected                                                       |
      | //div[@id='ZIPCodeSummary']//span[@class='wide_letter_spacing']/b | ZIP CODE SUMMARY                                               |
      | //div[@id='record_loan_detail']//b                                | RECENT LOAN DETAIL                                             |
      | (//table[@class='data grid_8_cell'])[2]                           | No recent loan detail information available for this property. |

  @zip_code_summary
  @market_owner_occupancy_data
  @MADLRVP-9164
  Scenario: [MADLRVP-9164] Verify LSFM HTML - MARKET DETAIL - ZIP CODE SUMMARY - MARKET OWNER OCCUPANCY DATA
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9164.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with IMAGE content
      | XPath                                                       | expected                                                 |
      | //div[@id='marketDetail']/img[@alt='Market Detail Section'] | /PCFRSWebElements/images/ui/lsfm/market_detail_white.gif |
    And the HTML response has xpath with TEXT content
      | XPath                                                                          | expected                    |
      | //div[@id='ZIPCodeSummary']//span[@class='wide_letter_spacing']/b              | ZIP CODE SUMMARY            |
      | //div[@id='MARKET_OWNER_OCC']//table[@class='subSectionHeader']//b             | MARKET OWNER OCCUPANCY DATA |
#      First table
      | //div[@id='MARKET_OWNER_OCC']//table[@class='own_occ_tabbed_table']//th[1]     | Average Value               |
      | //div[@id='MARKET_OWNER_OCC']//table[@class='own_occ_tabbed_table']//td[1]     | [NOT EMPTY]                 |
      | //div[@id='MARKET_OWNER_OCC']//table[@class='own_occ_tabbed_table']//th[2]     | Minimum Value               |
      | //div[@id='MARKET_OWNER_OCC']//table[@class='own_occ_tabbed_table']//td[2]     | [NOT EMPTY]                 |
      | //div[@id='MARKET_OWNER_OCC']//table[@class='own_occ_tabbed_table']//th[3]     | Maximum Value               |
      | //div[@id='MARKET_OWNER_OCC']//table[@class='own_occ_tabbed_table']//td[3]     | [NOT EMPTY]                 |
      | //div[@id='MARKET_OWNER_OCC']//table[@class='own_occ_tabbed_table']//th[4]     | Median Value                |
      | //div[@id='MARKET_OWNER_OCC']//table[@class='own_occ_tabbed_table']//td[4]     | [NOT EMPTY]                 |
#      Second table header left part
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[2]   | Miles                       |
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[3]   | Units                       |
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[4]   | Own Occ                     |
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[5]   | Rent Occ                    |
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[6]   | SFR                         |
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[7]   | Mult 2-9                    |
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[8]   | Mult 10+                    |
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[9]   | Avg Rms                     |
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[10]  | Avg Val                     |
#      Second table header right part
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[12]  | Miles                       |
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[13]  | Units                       |
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[14]  | Own Occ                     |
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[15]  | Rent Occ                    |
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[16]  | SFR                         |
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[17]  | Mult 2-9                    |
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[18]  | Mult 10+                    |
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[19]  | Avg Rms                     |
      | //table[@class='own_occ_data_listed_by_distance']//tr[@class='row_1']//td[20]  | Avg Val                     |
#      First row
      | //table[@class='own_occ_data_listed_by_distance']//tr[@style='cursor:default'] | [NOT EMPTY]                 |

  @zip_code_summary
  @buyers_and_sellers
  @MADLRVP-9166
  Scenario: [MADLRVP-9166] Verify LSFM HTML - MARKET DETAIL - ZIP CODE SUMMARY - BUYERS AND SELLERS
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9166.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with IMAGE content
      | XPath                                                       | expected                                                 |
      | //div[@id='marketDetail']/img[@alt='Market Detail Section'] | /PCFRSWebElements/images/ui/lsfm/market_detail_white.gif |
    And the HTML response has xpath with TEXT content
      | XPath                                                                | expected           |
      | //div[@id='ZIPCodeSummary']//span[@class='wide_letter_spacing']/b    | ZIP CODE SUMMARY   |
      | //div[@id='BUYERS_AND_SELLERS']//table[@class='subSectionHeader']//b | BUYERS AND SELLERS |
#      Table header
      | //table[@class='buyers_and_sellers']//th[1]                          | Buyer/2nd Buyer    |
      | //table[@class='buyers_and_sellers']//th[2]                          | Seller/2nd Seller  |
      | //table[@class='buyers_and_sellers']//th[3]                          | Lender             |
      | //table[@class='buyers_and_sellers']//th[4]                          | Deed               |
      | //table[@class='buyers_and_sellers']//th[5]                          | Transfer           |
      | //table[@class='buyers_and_sellers']//th[6]                          | Price              |
      | //table[@class='buyers_and_sellers']//th[7]                          | Year               |
      | //table[@class='buyers_and_sellers']//th[8]                          | Map Code           |
#      First row
      | //table[@class='buyers_and_sellers']//tbody/tr[1]                    | [NOT EMPTY]        |
