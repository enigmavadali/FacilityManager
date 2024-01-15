package org.hca.facility.FacilityManager.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hca.facility.FacilityManager.dao.TippersDAO;
import org.hca.facility.FacilityManager.model.Resident;
import org.hca.facility.FacilityManager.util.CryptUtil;
import org.hca.facility.FacilityManager.util.EntityCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResidentService {

    private static final Logger LOGGER = LogManager.getLogger(ResidentService.class);

    @Autowired
    private TippersDAO tippersDAO;

    @Autowired
    private CryptUtil cryptUtil;

    @Autowired
    private EntityCache entityCache;

    @Autowired
    private KafkaPublisherService kafkaPublisherService;

    @Autowired
    private ObjectMapper objectMapper;

    public String sendResidentDataToKafka(){
        List<Resident> residentList = this.tippersDAO.getAllResidents();
        for(Resident resident : residentList){
            if(resident.getPhoto() != null){
                resident.setPhoto(this.cryptUtil.encrypt(resident.getPhoto()));
            }
            if(resident.getMedicalInformation() != null){
                resident.setMedicalInformation(this.cryptUtil.encrypt(resident.getMedicalInformation()));
            }
            LOGGER.info("post enc " + resident.getPhoto() + " " + resident.getMedicalInformation());

            // send to kafka
//            String jsonString = "";
//            try{
//                jsonString = this.objectMapper.writeValueAsString(resident);
////                LOGGER.info("converted json"+jsonString);
//            } catch(Exception e){
//                LOGGER.error("Error while converting resident to json ",e);
//            }
            String residentUUID = this.entityCache.getResidentCache().get(resident.getPid());
            LOGGER.info("publishing resident " + resident.getPid());
            this.kafkaPublisherService.sendMessageToTopic(resident,"testTopic",residentUUID);
        }
        return "Sent resident data";
    }
}
