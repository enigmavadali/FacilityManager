package org.hca.facility.FacilityManager.model;

public class Sensor {

    private Integer sensorId;
    private String sensorName;
    private Integer pidAttached;

    public Sensor(){

    }

    public Sensor(Integer sensorId, String sensorName, Integer pidAttached) {
        this.sensorId = sensorId;
        this.sensorName = sensorName;
        this.pidAttached = pidAttached;
    }

    public Integer getSensorId() {
        return sensorId;
    }

    public void setSensorId(Integer sensorId) {
        this.sensorId = sensorId;
    }

    public String getSensorName() {
        return sensorName;
    }

    public void setSensorName(String sensorName) {
        this.sensorName = sensorName;
    }

    public Integer getPidAttached() {
        return pidAttached;
    }

    public void setPidAttached(Integer pidAttached) {
        this.pidAttached = pidAttached;
    }

    @Override
    public String toString() {
        return "Sensor{" +
                "sensorId=" + sensorId +
                ", sensorName='" + sensorName + '\'' +
                ", pidAttached=" + pidAttached +
                '}';
    }
}
