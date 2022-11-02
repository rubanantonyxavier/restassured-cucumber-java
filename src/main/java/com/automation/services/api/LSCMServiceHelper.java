package com.automation.services.api;

import com.automation.services.common.ServiceHelper;
import com.automation.services.configuration.Config;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.RequestSpecification;
import lombok.experimental.UtilityClass;

@UtilityClass
public class LSCMServiceHelper {

    public static RequestSpecification lscmServiceRequestSpec(String url) {
        return ServiceHelper.serviceRequestSpec(url);
    }

    /**
     * Sends a LSCM request with XML body and expects a valid response (200 OK)
     *
     * @param basePath The endpoint basePath
     * @param xmlBody  The XML Request body
     * @return Validatable Response
     */
    public static ValidatableResponse sendValidLscmRequest(String basePath, String xmlBody) {
        return ServiceHelper.sendValidXMLRequest(
                lscmServiceRequestSpec(Config.getEnvConfig().getUrls().getLscm()),
                basePath,
                xmlBody);
    }

    /**
     * Sends a LSCM FCRA request with XML body and expects a valid response (200 OK)
     *
     * @param basePath The endpoint basePath
     * @param xmlBody  The XML Request body
     * @return Validatable Response
     */
    public static ValidatableResponse sendValidLscmFcraRequest(String basePath, String xmlBody) {
        return ServiceHelper.sendValidXMLRequest(
                lscmServiceRequestSpec(Config.getEnvConfig().getUrls().getLscmFcra()),
                basePath,
                xmlBody);
    }
}