package org.hca.facility.FacilityManager.util;

import org.hca.facility.FacilityManager.model.Resident;
import org.springframework.jdbc.core.RowMapper;

public class RowMapperUtil {

    public static RowMapper<Resident> residentRowMapper = (rs, rowNum) -> {
        Resident resident = new Resident();
        resident.setPid(rs.getInt("pid"));
        resident.setFirstName(rs.getString("first_name"));
        resident.setLastName(rs.getString("last_name"));
        resident.setRoom(rs.getInt("room"));
        resident.setGender(rs.getString("gender"));
        resident.setAge(rs.getInt("age"));
        resident.setDob(rs.getDate("dob"));
        resident.setTelephone(rs.getString("telephone"));
        resident.setHasPet(rs.getString("haspet"));
        resident.setWeightLbs(rs.getInt("weight_lbs"));
        resident.setPhoto(rs.getString("photo"));
        resident.setEmergencyContact1(rs.getString("emmergencycontact1"));
        resident.setTelephoneEmc1(rs.getString("telephone_emc1"));
        resident.setRelationshipEmc1(rs.getString("relationship_emc1"));
        resident.setEmergencyContact2(rs.getString("emmergencycontact1"));
        resident.setTelephoneEmc2(rs.getString("telephone_emc2"));
        resident.setRelationshipEmc2(rs.getString("relationship_emc2"));
        resident.setIsAmbulatory(rs.getString("isambulatory"));
        resident.setIsAbleToCommunicate(rs.getString("isabletocommunicate"));
        resident.setMedicalInformation(rs.getString("medicalinformation"));
        resident.setIsVaccinatedForCovid19(rs.getString("isvacinnatedforcovid19"));
        resident.setLastFall(rs.getDate("lastfall"));
        resident.setLastErVisit(rs.getDate("lastervisit"));
        resident.setDischargedFromOvernightHospitalStay(rs.getString("dischargedfromovernighthospitalstay"));
        resident.setIsFallRisk(rs.getString("isfallrisk"));
        resident.setIsWanderRisk(rs.getString("iswanderrisk"));
        resident.setIsElopementRisk(rs.getString("iselopementrisk"));
        resident.setPhysician(rs.getString("physician"));
        resident.setPhysicianTelephone(rs.getString("physician_telephone"));
        resident.setIsPet(rs.getString("ispet"));
        return resident;
    };
}
