package com.iu.home.member;

import java.util.List;

public class MemberDTO
{
	private String userID;
	private String userName;
	private String pwd;
	private String email;
	private Long age;
	private String birth;
	private String phone;
	private Long gender; // 1: man, 2: woman
	private List<ClassDTO> classDTOs;
	private List<UserClassDTO> userClassDTOs;
	private List<MemberDTO> memberDTOs;

	public List<MemberDTO> getMemberDTOs()
	{
		return memberDTOs;
	}

	public void setMemberDTOs(List<MemberDTO> memberDTOs)
	{
		this.memberDTOs = memberDTOs;
	}

	public List<UserClassDTO> getUserClassDTOs()
	{
		return userClassDTOs;
	}

	public void setUserClassDTOs(List<UserClassDTO> userClassDTOs)
	{
		this.userClassDTOs = userClassDTOs;
	}

	public List<ClassDTO> getClassDTOs()
	{
		return classDTOs;
	}

	public void setClassDTOs(List<ClassDTO> classDTOs)
	{
		this.classDTOs = classDTOs;
	}

	public String getUserID()
	{
		return userID;
	}

	public void setUserID(String userID)
	{
		this.userID = userID;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getPwd()
	{
		return pwd;
	}

	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getBirth()
	{
		return birth;
	}

	public void setBirth(String birth)
	{
		this.birth = birth;
	}

	public String getPhone()
	{
		return phone;
	}

	public void setPhone(String phone)
	{
		this.phone = phone;
	}

	public Long getAge()
	{
		return age;
	}

	public void setAge(Long age)
	{
		this.age = age;
	}

	public Long getGender()
	{
		return gender;
	}

	public void setGender(Long gender)
	{
		this.gender = gender;
	}

}
