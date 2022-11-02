package com.automation.services.api;

import com.automation.services.common.ServiceHelper;
import com.automation.services.configuration.Config;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.RequestSpecification;
import lombok.experimental.UtilityClass;

@UtilityClass
public class C2DServiceHelper {

    public static RequestSpecification c2dServiceRequestSpec() {
        return ServiceHelper.serviceRequestSpec(Config.getEnvConfig().getUrls().getC2d());
    }

    /**
     * Sends a C2D request with XML body and expects a valid response (200 OK)
     *
     * @param xmlBody The XML Request body
     * @param user    The Type of User
     * @return Validatable Response
     */
    public static ValidatableResponse sendValidC2DRequest(String xmlBody, String user) {
        if (user.equals("ORDER")) {
            xmlBody = xmlBody.replace("{{USER_NAME}}", Config.C2D_ORDER_USER).replace("{{USER_PASS}}", Config.C2D_ORDER_PSWD);
        } else if (user.equals("CONTRACT")) {
            xmlBody = xmlBody.replace("{{USER_NAME}}", Config.C2D_CONTRACT_USER).replace("{{USER_PASS}}", Config.C2D_CONTRACT_PSWD);
        } else if (user.equals("CONTRACT2")) {
            xmlBody = xmlBody.replace("{{USER_NAME}}", Config.C2D_CONTRACT2_USER).replace("{{USER_PASS}}", Config.C2D_CONTRACT2_PSWD);
        }
        return ServiceHelper.sendValidXMLRequest(c2dServiceRequestSpec(), "", xmlBody);
    }
}
