package com.app.mvc.datasource;

import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Objects;

/**
 * 动态数据源
 */
@Slf4j
public class DynamicDataSource extends AbstractRoutingDataSource {

    protected Object determineCurrentLookupKey() {
        return DataSourceKeyHolder.getCurrentKey();
    }

    @Override
    public Connection getConnection() throws SQLException {
        Connection connection = super.getConnection();
        if (Objects.nonNull(DataSourceKeyHolder.getCurrentKey())) {
            log.info("Datasource route to {}, key={}", connection, DataSourceKeyHolder.getCurrentKey());
        }
        return connection;
    }
}