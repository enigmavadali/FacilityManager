package org.hca.facility.FacilityManager.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hca.facility.FacilityManager.model.Resident;
import org.hca.facility.FacilityManager.service.KafkaPublisherService;
import org.hca.facility.FacilityManager.service.ResidentService;
import org.hca.facility.FacilityManager.util.CryptUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FacilityEventController {

    private static final Logger LOGGER = LogManager.getLogger(FacilityEventController.class);

    @Autowired
    private KafkaPublisherService kafkaPublisherService;

    @Autowired
    private CryptUtil cryptUtil;

    @Autowired
    private ResidentService residentService;

    @GetMapping("/ping")
    public String ping(){
        return "Facility Service up and running!";
    }

//    @GetMapping("/test")
//    public String test(){
//        this.kafkaPublisherService.sendMessage();
//        return "success";
//    }
//
//    @GetMapping("/batch/{size}")
//    public String testBatch(@PathVariable int size){
//        LOGGER.info("received batch of size " + size);
//        return this.kafkaPublisherService.testBatch(size);
//    }
//
//    @GetMapping("/testBatch/{entities}/{messages}")
//    public String testEntityBatch(@PathVariable int entities, @PathVariable int messages){
//        LOGGER.info("received test batch of " + entities + " with each sending " + messages + " messages");
//        return this.kafkaPublisherService.testEntityBatch(entities,messages);
//    }

    @GetMapping("/testkey")
    public String testEncDec(){
        LOGGER.info("test enc dec for text Rohit");
        String enc = this.cryptUtil.encrypt("Rohit");
        LOGGER.info("enc is: " + enc);
        LOGGER.info("dec is: " + this.cryptUtil.decrypt("ZYwq5nKGr/tFScSoURv/ppCTBttFE2QG0QlcSnQfcSQkTwJozchGZmC6di7sx2L0"));
        return "Success";
    }

    @PostMapping("/sendResidents")
    public String sendResidents(@RequestBody String body){
        return this.residentService.sendResidentDataToKafka();
    }

    @PostMapping("/addResident")
    public String addResident(@RequestBody Resident resident){
        return this.residentService.insertResidentData(resident);
    }
}
