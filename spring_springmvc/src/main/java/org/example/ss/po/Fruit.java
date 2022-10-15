package org.example.ss.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Fruit {
    private String name;

    private double price;

    private String producingArea;
}
