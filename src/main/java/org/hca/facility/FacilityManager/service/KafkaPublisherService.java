package org.hca.facility.FacilityManager.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hca.common.domain.KafkaMessage;
import org.hca.common.domain.KafkaMessageMetadata;
import org.hca.common.domain.Test;
import org.hca.facility.FacilityManager.dao.TippersDAO;
import org.hca.facility.FacilityManager.model.Resident;
import org.hca.facility.FacilityManager.util.KafkaMessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Service
public class KafkaPublisherService {

    private static final Logger LOGGER = LogManager.getLogger(KafkaPublisherService.class);

    @Value("${facility.id}")
    private String facilityID;

    @Value("${elastic.index}")
    private String elasticIndex;

    @Autowired
    private KafkaTemplate<String, KafkaMessage> kafkaTemplate;

    @Autowired
    private TippersDAO tippersDAO;

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private KafkaMessageUtil kafkaMessageUtil;

    public void sendMessageToTopic(Object data, String topicName, String entityUUID){
        KafkaMessageMetadata metadata = new KafkaMessageMetadata();
        metadata.setFacilityId(this.facilityID);
        metadata.setElasticIndex(this.elasticIndex);
        metadata.setUUID(entityUUID);
        KafkaMessage message = new KafkaMessage();
        message.setMetadata(metadata);
        message.setBody(data);

        ProducerRecord<String,KafkaMessage> record = new ProducerRecord<>(topicName,entityUUID,message);
        this.kafkaTemplate.send(record);
    }

//    public void sendMessage(){
//        Test t = new Test();
//        t.setId(1);
//        t.setName("rohit");
//        t.setAge(25);
//        String jsonString = "";
//        try{
//            jsonString = this.objectMapper.writeValueAsString(t);
//            LOGGER.info("converted json"+jsonString);
//        } catch(Exception e){
//            LOGGER.error("error",e);
//        }
//
//        KafkaMessageMetadata metadata = new KafkaMessageMetadata();
//        metadata.setFacilityId("1");
////        metadata.setFacilityName("Facility one");
//        metadata.setElasticIndex("index1");
//
//        KafkaMessage message = new KafkaMessage();
//        message.setMetadata(metadata);
//        message.setBody(jsonString);
//        this.kafkaTemplate.send("testTopic",message);
//        try{
//            String m = this.objectMapper.writeValueAsString(message);
//            LOGGER.info("the message size is " + m.getBytes(StandardCharsets.UTF_8).length);
//        } catch(Exception e){
//            LOGGER.error(e);
//        }
//
//    }
//
//    public String testBatch(int size){
//        KafkaMessageMetadata metadata = new KafkaMessageMetadata();
//        metadata.setFacilityId("1");
////        metadata.setFacilityName("Facility one");
//        metadata.setElasticIndex("index1");
//        Resident resident = this.tippersDAO.getSingleResident(1);
//        String jsonString = "";
//        try{
//            jsonString = this.objectMapper.writeValueAsString(resident);
//            LOGGER.info("resident json "+jsonString);
//        } catch(Exception e){
//            LOGGER.error("error",e);
//        }
//        KafkaMessage message = new KafkaMessage();
//        message.setMetadata(metadata);
//        message.setBody(jsonString);
////        try{
////            String m = this.objectMapper.writeValueAsString(message);
////            LOGGER.info("the message size is " + m.getBytes(StandardCharsets.UTF_8).length);
////        } catch(Exception e){
////            LOGGER.error(e);
////        }
//        LOGGER.info("started batch of " + size);
//        for(int i=1; i<=size; i++){
//            message.getMetadata().setFacilityId(String.valueOf(i));
//            this.kafkaTemplate.send("testTopic",message);
////            LOGGER.info("published message " + i);
//        }
//        LOGGER.info("finished batch of size " + size);
//        return "success";
//    }
//
//    public String testEntityBatch(int entities, int messages){
//        KafkaMessageMetadata metadata = new KafkaMessageMetadata();
//        metadata.setFacilityId("1");
//        metadata.setElasticIndex("facility-index");
//        Resident resident = this.tippersDAO.getSingleResident(1);
//        String jsonString = "";
//        try{
//            jsonString = this.objectMapper.writeValueAsString(resident);
//            LOGGER.info("resident json "+jsonString);
//        } catch(Exception e){
//            LOGGER.error("error",e);
//        }
//        KafkaMessage message = new KafkaMessage();
//        message.setMetadata(metadata);
//        message.setBody(jsonString);
//        List<String> uuids = new ArrayList<>(entities);
//        for(int i=0;i<entities;i++){
//            uuids.add(this.kafkaMessageUtil.generateUUID());
//        }
//        for(String uuid : uuids){
//            LOGGER.info("started producer batch for UUID " + uuid);
//            message.getMetadata().setUUID(uuid);
//            for(int i=1;i<=messages;i++){
//                ProducerRecord<String,KafkaMessage> record = new ProducerRecord<>("testTopic",uuid,message);
//                this.kafkaTemplate.send(record);
//            }
//            LOGGER.info("completed producer batch for UUID " + uuid);
//        }
//        return "Success";
//    }


}
