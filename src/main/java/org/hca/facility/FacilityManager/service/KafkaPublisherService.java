package org.hca.facility.FacilityManager.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hca.common.domain.KafkaMessage;
import org.hca.common.domain.KafkaMessageMetadata;
import org.hca.common.domain.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

@Service
public class KafkaPublisherService {

    private static final Logger LOGGER = LogManager.getLogger(KafkaPublisherService.class);

    @Autowired
    private KafkaTemplate<String, KafkaMessage> kafkaTemplate;

    @Autowired
    private ObjectMapper objectMapper;

    public void sendMessage(){
        Test t = new Test();
        t.setId(1);
        t.setName("rohit");
        t.setAge(25);
        String jsonString = "";
        try{
            jsonString = this.objectMapper.writeValueAsString(t);
            LOGGER.info("converted json"+jsonString);
        } catch(Exception e){
            LOGGER.error("error",e);
        }

        KafkaMessageMetadata metadata = new KafkaMessageMetadata();
        metadata.setFacilityId("1");
        metadata.setFacilityName("Facility one");
        metadata.setElasticIndex("index1");

        KafkaMessage message = new KafkaMessage();
        message.setMetadata(metadata);
        message.setBody(jsonString);
        this.kafkaTemplate.send("testTopic",message);
    }
}
