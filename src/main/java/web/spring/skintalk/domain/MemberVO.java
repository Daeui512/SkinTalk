package web.spring.skintalk.domain;

import java.util.Date;

public class MemberVO {
   private String userId;
   private String password;
   private String userName;
   private String nickName;
   private String gender;
   private int age;
   private String skinType;
   private String skinTrouble;
   private String email;
   private String phone;
   private String address;
   private Date mDate;
   
   public MemberVO() {}

   public MemberVO(String userId, String password, String userName, String nickName, String gender, int age,
         String skinType, String skinTrouble, String email, String phone, String address, Date mDate) {
      super();
      this.userId = userId;
      this.password = password;
      this.userName = userName;
      this.nickName = nickName;
      this.gender = gender;
      this.age = age;
      this.skinType = skinType;
      this.skinTrouble = skinTrouble;
      this.email = email;
      this.phone = phone;
      this.address = address;
      this.mDate = mDate;
   }

   public String getUserId() {
      return userId;
   }

   public void setUserId(String userId) {
      this.userId = userId;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getUserName() {
      return userName;
   }

   public void setUserName(String userName) {
      this.userName = userName;
   }

   public String getNickName() {
      return nickName;
   }

   public void setNickName(String nickName) {
      this.nickName = nickName;
   }

   public String getGender() {
      return gender;
   }

   public void setGender(String gender) {
      this.gender = gender;
   }

   public int getAge() {
      return age;
   }

   public void setAge(int age) {
      this.age = age;
   }

   public String getSkinType() {
      return skinType;
   }

   public void setSkinType(String skinType) {
      this.skinType = skinType;
   }

   public String getSkinTrouble() {
      return skinTrouble;
   }

   public void setSkinTrouble(String skinTrouble) {
      this.skinTrouble = skinTrouble;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   public Date getmDate() {
      return mDate;
   }

   public void setmDate(Date mDate) {
      this.mDate = mDate;
   }

   @Override
   public String toString() {
      return "MemberVO [userId=" + userId + ", password=" + password + ", userName=" + userName + ", nickName="
            + nickName + ", gender=" + gender + ", age=" + age + ", skinType=" + skinType + ", skinTrouble="
            + skinTrouble + ", email=" + email + ", phone=" + phone + ", address=" + address + ", mDate=" + mDate
            + "]";
   }
   
   
   
}