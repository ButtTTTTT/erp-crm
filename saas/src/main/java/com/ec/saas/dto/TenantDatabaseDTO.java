package com.ec.saas.dto;

import lombok.Data;

/**
 * @Author:
 * @Date:
 * @Description:
 */
@Data
//这是给租户分发的实体
public class TenantDatabaseDTO {
    public String tenantDatabase;
    public String dbUser;
    public String dbPass;
    public String adminName;
    public String adminPass;
    public String tenantName;
    public String url;
}
