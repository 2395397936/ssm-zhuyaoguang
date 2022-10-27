
package org.example.ssm.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Retailer extends PageEntity {
    private String retailerId;
    private String name;
    private String telephone ;
    private String address;
    private int status;
    private String createTime ;

    @Override
    public String toString() {
        return "getPageSize:"+getPageSize()+"getCurrentPage:"+
                getCurrentPage()+"getStartPage:"+getStartPage()+"Retailer{" +
                "retailerId='" + retailerId + '\'' +
                ", name='" + name + '\'' +
                ", telephone='" + telephone + '\'' +
                ", address='" + address + '\'' +
                ", status=" + status +
                ", createTime='" + createTime + '\'' +
                '}';
    }
}