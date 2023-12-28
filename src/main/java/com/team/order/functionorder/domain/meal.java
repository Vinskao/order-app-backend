package com.team.order.functionorder.domain;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "meal")
public class Meal {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;
    private Integer price;
    @Column(name = "speical_menu", columnDefinition = "bit")
    private boolean speicalMenu;
    @Column(name = "end_time", columnDefinition = "date")
    private Date endTime;
    private String photo;
    private String info;
    private Integer type;
    
    @Override
    public String toString() {
        return "Meal{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", specialMenu=" + speicalMenu +
                ", endTime=" + endTime +
                ", photo='" + photo + '\'' +
                ", info='" + info + '\'' +
                ", type=" + type +
                '}';
    }
}

