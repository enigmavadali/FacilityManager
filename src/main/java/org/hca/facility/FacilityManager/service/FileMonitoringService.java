package org.hca.facility.FacilityManager.service;

import jakarta.annotation.PostConstruct;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.nio.file.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Service
public class FileMonitoringService {

    private static final Logger LOGGER = LogManager.getLogger(FileMonitoringService.class);

    @Value("${dir.monitor.path}")
    private String dirPath;

    @Autowired
    private FileSenderService fileSenderService;

    @PostConstruct
    public void init(){
        ExecutorService executorService = Executors.newSingleThreadExecutor();
        executorService.submit(() -> {
            try{
                LOGGER.info("Starting file watch for folder " + this.dirPath);
                monitorFileChanges(dirPath);
            }catch(Exception e){
                LOGGER.error("Error occurred while file monitoring",e);
            }
        });
        executorService.shutdown();
    }

    private void monitorFileChanges(String dirPath) throws Exception{
        WatchService watchService = FileSystems.getDefault().newWatchService();

        Path path = Paths.get(dirPath);
        path.register(watchService,
                StandardWatchEventKinds.ENTRY_CREATE,
                StandardWatchEventKinds.ENTRY_DELETE,
                StandardWatchEventKinds.ENTRY_MODIFY);

        WatchKey key;
        while((key = watchService.take()) != null){
            for(WatchEvent<?> event : key.pollEvents()){
                LOGGER.info("event kind " + event.kind() + " detected. FIle affected " + event.context());
                if(event.kind() == StandardWatchEventKinds.ENTRY_CREATE || event.kind() == StandardWatchEventKinds.ENTRY_MODIFY){
                    this.fileSenderService.sendFileToCloud(event.context().toString());
                }
            }
            key.reset();
        }
    }
}
