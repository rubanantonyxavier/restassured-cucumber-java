package com.automation.services.api;

import com.automation.services.configuration.Config;
import com.automation.services.common.ServiceHelper;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.RequestSpecification;
import lombok.experimental.UtilityClass;

@UtilityClass
public class LSFMServiceHelper {

    public static RequestSpecification lsfmServiceRequestSpec(String url) {
        return ServiceHelper.serviceRequestSpec(url);
    }

    /**
     * Sends a LSFM request with XML body and expects a valid response (200 OK)
     *
     * @param basePath The endpoint basePath
     * @param xmlBody  The XML Request body
     * @return Validatable Response
     */
    public static ValidatableResponse sendValidLSFMRequest(String basePath, String xmlBody) {
        return ServiceHelper.sendValidXMLRequest(
                lsfmServiceRequestSpec(Config.getEnvConfig().getUrls().getLsfm()),
                basePath,
                xmlBody);
    }

    /**
     * Sends a LSFM FCRA request with XML body and expects a valid response (200 OK)
     *
     * @param basePath The endpoint basePath
     * @param xmlBody  The XML Request body
     * @return Validatable Response
     */
    public static ValidatableResponse sendValidLsfmFcraRequest(String basePath, String xmlBody) {
        return ServiceHelper.sendValidXMLRequest(lsfmServiceRequestSpec(Config.getEnvConfig().getUrls().getLsfmFcra()), basePath, xmlBody);
    }
}