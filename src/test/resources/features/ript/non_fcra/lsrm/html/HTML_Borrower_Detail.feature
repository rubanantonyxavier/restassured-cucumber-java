@api
@non_fcra
@lsrm
@html
@borrower
@detail
Feature: LSRM HTML Borrower Detail Section

  @owner_occupancy_analysis
  @MADLRVP-9307
  Scenario: [MADLRVP-9307] Verify LSRM HTML - BORROWER DETAIL - OWNER OCCUPANCY ANALYSIS
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9307.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                     | expected                                      |
      | //div[@id='ownerOccupancy0']/div/span/b                                   | OWNER OCCUPANCY ANALYSIS: GAGLESTON, GAIL     |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccTitle']//b            | OWNER OCCUPANCY                               |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[1]/td[1]/b | Properties Ever Owned:                        |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[1]/td[1]   | [NOT EMPTY]                                   |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[1]/td[2]/b | Properties Currently Owned:                   |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[1]/td[2]   | [NOT EMPTY]                                   |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[1]/td[3]/b | Owner of Subject Property:                    |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[1]/td[3]   | [NOT EMPTY]                                   |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[2]/td[1]/b | Nearby Sales Median Value - Subject Property: |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[2]/td[1]   | [NOT EMPTY]                                   |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[2]/td[2]/b | Sq Footage - Subject Property:                |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[2]/td[2]   | [NOT EMPTY]                                   |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[3]/td[1]/b | Nearby Sales Median Value - Likely Residence: |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[3]/td[1]   | [NOT EMPTY]                                   |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[3]/td[2]/b | Sq Footage - Likely Residence:                |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[3]/td[2]   | [NOT EMPTY]                                   |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[4]/td[1]/b | Value Direction:                              |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[4]/td[1]   | [NOT EMPTY]                                   |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[4]/td[2]/b | Square Footage Direction:                     |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[4]/td[2]   | [NOT EMPTY]                                   |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[5]/td[1]/b | Value Shift:                                  |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[5]/td[1]   | [NOT EMPTY]                                   |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[5]/td[2]/b | Square Footage Shift:                         |
      | //div[@id='ownerOccupancy0']//table[@class='ownerOccData']//tr[5]/td[2]   | [NOT EMPTY]                                   |

  @address_summary
  @MADLRVP-9308
  Scenario: [MADLRVP-9308] Verify LSRM HTML - BORROWER DETAIL - ADDRESS SUMMARY
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9308.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                                     | expected                          |
#address_summary
      | //div[@id='ipAddressReport0']/div/span/b                                                  | ADDRESS SUMMARY: Castillo, Mary   |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/table[@class='ASHeader']//td[2]                  | Subject Property                  |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/table[@class='ASSummary']//td[2]/text()          | [NOT EMPTY]                       |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/table[@class='ASHeader']//td[3]                  | Land Use                          |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/table[@class='ASSummary']//td[3]/a               | [NOT EMPTY]                       |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/table[@class='ASHeader']//td[4]                  | Owner                             |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/table[@class='ASSummary']//td[4]/text()[1]       | [NOT EMPTY]                       |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/table[@class='ASHeader']//td[5]                  | Date Reported                     |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/table[@class='ASSummary']//td[5]                 | [NOT EMPTY]                       |
