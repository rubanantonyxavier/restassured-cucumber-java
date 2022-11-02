package com.automation.services.step_definitions;

import com.automation.services.configuration.Config;
import com.automation.services.configuration.beans.EnvConfig;
import com.automation.services.utils.FilesUtil;
import com.automation.services.utils.PropertiesFacade;
import io.cucumber.java.AfterAll;
import io.cucumber.java.BeforeAll;
import org.yaml.snakeyaml.Yaml;
import org.yaml.snakeyaml.constructor.Constructor;

import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

public class CucumberHooks {

    @BeforeAll
    public static void beforeAll() {
        loadEnvironmentalConfig();
    }

    @AfterAll
    public static void afterAllTests() throws IOException {
        collectAllureEnvInfo();
    }

    private static void collectAllureEnvInfo() throws IOException {
        PropertiesFacade properties = new PropertiesFacade();
        properties.putIfNotNull("ENV", Config.ENV);
        properties.putIfNotNull("URL", Config.getEnvConfig().getUrls().toString());
        properties.putIfNotNull("BRANCH", Config.BRANCH);
        properties.store(new FileWriter(Config.ALLURE_PROPERTIES_FILENAME), "Execution Details");
    }

    private static void loadEnvironmentalConfig() {
        Path configPath = Paths.get(Config.ENV_CONFIG_LOCATION);
        Constructor constructor = new Constructor(EnvConfig.class);
        Yaml yaml = new Yaml(constructor);
        Config.setEnvConfig(yaml.load(FilesUtil.readFile(configPath.toFile())));
    }
}