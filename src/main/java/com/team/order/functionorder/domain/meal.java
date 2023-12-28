package com.team.order.functionorder.domain;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class meal {
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
    
}
