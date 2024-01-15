package org.hca.facility.FacilityManager.util;

import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class KafkaMessageUtil {

    public String generateUUID(){
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }
}
