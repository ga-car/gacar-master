package com.Project.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.Project.notify.NotifyModel;

public class NoticeValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		
		return NotifyModel.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "subject", "subject");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "content");
	}
}