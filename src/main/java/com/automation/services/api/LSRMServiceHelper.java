package com.automation.services.api;

import com.automation.services.configuration.Config;
import com.automation.services.common.ServiceHelper;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.RequestSpecification;
import lombok.experimental.UtilityClass;

@UtilityClass
public class LSRMServiceHelper {

    public static RequestSpecification lsrmServiceRequestSpec(String url) {
        return ServiceHelper.serviceRequestSpec(url);
    }

    /**
     * Sends a LSRM request with XML body and expects a valid response (200 OK)
     *
     * @param basePath The endpoint basePath
     * @param xmlBody  The XML Request body
     * @return Validatable Response
     */
    public static ValidatableResponse sendValidLSRMRequest(String basePath, String xmlBody) {
        return ServiceHelper.sendValidXMLRequest(
                lsrmServiceRequestSpec(Config.getEnvConfig().getUrls().getLsrm()),
                basePath,
                xmlBody);
    }

    /**
     * Sends a LSRM FCRA request with XML body and expects a valid response (200 OK)
     *
     * @param basePath The endpoint basePath
     * @param xmlBody  The XML Request body
     * @return Validatable Response
     */
    public static ValidatableResponse sendValidLsrmFcraRequest(String basePath, String xmlBody) {
        return ServiceHelper.sendValidXMLRequest(
                lsrmServiceRequestSpec(Config.getEnvConfig().getUrls().getLsrmFcra()),
                basePath,
                xmlBody);
    }
}