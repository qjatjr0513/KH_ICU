package com.kh.icu.faq.model.vo;

import lombok.Data;

@Data
public class Faq {
	private int faqNo;
	private String faqType;
	private String faqTitle;
	private String faqContent;
	private String status;
}
