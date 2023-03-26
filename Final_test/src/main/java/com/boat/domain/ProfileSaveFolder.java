package com.boat.domain;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix="profile")
/*
 application.properties에서 설정한 내용 중
 my로 시작하는 키에 대한 값을 필드에 주입합니다.
 my.savefolder=c:/upload
 my.sendfile=c:/users/user1/image/icecream.png
 */
public class ProfileSaveFolder {
	private String profilesavefolder;

	public String getProfilesavefolder() {
		return profilesavefolder;
	}

	public void setProfilesavefolder(String profilesavefolder) {
		this.profilesavefolder = profilesavefolder;
	}
	
	
	
}
