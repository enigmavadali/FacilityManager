package org.hca.facility.FacilityManager;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class FacilityManagerApplication {

	private static final Logger LOGGER = LogManager.getLogger(FacilityManagerApplication.class);

	public static void main(String[] args) {
		SpringApplication.run(FacilityManagerApplication.class, args);
	}

}
