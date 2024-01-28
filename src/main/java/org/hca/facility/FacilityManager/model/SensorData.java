package org.hca.facility.FacilityManager.model;

import java.time.Instant;

public class SensorData {

    private Sensor sensor;
    private Instant timestamp;

    public Sensor getSensor() {
        return sensor;
    }

    public void setSensor(Sensor sensor) {
        this.sensor = sensor;
    }

    public Instant getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Instant timestamp) {
        this.timestamp = timestamp;
    }

}
