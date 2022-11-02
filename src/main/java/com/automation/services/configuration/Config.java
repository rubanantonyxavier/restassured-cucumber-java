package com.automation.services.configuration;

import com.automation.services.configuration.beans.EnvConfig;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.UtilityClass;

@UtilityClass
public class Config {
    public final String ALLURE_PROPERTIES_FILENAME = "build/allure-results/environment.properties";
    public final String SCREENSHOT_PATH = System.getProperty("user.dir") + "/screenshot";
    public final String REPORT_PATH = "report";
    public final String ENV = System.getenv("ENV") != null
            ? System.getenv("ENV")
            : "QA";
    public final String ENV_CONFIG_LOCATION = "src/main/resources/config-%s.yaml".formatted(ENV.toLowerCase());
    public final String BRANCH = System.getenv("BRANCH") != null
            ? System.getenv("BRANCH")
            : "master";
    public final String C2D_ORDER_USER = System.getenv("C2D_ORDER_USER");
    public final String C2D_ORDER_PSWD = System.getenv("C2D_ORDER_PSWD");
    public final String C2D_CONTRACT_USER = System.getenv("C2D_CONTRACT_USER");
    public final String C2D_CONTRACT_PSWD = System.getenv("C2D_CONTRACT_PSWD");
    public final String C2D_CONTRACT2_USER = System.getenv("C2D_CONTRACT2_USER");
    public final String C2D_CONTRACT2_PSWD = System.getenv("C2D_CONTRACT2_PSWD");
    private @Getter @Setter EnvConfig envConfig;
}