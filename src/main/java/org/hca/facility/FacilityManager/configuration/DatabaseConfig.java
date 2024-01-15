package org.hca.facility.FacilityManager.configuration;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.postgresql.ds.PGSimpleDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

@Configuration
public class DatabaseConfig {

    private static final Logger LOGGER = LogManager.getLogger(DatabaseConfig.class);

    @Value("${postgres.tippers.url}")
    private String tippersURL;

    @Value("${postgres.username}")
    private String postgresUsername;

    @Value("${postgres.password}")
    private String postgresPassword;

    @Bean
    public DataSource tippersDataSource(){
        PGSimpleDataSource postgresBuilder = new PGSimpleDataSource();
        postgresBuilder.setURL(tippersURL);
        postgresBuilder.setUser(postgresUsername);
        postgresBuilder.setPassword(postgresPassword);
//        postgresBuilder.setCurrentSchema("public");
        LOGGER.info("database connection established");
        return postgresBuilder;
    }

    @Bean
    public JdbcTemplate tippersJDBCTemplate(){
        return new JdbcTemplate(this.tippersDataSource());
    }
}
