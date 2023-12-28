package com.team.order.functionorder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.order.functionorder.domain.MealTypeBean;
import com.team.order.functionorder.repository.MealTypeRepository;

@Service
@Transactional(rollbackFor = { Exception.class })
public class MealTypeService {
    @Autowired
    private MealTypeRepository mealTypeRep;

    public List<MealTypeBean> findAll() {
        return mealTypeRep.findAll();
    }

    public MealTypeBean findById(Integer id) {
        if (id != null && mealTypeRep.existsById(id)) {
            return mealTypeRep.findById(id).get();
        }
        return null;
    }

    public boolean existsById(Integer id) {
        if (id != null) {
            return mealTypeRep.existsById(id);
        }
        return false;
    }

    public boolean insert(MealTypeBean bean) {
        if (bean != null && bean.getId() == null) {
            mealTypeRep.save(bean);
            return true;
        }
        return false;
    }

    public boolean update(MealTypeBean bean) {
        if (bean != null && bean.getId() != null && mealTypeRep.existsById(bean.getId())) {
            mealTypeRep.save(bean);
            return true;
        }
        return false;
    }

    public boolean deleteById(Integer id) {
        if (id != null && mealTypeRep.existsById(id)) {
            mealTypeRep.deleteById(id);
            return true;
        }
        return false;
    }

}
