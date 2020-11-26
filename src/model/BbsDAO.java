package model;

import java.util.Map;
import java.util.Vector;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import oracle.net.aso.q;

public class BbsDAO {
	public int getTotalRecordCount(Map<String, Object> map) {
		int totalCount =0;
		String query = "SELECT COUNT(*) FROM board";
		if(map.get("Word")!=null) {
			query += " WHERE "+map.get("Colum")+" "+
		" LIKE '%"+map.get("Word")+"'%";
		}
		if(map.get("Word")!=null) {
			query += " WHERE "+map.get("Colum")+" "+
					" LIKE '%"+map.get("Word")+"'%";
		}
		System.out.println("query="+query);
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			return totalCount;
		}
	}
	public List<BbsDTO> selectList(Map<String, Object>map){
			List<BbsDTO> bbs = new Vector<BbsDTO>();
			String query = "SELECT * FROM board ";
			if(map.get("Word")!=null) {
				query += " WHERE "+map.get("Colum")+" "+
						" LIKE '%"+map.get("Word")+"'%";
			}
			query += " ORDER BY num DESC";
			try {
				psmt = con.prepareStatment(query);
				rs = psmt.excuteQuery();
				while (rs.next()) {
					BbsDTO dto = new BbsDTO();
					
					dto.setNum(rs.getString(1));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString(3));
					dto.setPostDate(rs.getString("postdate"));
					dto.setId(rs.getString("id"));
					dto.setVisitcount(rs.getString(6));
					
					bbs.add(dto);
				}
			} catch (Exception e) {
				System.out.println("Select시 예외발생");
				e.printStackTrace();
			}
			
			return bbs;
			
			
			
			
			
			
			
			
	}
}
