package minites.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import minites.common.MybatisConfig;
import minites.vo.Stat;



public class StatDAO {

	Stat stat;
	SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	SqlSession session;
	String total_person_month;
	//이번 달 - 총 통계, 몇명 만났나
	
	
	public List<Stat> month_Stat(String user_email) {
		
		List<Stat> month_total_list=null;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_email", user_email);
		try{
		session=factory.openSession();
			month_total_list=session.selectList("StatMapper.month_total_list",user_email);
			total_person_month=session.selectOne("StatMapper.howmanymonth",user_email);
			stat=new Stat();
			stat.setTotal_person_month(total_person_month);
			stat.setTotal_count_month(month_total_list.get(0).getTotal_count_month());
			stat.setTotal_time_month(month_total_list.get(0).getTotal_time_month());
			stat.setTotal_title_month(month_total_list.get(0).getTotal_title_month());
			stat.setYear_month(month_total_list.get(0).getYear_month());
			stat.setMonth_month(month_total_list.get(0).getMonth_month());
			month_total_list.add(stat);			
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session != null)session.close();
		}	
		//System.out.println(month_total_list);
		
		return month_total_list;
	}

	//이번 달  - 그래프 통계
	public List<Stat> month_Graph(String user_email) {
		List<Stat> month_graph_list=new ArrayList<Stat>();
		List<Stat> month_graph_list1=null;
		List<Stat> month_graph_list2=null;
		List<Stat> month_graph_list3=null;
		List<Stat> month_graph_list4=null;
		List<Stat> month_graph_list5=null;
		List<Stat> month_graph_list6=null;
		List<Stat> month_graph_list7=null;
		List<Stat> month_graph_list8=null;
		List<Stat> month_graph_list9=null;
		List<Stat> month_graph_list10=null;
		List<Stat> month_graph_list11=null;
		List<Stat> month_graph_list12=null;
		try{
			session=factory.openSession();
			month_graph_list1=session.selectList("StatMapper.month_graph_list_1",user_email);
			month_graph_list2=session.selectList("StatMapper.month_graph_list_2",user_email);
			month_graph_list3=session.selectList("StatMapper.month_graph_list_3",user_email);
			month_graph_list4=session.selectList("StatMapper.month_graph_list_4",user_email);
			month_graph_list5=session.selectList("StatMapper.month_graph_list_5",user_email);
			month_graph_list6=session.selectList("StatMapper.month_graph_list_6",user_email);
			month_graph_list7=session.selectList("StatMapper.month_graph_list_7",user_email);
			month_graph_list8=session.selectList("StatMapper.month_graph_list_8",user_email);
			month_graph_list9=session.selectList("StatMapper.month_graph_list_9",user_email);
			month_graph_list10=session.selectList("StatMapper.month_graph_list_10",user_email);
			month_graph_list11=session.selectList("StatMapper.month_graph_list_11",user_email);
			month_graph_list12=session.selectList("StatMapper.month_graph_list_12",user_email);
			month_graph_list.addAll(month_graph_list1);
			month_graph_list.addAll(month_graph_list2);
			month_graph_list.addAll(month_graph_list3);
			month_graph_list.addAll(month_graph_list4);
			month_graph_list.addAll(month_graph_list5);
			month_graph_list.addAll(month_graph_list6);
			month_graph_list.addAll(month_graph_list7);
			month_graph_list.addAll(month_graph_list8);
			month_graph_list.addAll(month_graph_list9);
			month_graph_list.addAll(month_graph_list10);
			month_graph_list.addAll(month_graph_list11);
			month_graph_list.addAll(month_graph_list12);
			session.commit();
			
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(session != null)session.close();
			}
		return month_graph_list;
	}

	//이번 주 - 총 통계
	public List<Stat> week_Stat(String user_email) {
		
		String howmanyweek=null;
		List<Stat> week_total_list=null;
		
		try{
			session=factory.openSession();
			week_total_list=session.selectList("StatMapper.week_total_list",user_email);
			howmanyweek=session.selectOne("StatMapper.howmanyweek",user_email);
			stat=new Stat();
			stat.setTotal_person_week(howmanyweek);
			stat.setTotal_count_week(week_total_list.get(0).getTotal_count_week());
			stat.setTotal_time_week(week_total_list.get(0).getTotal_time_week());
			stat.setTotal_title_week(week_total_list.get(0).getTotal_title_week());
			stat.setMonth_week(week_total_list.get(0).getMonth_week());
			stat.setWeek_week(week_total_list.get(0).getWeek_week());
			week_total_list.add(stat);
			
			session.commit();
			
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(session != null)session.close();
			}		
		return week_total_list;
	}

	//이번 주 - 그래프 통계
	public List<Stat> week_Graph(String user_email) {
		List<Stat> week_graph_list=new ArrayList<Stat>();
		List<Stat> week_graph_list1=null;//일요일
		List<Stat> week_graph_list2=null;//월요일
		List<Stat> week_graph_list3=null;//화
		List<Stat> week_graph_list4=null;//수
		List<Stat> week_graph_list5=null;//목
		List<Stat> week_graph_list6=null;//금
		List<Stat> week_graph_list7=null;//토
		try{
			session=factory.openSession();
			week_graph_list1=session.selectList("StatMapper.week_graph_list_1",user_email);
			week_graph_list2=session.selectList("StatMapper.week_graph_list_2",user_email);
			week_graph_list3=session.selectList("StatMapper.week_graph_list_3",user_email);
			week_graph_list4=session.selectList("StatMapper.week_graph_list_4",user_email);
			week_graph_list5=session.selectList("StatMapper.week_graph_list_5",user_email);
			week_graph_list6=session.selectList("StatMapper.week_graph_list_6",user_email);
			week_graph_list7=session.selectList("StatMapper.week_graph_list_7",user_email);
			
			week_graph_list.addAll(week_graph_list2);
			week_graph_list.addAll(week_graph_list3);
			week_graph_list.addAll(week_graph_list4);
			week_graph_list.addAll(week_graph_list5);
			week_graph_list.addAll(week_graph_list6);
			week_graph_list.addAll(week_graph_list7);
			week_graph_list.addAll(week_graph_list1);
			session.commit();
			
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(session != null)session.close();
			}	
		return week_graph_list;
	}
	
	//안건 별 - 그래프 통계
	public List<Stat> agenda_Graph(String user_email){
		List<Stat> agendaList=null;
		try{
			session=factory.openSession();
			agendaList=session.selectList("StatMapper.agenda",user_email);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session!=null)session.close();
		}		
		return agendaList;
	}

	public Stat getStat() {
		return stat;
	}

	public void setStat(Stat stat) {
		this.stat = stat;
	}

	//지난 달 통계
	public List<Stat> lastmonth_Stat(String user_email, int lastmonth) {
		List<Stat> month_total_list=null;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_email", user_email);
		map.put("lastmonth", lastmonth);
		
		try{
		session=factory.openSession();
			month_total_list=session.selectList("StatMapper.last_month",map);
			total_person_month=session.selectOne("StatMapper.last_met_people",map);
			
			stat=new Stat();
			stat.setTotal_person_month(total_person_month);
			stat.setTotal_count_month(month_total_list.get(0).getTotal_count_month());
			stat.setTotal_time_month(month_total_list.get(0).getTotal_time_month());
			stat.setTotal_title_month(month_total_list.get(0).getTotal_title_month());
			stat.setYear_month(month_total_list.get(0).getYear_month());
			stat.setMonth_month(month_total_list.get(0).getMonth_month());
			
			month_total_list.add(stat);			
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session != null)session.close();
		}	
		
		return month_total_list;
		
	}

	//다음 달 통계
	public List<Stat> nextmonth_Stat(String user_email, int nextmonth) {
		List<Stat> month_total_list=null;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_email", user_email);
		map.put("nextmonth", nextmonth);
		
		try{
		session=factory.openSession();
			month_total_list=session.selectList("StatMapper.next_month",map);
			total_person_month=session.selectOne("StatMapper.next_met_people",map);
			
			stat=new Stat();
			stat.setTotal_person_month(total_person_month);
			stat.setTotal_count_month(month_total_list.get(0).getTotal_count_month());
			stat.setTotal_time_month(month_total_list.get(0).getTotal_time_month());
			stat.setTotal_title_month(month_total_list.get(0).getTotal_title_month());
			stat.setYear_month(month_total_list.get(0).getYear_month());
			stat.setMonth_month(month_total_list.get(0).getMonth_month());
			
			month_total_list.add(stat);			
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session != null)session.close();
		}	
		
		return month_total_list;
	}

	//이번 달 통계 테이블
	public List<Stat> month_table_list(String user_email) {
		List<Stat> month_table_list=null;
		try{
			session=factory.openSession();
			month_table_list=session.selectList("StatMapper.month_table_list",user_email);
			session.commit();
			
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(session != null)session.close();
			}		
		return month_table_list;
	}
	
	
	
}
