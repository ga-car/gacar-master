package com.Project.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.Project.carpool.CarpoolModel;

public class CarpoolValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		
		return CarpoolModel.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "subject", "subject");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "content");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "goal", "goal");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "term", "term");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "charge", "charge");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pnum2", "pnum2");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "smoke", "smoke");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "saddr", "saddr");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "eaddr", "eaddr");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "insure", "insure");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "startdate", "startdate");
	}
}