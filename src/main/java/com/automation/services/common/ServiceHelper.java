package com.automation.services.common;

import com.automation.services.allure.AllureRestAssuredCustomLogger;
import io.qameta.allure.restassured.AllureRestAssured;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.builder.ResponseSpecBuilder;
import io.restassured.http.ContentType;
import io.restassured.parsing.Parser;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.RequestSpecification;
import io.restassured.specification.ResponseSpecification;
import lombok.experimental.UtilityClass;

import static io.restassured.RestAssured.given;

@UtilityClass
public class ServiceHelper {

    /**
     * Common RequestSpecification for any service
     *
     * @param serviceURL The service URL to send requests to
     * @return RequestSpecification
     */
    public static RequestSpecification serviceRequestSpec(String serviceURL) {
        return new RequestSpecBuilder()
                .setBaseUri(serviceURL)
                .build();
    }

    /**
     * Get the Response by Posting the XML Request
     *
     * @param requestSpecification Request Specification of a Service
     * @param basePath             The endpoint basePath
     * @param xmlBody              XML body as String
     * @return Validatable Response
     */
    public static ValidatableResponse sendValidXMLRequest(RequestSpecification requestSpecification, String basePath, String xmlBody) {
        AllureRestAssured reportLoggingFilter = isXmlOutput(xmlBody)
                ? new AllureRestAssured()
                : new AllureRestAssuredCustomLogger();

        return given()
                .filter(reportLoggingFilter)
                .spec(requestSpecification)
                .basePath(basePath)
                .contentType(ContentType.XML)
                .body(xmlBody)
                .expect().defaultParser(Parser.XML)
                .when()
                .post()
                .then()
                .spec(validResponseSpec());
    }

    /**
     * Defines if a request-body requires XML output.
     *
     * @param body {@link String} representation of request-body.
     * @return true if body requires XML output.
     */
    private static boolean isXmlOutput(String body) {
        return body.contains("outputMode=\"XML\"");
    }

    /**
     * ResponseSpecification for a valid request that returns status code 200
     * and text/xml content-type header
     *
     * @return ResponseSpecification
     */
    private static ResponseSpecification validResponseSpec() {
        return new ResponseSpecBuilder()
                .expectStatusCode(200)
                .build();
    }
}
