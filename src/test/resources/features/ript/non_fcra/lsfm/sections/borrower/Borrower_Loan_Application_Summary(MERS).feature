@api
@non_fcra
@lsfm
@section
@borrower
@loan_application_summary
@mers
Feature: LSFM - Borrower Section - Loan application summary(MERS)

  @MADLRVP-10777 @dev_only
  Scenario Outline: [MADLRVP-10777] Verify LSFM - MERS - SUCCESS: Validate LoanRegistry data under BorrowerSection (IDP_038)
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/borrower/MADLRVP-10777.xml
    When the request is sent
    Then response content type is XML
    And the response contains xpath
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>'] |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>'] |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>'] |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>'] |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>'] |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>'] |
    And the response has xpath
      | XPath                                                                             | expected                               |
      | //LoanRegistry/@available                                                         | true                                   |
      | //LoanRegistry/@loanRegCount                                                      | 1                                      |
#      1
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@addressReceived            | 4 ADAMS LANE                           |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@cityReceived               | AIRMONT                                |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@stateReceived              | NY                                     |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@zipReceived                | 10901                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@addressStandardizedSuccess | true                                   |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@addressStandardized        | 4 ADAMS LN                             |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@cityStandardized           | AIRMONT                                |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@stateStandardized          | NY                                     |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@zipStandardized            | 10901                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@borrowerFirstName          | NICHA                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@borrowerLastName           | LEBOVITS                               |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@loanAmount                 | 663000                                 |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@noteDate                   | 08/17/2021                             |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@servicer                   | United Wholesale Mortgage, LLC         |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@status                     | Active                                 |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@within120Days              | false                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn1>']/@subjectAddress             | false                                  |
#      2
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@addressReceived            | 1944-46 52ND ST                        |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@cityReceived               | BROOKLYN                               |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@stateReceived              | NY                                     |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@zipReceived                | 11204                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@addressStandardizedSuccess | true                                   |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@addressStandardized        | 1944 52ND ST                           |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@cityStandardized           | BROOKLYN                               |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@stateStandardized          | NY                                     |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@zipStandardized            | 11204                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@borrowerFirstName          | JACOB                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@borrowerLastName           | WERCZBERGER                            |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@loanAmount                 | 730000                                 |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@noteDate                   | 02/01/2021                             |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@servicer                   | The Federal Savings Bank               |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@status                     | Active                                 |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@within120Days              | false                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn2>']/@subjectAddress             | true                                   |
#      3
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@addressReceived            | 290 E VETERANS HWY                     |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@cityReceived               | JACKSON                                |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@stateReceived              | NJ                                     |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@zipReceived                | 08527                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@addressStandardizedSuccess | true                                   |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@addressStandardized        | 290 VETERANS HWY                       |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@cityStandardized           | JACKSON                                |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@stateStandardized          | NJ                                     |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@zipStandardized            | 08527                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@borrowerFirstName          | ISRAEL                                 |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@borrowerLastName           | GOLDBERGER                             |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@loanAmount                 | 305000                                 |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@noteDate                   | 12/14/2020                             |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@servicer                   | Nationstar Mortgage LLC                |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@status                     | Active                                 |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@within120Days              | true                                   |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn3>']/@subjectAddress             | false                                  |
#      4
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@addressReceived            | 290 VETERANS HWY                       |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@cityReceived               | JACKSON                                |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@stateReceived              | NJ                                     |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@zipReceived                | 08527                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@addressStandardizedSuccess | true                                   |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@addressStandardized        | 290 VETERANS HWY                       |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@cityStandardized           | JACKSON                                |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@stateStandardized          | NJ                                     |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@zipStandardized            | 08527                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@borrowerFirstName          | ISRAEL                                 |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@borrowerLastName           | GOLDBERGER                             |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@loanAmount                 | 300000                                 |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@noteDate                   | 08/06/2018                             |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@servicer                   | New Residential Mortgage LLC           |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@status                     | Inactive                               |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@within120Days              | false                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn4>']/@subjectAddress             | false                                  |
#      5
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@addressReceived            | 1944-46 52ND STREET                    |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@cityReceived               | BROOKLYN                               |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@stateReceived              | NY                                     |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@zipReceived                | 11204                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@addressStandardizedSuccess | true                                   |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@addressStandardized        | 1944 52ND ST                           |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@cityStandardized           | BROOKLYN                               |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@stateStandardized          | NY                                     |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@zipStandardized            | 11204                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@borrowerFirstName          | ISRAEL                                 |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@borrowerLastName           | GOLDBERGER                             |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@loanAmount                 | 800000                                 |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@noteDate                   | 09/17/2014                             |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@servicer                   | Fifth Third Bank, National Association |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@status                     | Inactive                               |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@within120Days              | false                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn5>']/@subjectAddress             | true                                   |
#      6
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@addressReceived            | 1944 52ND STREET                       |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@cityReceived               | BROOKLYN                               |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@stateReceived              | NY                                     |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@zipReceived                | 11204                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@addressStandardizedSuccess | true                                   |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@addressStandardized        | 1944 52ND ST                           |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@cityStandardized           | BROOKLYN                               |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@stateStandardized          | NY                                     |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@zipStandardized            | 11204                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@borrowerFirstName          | JACOB                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@borrowerLastName           | WERCZBERGER                            |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@loanAmount                 | 1225000                                |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@noteDate                   | 08/28/2007                             |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@servicer                   | CitiMortgage, Inc.                     |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@status                     | Inactive                               |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@within120Days              | false                                  |
      | //LoanRegistry/LoanRegistryRecord[@minNumber='<mn6>']/@subjectAddress             | false                                  |

    Examples:
      | mn1                | mn2                | mn3                | mn4                | mn5                | mn6                |
      | 100032412218084595 | 101012900005643419 | 101012900005630515 | 100032412181183689 | 100880800060608383 | 100011520045802974 |

  @MADLRVP-10778
  Scenario Outline: [MADLRVP-10778] Verify LSFM - MERS - FAIL: Validate error message under Loan registry (IDP_066)
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/borrower/MADLRVP-10778.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response has xpath
      | XPath                                        | expected     |
      | //BorrowerSection/LoanRegistry/@available    | false        |
      | //BorrowerSection/LoanRegistry/@resultCode   | <resultcode> |
      | //BorrowerSection/LoanRegistry/@loanRegCount | 0            |

  @qa_only
    Examples:
      | resultcode       |
      | INVALID RESPONSE |

  @uat_only
    Examples:
      | resultcode       |
      | INVALID_RESPONSE |


