package org.hca.facility.FacilityManager.service;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hca.facility.FacilityManager.dao.TippersDAO;
import org.hca.facility.FacilityManager.model.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class QueryRunnerService {

    private static final Logger LOGGER = LogManager.getLogger(QueryRunnerService.class);

    @Autowired
    private TippersDAO tippersDAO;

    public List<Map<String, Object>> transformAndRunQuery(Query query){
        MapSqlParameterSource params = new MapSqlParameterSource();
        for(Map.Entry<String,String> entry: query.getParams().entrySet()){
            LOGGER.info("Adding {} {}",entry.getKey(), entry.getValue());
            params.addValue(entry.getKey(), entry.getValue());
        }
        return this.tippersDAO.runQuery(params, query.getQuery());

    }
}
