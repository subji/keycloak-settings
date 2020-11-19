package org.keycloak.examples.domainextension;

public class MemberStatisticsDTO {

	private String memberStatisticsSeq;

	private String realmId;

	private String statisticsBaseDate;

	// 당일 회원 가입자 수
	private int todayRegistrationMemberCount;

	// 누적 회원 가입자 수
	private int cumulativeRegistrationMemberCount;

	// 당일 회원 탈퇴자 수
	private int todayWithdrawalMemberCount;

	// 누적 회원 탈퇴자 수
	private int cumulativeWithdrawalMemberCount;

	public String getMemberStatisticsSeq() {
		return memberStatisticsSeq;
	}

	public void setMemberStatisticsSeq(String memberStatisticsSeq) {
		this.memberStatisticsSeq = memberStatisticsSeq;
	}

	public String getRealmId() {
		return realmId;
	}

	public void setRealmId(String realmId) {
		this.realmId = realmId;
	}

	public String getStatisticsBaseDate() {
		return statisticsBaseDate;
	}

	public void setStatisticsBaseDate(String statisticsBaseDate) {
		this.statisticsBaseDate = statisticsBaseDate;
	}

	public int getTodayRegistrationMemberCount() {
		return todayRegistrationMemberCount;
	}

	public void setTodayRegistrationMemberCount(int todayRegistrationMemberCount) {
		this.todayRegistrationMemberCount = todayRegistrationMemberCount;
	}

	public int getCumulativeRegistrationMemberCount() {
		return cumulativeRegistrationMemberCount;
	}

	public void setCumulativeRegistrationMemberCount(int cumulativeRegistrationMemberCount) {
		this.cumulativeRegistrationMemberCount = cumulativeRegistrationMemberCount;
	}

	public int getTodayWithdrawalMemberCount() {
		return todayWithdrawalMemberCount;
	}

	public void setTodayWithdrawalMemberCount(int todayWithdrawalMemberCount) {
		this.todayWithdrawalMemberCount = todayWithdrawalMemberCount;
	}

	public int getCumulativeWithdrawalMemberCount() {
		return cumulativeWithdrawalMemberCount;
	}

	public void setCumulativeWithdrawalMemberCount(int cumulativeWithdrawalMemberCount) {
		this.cumulativeWithdrawalMemberCount = cumulativeWithdrawalMemberCount;
	}

	public MemberStatisticsDTO(String memberStatisticsSeq, String realmId, String statisticsBaseDate,
			int todayRegistrationMemberCount, int cumulativeRegistrationMemberCount, int todayWithdrawalMemberCount,
			int cumulativeWithdrawalMemberCount) {
		super();
		this.memberStatisticsSeq = memberStatisticsSeq;
		this.realmId = realmId;
		this.statisticsBaseDate = statisticsBaseDate;
		this.todayRegistrationMemberCount = todayRegistrationMemberCount;
		this.cumulativeRegistrationMemberCount = cumulativeRegistrationMemberCount;
		this.todayWithdrawalMemberCount = todayWithdrawalMemberCount;
		this.cumulativeWithdrawalMemberCount = cumulativeWithdrawalMemberCount;
	}

	public MemberStatisticsDTO() {
		super();
	}
	
	
	

}
