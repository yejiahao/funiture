package com.app.mvc.util;

import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.util.*;

public class BeanValidator {
    private static ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();

    public BeanValidator() {
    }

    public static <T> Map<String, String> validate(T t, Class... groups) {
        Validator validator = validatorFactory.getValidator();
        Set validateResult = validator.validate(t, groups);
        if (validateResult.isEmpty()) {
            return Collections.emptyMap();
        } else {
            LinkedHashMap errors = new LinkedHashMap();
            Iterator i$ = validateResult.iterator();

            while (i$.hasNext()) {
                ConstraintViolation constraintViolation = (ConstraintViolation) i$.next();
                errors.put(constraintViolation.getPropertyPath().toString(), constraintViolation.getMessage());
            }

            return errors;
        }
    }

    public static Map<String, String> validateForObjects(Object first, Object... others) {
        return Objects.nonNull(others) && others.length != 0 ? validateForList(Lists.asList(first, others)) : validate(first, new Class[0]);
    }

    public static Map<String, String> validateForList(Collection<?> collection) {
        Preconditions.checkNotNull(collection);
        Iterator i$ = collection.iterator();

        Map errors;
        do {
            if (!i$.hasNext()) {
                return Collections.emptyMap();
            }
            Object object = i$.next();
            errors = validate(object, new Class[0]);
        } while (errors.isEmpty());

        return errors;
    }
}