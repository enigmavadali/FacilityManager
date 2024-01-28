package org.hca.facility.FacilityManager.util;

import jakarta.annotation.PostConstruct;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hca.facility.FacilityManager.dao.TippersDAO;
import org.hca.facility.FacilityManager.model.Resident;
import org.hca.facility.FacilityManager.model.Sensor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class EntityCache {

    private static final Logger LOGGER = LogManager.getLogger(EntityCache.class);

    @Autowired
    private KafkaMessageUtil kafkaMessageUtil;

    @Autowired
    private TippersDAO tippersDAO;

    private final Map<Integer,String> residentCache = new HashMap<>();

    private final Map<Integer,String> sensorCache = new HashMap<>();

    @PostConstruct
    public void init(){
//        for(int i=1; i<=32; i++) {
//            this.residentCache.put(i, this.kafkaMessageUtil.generateUUID());
//        }
//        for(int i=1; i<=32; i++){
//            LOGGER.info("map for " + i+ " " +this.residentCache.get(i));
//        }
        LOGGER.info("Populating resident cache");
        List<Resident> residents = this.tippersDAO.getAllResidents();
        for(Resident resident: residents){
            this.residentCache.put(resident.getPid(),this.kafkaMessageUtil.generateUUID());
        }
        LOGGER.info("Populating sensor cache");
        List<Sensor> sensors = this.tippersDAO.getAllSensors();
        for(Sensor sensor: sensors){
            this.sensorCache.put(sensor.getSensorId(),this.kafkaMessageUtil.generateUUID());
        }
        LOGGER.info("All caches populated");
    }

    public Map<Integer,String> getResidentCache(){
        return this.residentCache;
    }

    public Map<Integer,String> getSensorCache() { return this.sensorCache; }
}
