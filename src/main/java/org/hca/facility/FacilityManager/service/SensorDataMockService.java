package org.hca.facility.FacilityManager.service;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hca.facility.FacilityManager.model.Sensor;
import org.hca.facility.FacilityManager.model.SensorData;
import org.hca.facility.FacilityManager.util.EntityCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.concurrent.ThreadLocalRandom;

@Service
public class SensorDataMockService {

    private static final Logger LOGGER = LogManager.getLogger(SensorDataMockService.class);

    @Autowired
    private EntityCache entityCache;

    @Autowired
    private KafkaPublisherService kafkaPublisherService;

    @Value("${sensor.topic}")
    private String sensorTopic;

    static boolean runScheduler = false;

    @Scheduled(fixedRate = 10*1000)
    public void sendSensorMessages(){
        Sensor s1 = new Sensor(1,"Blood Pressure",1);
        Sensor s2 = new Sensor(2,"Blood Pressure",5);
        if(runScheduler){
            SensorData sd1 = new SensorData();
            SensorData sd2 = new SensorData();
            sd1.setSensor(s1);
            sd2.setSensor(s2);
            sd1.setTimestamp(Instant.now());
            sd2.setTimestamp(Instant.now());
            LOGGER.info("Sending sensor data to topic");
            this.kafkaPublisherService.sendMessageToTopic(sd1,this.sensorTopic,this.entityCache.getSensorCache().get(sd1.getSensor().getSensorId()));
            this.kafkaPublisherService.sendMessageToTopic(sd2,this.sensorTopic,this.entityCache.getSensorCache().get(sd2.getSensor().getSensorId()));
        }
    }

    public void stopScheduler(){
        runScheduler = false;
    }

    public void startScheduler(){
        runScheduler = true;
    }

    private int genSmallValues(int value){
        return value + ThreadLocalRandom.current().nextInt(2, 5);
    }

}
