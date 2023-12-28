package com.team.order.functionorder.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "meal_type")
public class MealTypeBean {
    // field
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "int")
    private Integer id;
    @Column(name = "name", columnDefinition = "nvarchar")
    private String name;
    @Column(name = "info", columnDefinition = "nvarchar")
    private String info;

    // constructor
    public MealTypeBean() {
    }

    // toString
    @Override
    public String toString() {
        return "MealTypeBean [id=" + id + ", name=" + name + ", info=" + info + "]";
    }

    // getter & setter
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

}
