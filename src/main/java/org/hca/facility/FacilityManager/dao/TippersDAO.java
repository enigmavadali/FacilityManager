package org.hca.facility.FacilityManager.dao;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hca.facility.FacilityManager.model.Resident;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

import static org.hca.facility.FacilityManager.util.RowMapperUtil.residentRowMapper;

@Service
public class TippersDAO {

    @Autowired
    private JdbcTemplate tippersJDBCTemplate;

    private static final Logger LOGGER = LogManager.getLogger(TippersDAO.class);

    private static final String GET_ONE_RESIDENT_SQL = "select * from public.resident where pid=?";

    private static final String GET_ALL_RESIDENTS = "select * from public.resident";

    public Resident getSingleResident(Integer residentID){
        return this.tippersJDBCTemplate.queryForObject(GET_ONE_RESIDENT_SQL, new Object[] {residentID}, residentRowMapper);
    }

    public List<Resident> getAllResidents(){
        return this.tippersJDBCTemplate.query(GET_ALL_RESIDENTS,residentRowMapper);
    }

}
