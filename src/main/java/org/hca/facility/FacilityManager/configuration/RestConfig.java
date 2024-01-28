package org.hca.facility.FacilityManager.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class RestConfig {

    @Bean("cloudRestTemplate")
    public RestTemplate getCloudTemplate(){
        return new RestTemplate();
    }
}
