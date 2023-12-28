package com.team.order.functionorder.repository;

import java.util.List;

import org.json.JSONObject;

import com.team.order.functionorder.domain.Meal;

public interface MealSpringDataJpaDAO {
    public abstract List<Meal> find(JSONObject param);
    public abstract long count(JSONObject param);
}
