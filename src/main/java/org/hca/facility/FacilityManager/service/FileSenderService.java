package org.hca.facility.FacilityManager.service;

import org.apache.coyote.Response;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.io.File;
import java.util.Collections;

@Service
public class FileSenderService {

    private static final Logger LOGGER = LogManager.getLogger(FileMonitoringService.class);

    @Value("${dir.monitor.path}")
    private String dirPath;

    @Value("${cloud.host}")
    private String cloudHost;

    @Value("${folder.in.cloud}")
    private String cloudFolderName;

    @Value("${facility.id}")
    private String facilityId;

    @Autowired
    @Qualifier("cloudRestTemplate")
    private RestTemplate restTemplate;


    public void sendFileToCloud(String fileName){
        try{
            String filePath = this.dirPath + "/" + fileName;
            FileSystemResource fileResource = new FileSystemResource(new File(filePath));
            MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
            body.add("file",fileResource);
            HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, addFileHeadersForCloud(fileName));
            ResponseEntity<String> response = this.restTemplate.exchange(cloudHost + "/createOrUpdateFile", HttpMethod.POST, requestEntity, String.class);
            if(response.getStatusCode() == HttpStatus.OK){
                LOGGER.info("File {} created/updated in the cloud", fileName);
            }
        } catch (Exception e){
            LOGGER.error("Error while sending file to cloud ", e);
        }
    }

    private HttpHeaders addFileHeadersForCloud(String fileName){
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
        headers.add("Folder-Name",this.cloudFolderName);
        headers.add("File-Name",fileName);
        headers.add("Facility-Id",this.facilityId);
        return headers;
    }
}
