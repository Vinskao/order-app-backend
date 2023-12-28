package com.team.order.functionorder.repository;

import java.util.List;

import org.hibernate.Session;
import org.json.JSONObject;

import com.team.order.functionorder.domain.Meal;

import jakarta.persistence.PersistenceContext;

public class MealSpringDataJpaDAOImpl implements MealSpringDataJpaDAO{
    @PersistenceContext
    private Session session;
    public Session getSession() {
        return this.session;
    }
    public List<Meal> find(JSONObject param){
        return null;
    };
    public long count(JSONObject param){
        return 0;
    };
}
