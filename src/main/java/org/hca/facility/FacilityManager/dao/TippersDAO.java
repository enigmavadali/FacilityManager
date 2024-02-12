package org.hca.facility.FacilityManager.dao;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hca.facility.FacilityManager.model.Resident;
import org.hca.facility.FacilityManager.model.Sensor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.ColumnMapRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import static org.hca.facility.FacilityManager.util.RowMapperUtil.residentRowMapper;
import static org.hca.facility.FacilityManager.util.RowMapperUtil.sensorRowMapper;

@Service
public class TippersDAO {

    @Autowired
    private JdbcTemplate tippersJDBCTemplate;

    @Autowired
    private NamedParameterJdbcTemplate tippersNamedParameterJdbcTemplate;

    private static final Logger LOGGER = LogManager.getLogger(TippersDAO.class);

    private static final String GET_ONE_RESIDENT_SQL = "select * from public.resident where pid=?";

    private static final String GET_ALL_RESIDENTS = "select * from public.resident";

    private static final String GET_ALL_SENSORS = "select * from public.sensor";

    private static final String INSERT_RESIDENT = "insert into public.resident values(:pid, :first_name, :last_name, :room, :gender, :age, :dob, :telephone, :haspet, " +
            ":weight_lbs, :photo, :emmergencycontact1, :telephone_emc1, :relationship_emc1, :emmergencycontact2, :telephone_emc2, :relationship_emc2, :isambulatory, " +
            ":isabletocommunicate, :medicalinformation, :isvacinnatedforcovid19, :lastfall, :lastervisit, :dischargedfromovernighthospitalstay, :isfallrisk, :iswanderrisk, " +
            ":iselopementrisk, :physician, :physician_telephone, :ispet)";

    public Resident getSingleResident(Integer residentID){
        return this.tippersJDBCTemplate.queryForObject(GET_ONE_RESIDENT_SQL, new Object[] {residentID}, residentRowMapper);
    }

    public List<Resident> getAllResidents(){
        return this.tippersJDBCTemplate.query(GET_ALL_RESIDENTS,residentRowMapper);
    }

    public List<Sensor> getAllSensors(){
        return this.tippersJDBCTemplate.query(GET_ALL_SENSORS,sensorRowMapper);
    }

    public String insertResident(Resident resident){
        MapSqlParameterSource parameters = new MapSqlParameterSource()
                .addValue("pid", resident.getPid())
                .addValue("first_name", resident.getFirstName())
                .addValue("last_name", resident.getLastName())
                .addValue("room", resident.getRoom())
                .addValue("gender", resident.getGender())
                .addValue("age", resident.getAge())
                .addValue("dob", resident.getDob())
                .addValue("telephone", resident.getTelephone())
                .addValue("haspet", resident.getHasPet())
                .addValue("weight_lbs", resident.getWeightLbs())
                .addValue("photo", resident.getPhoto())
                .addValue("emmergencycontact1", resident.getEmergencyContact1())
                .addValue("telephone_emc1", resident.getTelephoneEmc1())
                .addValue("relationship_emc1", resident.getRelationshipEmc1())
                .addValue("emmergencycontact2", resident.getEmergencyContact2())
                .addValue("telephone_emc2", resident.getTelephoneEmc2())
                .addValue("relationship_emc2", resident.getRelationshipEmc2())
                .addValue("isambulatory", resident.getIsAmbulatory())
                .addValue("isabletocommunicate", resident.getIsAbleToCommunicate())
                .addValue("medicalinformation", resident.getMedicalInformation())
                .addValue("isvacinnatedforcovid19", resident.getIsVaccinatedForCovid19())
                .addValue("lastfall", resident.getLastFall())
                .addValue("lastervisit", resident.getLastErVisit())
                .addValue("dischargedfromovernighthospitalstay", resident.getDischargedFromOvernightHospitalStay())
                .addValue("isfallrisk", resident.getIsFallRisk())
                .addValue("iswanderrisk", resident.getIsWanderRisk())
                .addValue("iselopementrisk", resident.getIsElopementRisk())
                .addValue("physician", resident.getPhysician())
                .addValue("physician_telephone", resident.getPhysicianTelephone())
                .addValue("ispet", resident.getIsPet());

        this.tippersNamedParameterJdbcTemplate.update(INSERT_RESIDENT,parameters);
        return "Inserted resident successfully";
    }

    public List<Map<String,Object>> runQuery(MapSqlParameterSource params, String query){
        return this.tippersNamedParameterJdbcTemplate.query(query,params, new ColumnMapRowMapper());
    }

}
