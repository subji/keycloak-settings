
package org.keycloak.examples.domainextension.jpa;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * 맴버 통계 JPA 테이블 
 * @author Daumsoft
 *
 */
@Entity
@Table(name = "T_MEMBER_STATISTICS")
@NamedQueries({ @NamedQuery(name = "findByRealm", query = "from MemberStatistics where realmId = :realmId") })
public class MemberStatistics {

	@Id
    @Column(name = "MEMBER_STATISTICS_SEQ")
    private String memberStatisticsSeq;

    @Column(name = "REALM_ID", nullable = false)
    private String realmId;
    
    @Column(name = "STATISTICS_BASE_DATE")
    private String statisticsBaseDate;

    //당일 회원 가입자 수
    @Column(name = "TODAY_REGISTRATION_MEMBER_COUNT")
    private int todayRegistrationMemberCount;
    
    //누적 회원 가입자 수
    @Column(name = "CUMULATIVE_REGISTRATION_MEMBER_COUNT")
    private int cumulativeRegistrationMemberCount;
    
    //당일 회원 탈퇴자 수
    @Column(name = "TODAY_WITHDRAWAL_MEMBER_COUNT")
    private int todayWithdrawalMemberCount;
    
    //누적 회원 탈퇴자 수
    @Column(name = "CUMULATIVE_WITHDRAWAL_MEMBER_COUNT")
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
    
    

    @Override
	public String toString() {
		return "MemberStatistics [memberStatisticsSeq=" + memberStatisticsSeq + ", realmId=" + realmId
				+ ", statisticsBaseDate=" + statisticsBaseDate + ", todayRegistrationMemberCount="
				+ todayRegistrationMemberCount + ", cumulativeRegistrationMemberCount="
				+ cumulativeRegistrationMemberCount + ", todayWithdrawalMemberCount=" + todayWithdrawalMemberCount
				+ ", cumulativeWithdrawalMemberCount=" + cumulativeWithdrawalMemberCount + "]";
	}

    
    
}
