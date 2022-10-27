package org.example.ssm.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Commodities extends PageEntity {
    private String fruitId;
    private String name;
    private double price;
    private String locality;
    private String createTime;
}