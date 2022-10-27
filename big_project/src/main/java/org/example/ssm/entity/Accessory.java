package org.example.ssm.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Accessory {
    private String accessoryId;
    private String fruitId ;
    private String name;
    private double price ;
    private String createTime ;
}
