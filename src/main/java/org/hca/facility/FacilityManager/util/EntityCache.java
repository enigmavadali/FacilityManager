package org.hca.facility.FacilityManager.util;

import jakarta.annotation.PostConstruct;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class EntityCache {

    private static final Logger LOGGER = LogManager.getLogger(EntityCache.class);

    @Autowired
    private KafkaMessageUtil kafkaMessageUtil;

    private final Map<Integer,String> residentCache = new HashMap<>();

    @PostConstruct
    public void init(){
        for(int i=1; i<=32; i++) {
            this.residentCache.put(i, this.kafkaMessageUtil.generateUUID());
        }
//        for(int i=1; i<=32; i++){
//            LOGGER.info("map for " + i+ " " +this.residentCache.get(i));
//        }
    }

    public Map<Integer,String> getResidentCache(){
        return this.residentCache;
    }
}
