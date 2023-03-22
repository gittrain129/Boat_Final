package com.boat.domain;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix="my")
/*
								application.properties에서 설정한 내용 중 
								my.savefoler=c:/upload
								my.sendfile=c:/Users/jhta/Desktop/image/congra.jpg
 									*/
public class MySaveFoler {
	private String savefolder;
	private String sendfile;
	
	public String getSavefolder() {
		return savefolder;
	}
	public void setSavefolder(String savefolder) {
		this.savefolder = savefolder;
	}
	public String getSendfile() {
		return sendfile;
	}
	public void setSendfile(String sendfile) {
		this.sendfile = sendfile;
	}

	
}