#address_summary_information
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASAddressInfo']//tr[1]/td[1]/b    | Mail Address:                     |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASAddressInfo']//tr[1]/td[1]      | [NOT EMPTY]                       |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASAddressInfo']//tr[1]/td[2]/b[1] | Owner Name:                       |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASAddressInfo']//tr[1]/td[2]      | [NOT EMPTY]                       |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASAddressInfo']//tr[1]/td[2]/b[2] | Second Owner:                     |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASAddressInfo']//tr[2]/td[1]/b    | Sq Ft:                            |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASAddressInfo']//tr[2]/td[1]      | [NOT EMPTY]                       |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASAddressInfo']//tr[2]/td[2]/b    | Median Value:                     |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASAddressInfo']//tr[2]/td[2]      | [NOT EMPTY]                       |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASAddressInfo']//tr[3]/td[1]/b    | Parcel:                           |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASAddressInfo']//tr[3]/td[1]      | [NOT EMPTY]                       |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASAddressInfo']//tr[3]/td[2]/b    | Alternate Parcel:                 |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASAddressInfo']//tr[3]/td[2]      | [NOT EMPTY]                       |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASAddressInfo']//tr[4]/td[1]/b    | Tax Amount:                       |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASAddressInfo']//tr[4]/td[1]      | [NOT EMPTY]                       |
#address_summary_sale_history
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASHistoryHeader']//b              | SALE HISTORY                      |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASHistoryHeader']//tr[2]/td[1]    | Date                              |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASHistoryHeader']//tr[2]/td[2]    | Transfer                          |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASHistoryHeader']//tr[2]/td[3]    | Value                             |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASHistoryHeader']//tr[2]/td[4]    | Loan                              |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASHistoryHeader']//tr[2]/td[5]    | Buyer                             |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']//table[@class='ASHistoryHeader']//tr[2]/td[6]    | Seller                            |
#address_for_best_match_identity
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/../table[@class='subSectionHeader']//b           | ADDRESSES FOR BEST MATCH IDENTITY |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/../table[@class='ASHeader']//td[2]               | Site Address                      |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/../table[@class='ASSummary']//td[2]              | [NOT EMPTY]                       |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/../table[@class='ASHeader']//td[3]               | Land Use                          |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/../table[@class='ASSummary']//td[3]/a            | [NOT EMPTY]                       |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/../table[@class='ASHeader']//td[4]               | Ownership                         |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/../table[@class='ASSummary']//td[4]              | [NOT EMPTY]                       |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/../table[@class='ASHeader']//td[5]               | Date Reported                     |
      | //div[@id='ALERT_IDP_ADDRESS_SUMMARY_0']/../table[@class='ASSummary']//td[5]              | [NOT EMPTY]                       |
#address_for_best_match_identity_information
      | //div[@id='ASRecord01']//table[@class='ASAddressInfo']//tr[1]/td[1]/b                     | Mail Address:                     |
      | //div[@id='ASRecord01']//table[@class='ASAddressInfo']//tr[1]/td[1]                       | [NOT EMPTY]                       |
      | //div[@id='ASRecord01']//table[@class='ASAddressInfo']//tr[1]/td[2]/b[1]                  | Owner Name:                       |
      | //div[@id='ASRecord01']//table[@class='ASAddressInfo']//tr[1]/td[2]                       | [NOT EMPTY]                       |
      | //div[@id='ASRecord01']//table[@class='ASAddressInfo']//tr[1]/td[2]/b[2]                  | Second Owner:                     |
      | //div[@id='ASRecord01']//table[@class='ASAddressInfo']//tr[2]/td[1]/b                     | Sq Ft:                            |
      | //div[@id='ASRecord01']//table[@class='ASAddressInfo']//tr[2]/td[1]                       | [NOT EMPTY]                       |
      | //div[@id='ASRecord01']//table[@class='ASAddressInfo']//tr[2]/td[2]/b                     | Median Value:                     |
      | //div[@id='ASRecord01']//table[@class='ASAddressInfo']//tr[2]/td[2]                       | [NOT EMPTY]                       |
      | //div[@id='ASRecord01']//table[@class='ASAddressInfo']//tr[3]/td[1]/b                     | Parcel:                           |
      | //div[@id='ASRecord01']//table[@class='ASAddressInfo']//tr[3]/td[1]                       | [NOT EMPTY]                       |
      | //div[@id='ASRecord01']//table[@class='ASAddressInfo']//tr[3]/td[2]/b                     | Alternate Parcel:                 |
      | //div[@id='ASRecord01']//table[@class='ASAddressInfo']//tr[3]/td[2]                       | [NOT EMPTY]                       |
      | //div[@id='ASRecord01']//table[@class='ASAddressInfo']//tr[4]/td[1]/b                     | Tax Amount:                       |
      | //div[@id='ASRecord01']//table[@class='ASAddressInfo']//tr[4]/td[1]                       | [NOT EMPTY]                       |
#address_for_best_match_identity_sale_history
      | //div[@id='ASRecord01']//table[@class='ASHistoryHeader']//b                               | SALE HISTORY                      |
      | //div[@id='ASRecord01']//table[@class='ASHistoryHeader']//tr[2]/td[1]                     | Date                              |
      | //div[@id='ASRecord01']//table[@class='ASHistoryHeader']//tr[2]/td[2]                     | Transfer                          |
      | //div[@id='ASRecord01']//table[@class='ASHistoryHeader']//tr[2]/td[3]                     | Value                             |
      | //div[@id='ASRecord01']//table[@class='ASHistoryHeader']//tr[2]/td[4]                     | Loan                              |
      | //div[@id='ASRecord01']//table[@class='ASHistoryHeader']//tr[2]/td[5]                     | Buyer                             |
      | //div[@id='ASRecord01']//table[@class='ASHistoryHeader']//tr[2]/td[6]                     | Seller                            |
