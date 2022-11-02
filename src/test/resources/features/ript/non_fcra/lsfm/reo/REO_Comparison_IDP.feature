@api
@non_fcra
@lsfm
@reo
@idp
Feature: LSFM REO Comparison IDP Alert

  @IDP_068
  Scenario Outline: [IDP_068] LSFM REO Comparison
  REO Comparison - Validate REO data.
    Given the request XML filepath is /ript/non_fcra/lsfm/reo/<alert_id>_reo.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReoComparisonSummary/ReoComparisonEntry |
    And the response has xpath
      | XPath                                                                             | expected                 |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@borrowerNumber                   | 0                        |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@borrowerName                     | Jenkins, Warren Kenneth  |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@inputAddress                     | [empty]                  |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@inputCityStateZip                | [empty]                  |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@standardizedInputAddress         | [empty]                  |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@standardizedOnFileAddress        | 1368 WILL VANNOY RD      |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@standardizedOnFileCityStateZip   | WEST JEFFERSON, NC 28694 |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@matchResult                      | REVIEW_RECOMMENDED       |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@isInputAddressPreviouslyOwned    | false                    |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@isInputAddressPreviouslyOccupied | false                    |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@isStandardizationError           | false                    |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@status                           | attention                |

    Examples:
      | alert_id |
      | IDP_068  |

  @IDP_069
  Scenario Outline: [IDP_069] LSFM REO Comparison
  REO Comparison - Validate REO data.
    Given the request XML filepath is /ript/non_fcra/lsfm/reo/<alert_id>_reo.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReoComparisonSummary/ReoComparisonEntry |
    And the response has xpath
      | XPath                                                                             | expected              |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@borrowerNumber                   | 0                     |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@borrowerName                     | GOLDOVA, HASAN        |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@inputAddress                     | PO BOX 112            |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@inputCityStateZip                | Mc Allister, MT 59740 |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@standardizedInputAddress         | 112 PO BOX            |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@standardizedInputCityStateZip    | MC ALLISTER, MT 59740 |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@standardizedOnFileAddress        | [empty]               |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@standardizedOnFileCityStateZip   | [empty]               |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@matchResult                      | REVIEW_RECOMMENDED    |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@isInputAddressPreviouslyOwned    | false                 |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@isInputAddressPreviouslyOccupied | false                 |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@isStandardizationError           | false                 |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@status                           | attention             |

    Examples:
      | alert_id |
      | IDP_069  |

  @IDP_071
  Scenario Outline: [IDP_071] LSFM REO Comparison
  REO Comparison - Validate REO data.
    Given the request XML filepath is /ript/non_fcra/lsfm/reo/<alert_id>_reo.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReoComparisonSummary/ReoComparisonEntry |
    And the response has xpath
      | XPath                                                                             | expected          |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@borrowerNumber                   | 0                 |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@borrowerName                     | Ricker, Craig D   |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@inputAddress                     | 6720 Manor Crest  |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@inputCityStateZip                | Oakland, CA 94618 |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@standardizedInputAddress         | 6720 MANOR CRST   |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@standardizedInputCityStateZip    | OAKLAND, CA 94618 |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@standardizedOnFileAddress        | 6720 MANOR CRST   |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@standardizedOnFileCityStateZip   | OAKLAND, CA 94618 |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@matchResult                      | MATCHED           |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@isInputAddressPreviouslyOwned    | true              |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@isInputAddressPreviouslyOccupied | false             |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@isStandardizationError           | false             |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@status                           | attention         |

    Examples:
      | alert_id |
      | IDP_071  |

  @IDP_072
  Scenario Outline: [IDP_072] LSFM REO Comparison
  REO Comparison - Validate REO data.
    Given the request XML filepath is /ript/non_fcra/lsfm/reo/<alert_id>_reo.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReoComparisonSummary/ReoComparisonEntry |
    And the response has xpath
      | XPath                                                                             | expected                |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@borrowerNumber                   | 0                       |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@borrowerName                     | GOLDOVA, HASAN          |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@inputAddress                     | 300 HOT SPRINGS RD      |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@inputCityStateZip                | Santa Barbara, CA 93108 |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@standardizedInputAddress         | 300 HOT SPRINGS RD      |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@standardizedInputCityStateZip    | SANTA BARBARA, CA 93108 |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@standardizedOnFileAddress        | 300 HOT SPRINGS RD      |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@standardizedOnFileCityStateZip   | SANTA BARBARA, CA 93108 |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@matchResult                      | MATCHED                 |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@isInputAddressPreviouslyOwned    | false                   |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@isInputAddressPreviouslyOccupied | true                    |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@isStandardizationError           | false                   |
      | //ReoComparisonEntry[@alertsFired='<alert_id>']/@status                           | attention               |

    Examples:
      | alert_id |
      | IDP_072  |

  @IDP_073
  Scenario Outline: [IDP_073] LSFM REO Comparison
  REO Comparison - Validate REO data.
    Given the request XML filepath is /ript/non_fcra/lsfm/reo/<alert_id>_reo.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReoComparisonSummary/ReoComparisonEntry |
    And the response has xpath
      | XPath                                                                                        | expected        |
      | //ReoComparisonEntry[contains(@alertsFired, '<alert_id>')]/@borrowerNumber                   | 0               |
      | //ReoComparisonEntry[contains(@alertsFired, '<alert_id>')]/@borrowerName                     | Skoch, Philip L |
      | //ReoComparisonEntry[contains(@alertsFired, '<alert_id>')]/@inputAddress                     | 1723 E 31st     |
      | //ReoComparisonEntry[contains(@alertsFired, '<alert_id>')]/@inputCityStateZip                | Tulsa, OK 74105 |
      | //ReoComparisonEntry[contains(@alertsFired, '<alert_id>')]/@standardizedInputAddress         | 1723 E 31ST ST  |
      | //ReoComparisonEntry[contains(@alertsFired, '<alert_id>')]/@standardizedInputCityStateZip    | TULSA, OK 74105 |
      | //ReoComparisonEntry[contains(@alertsFired, '<alert_id>')]/@standardizedOnFileAddress        | 1723 E 31ST ST  |
      | //ReoComparisonEntry[contains(@alertsFired, '<alert_id>')]/@standardizedOnFileCityStateZip   | TULSA, OK 74105 |
      | //ReoComparisonEntry[contains(@alertsFired, '<alert_id>')]/@matchResult                      | MATCHED         |
      | //ReoComparisonEntry[contains(@alertsFired, '<alert_id>')]/@isInputAddressPreviouslyOwned    | true            |
      | //ReoComparisonEntry[contains(@alertsFired, '<alert_id>')]/@isInputAddressPreviouslyOccupied | false           |
      | //ReoComparisonEntry[contains(@alertsFired, '<alert_id>')]/@isStandardizationError           | false           |
      | //ReoComparisonEntry[contains(@alertsFired, '<alert_id>')]/@status                           | attention       |

    Examples:
      | alert_id |
      | IDP_073  |

