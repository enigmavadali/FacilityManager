package org.hca.facility.FacilityManager.controller;

import org.hca.facility.FacilityManager.service.KafkaPublisherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FacilityEventController {

    @Autowired
    private KafkaPublisherService kafkaPublisherService;

    @GetMapping("/test")
    public String test(){
        this.kafkaPublisherService.sendMessage();
        return "success";
    }
}
