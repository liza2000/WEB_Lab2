package lab2;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Data  {
    static final private String SESSIONS_QUERIES_LISTS = "SessionQueriesLists";
    private String Oy, NumR;
    public ArrayList<String> ox;

    Data() {
        ox = new ArrayList<String>();
    }

    public String getOy() {
        return Oy;
    }
    public void setOy(String oy) {
        Oy = oy;
    }
    public String getNumR() {
        return NumR;
    }
    public void setNumR(String numR) {
        NumR = numR;
    }
    public void putX(String x){
        ox.add(x);
    }

    public boolean validate(String xx){
        double x = Double.parseDouble(xx);
        double y = Double.parseDouble(Oy);
        double r = Double.parseDouble(NumR);
        return check_area(x,y,r);
    }

    public List<Map<String, String>> getSessionQueries(final ServletContext context, final HttpSession session) {

        Map<HttpSession, List<Map<String, String>>> map = (Map<HttpSession, List<Map<String, String>>>) context.getAttribute(SESSIONS_QUERIES_LISTS);
        if (map == null) {
            context.setAttribute(SESSIONS_QUERIES_LISTS, new HashMap<HttpSession, List<Map<String, String>>>());
            map = (Map<HttpSession, List<Map<String, String>>>) context.getAttribute(SESSIONS_QUERIES_LISTS);
        }
        if (map.get(session) == null)
            map.put(session, new ArrayList<Map<String, String>>());

        return map.get(session);
    }

    public String formResultTable(final HttpServletRequest request) {
        final List<Map<String, String>> sessionQueriesList = getSessionQueries(request.getServletContext(), request.getSession());
        final StringBuilder builder = new StringBuilder();
        builder.append("<table border=\"th\" id='table_on' width='400'><thead><tr>");
        builder.append("<th align=\"center\"><h5>X</h5></th>");
        builder.append("<th align=\"center\"><h5>Y</h5></th>");
        builder.append("<th align=\"center\"><h5>R</h5></th>");
        builder.append("<th align=\"center\"><h5>Попала?</h5></th>");
        builder.append("</tr></thead>");
        for (final Map<String, String> queryMap : sessionQueriesList) {
            builder.append("<tr><td align=\"center\">").append((queryMap.get("X")).substring(0, Math.min((queryMap.get("X")).length(), 5))).append("</td>");
            builder.append("<td align=\"center\">").append((queryMap.get("Y")).substring(0, Math.min((queryMap.get("Y")).length(), 5))).append("</td>");
            builder.append("<td align=\"center\">").append(queryMap.get("R")).append("</td>");
            builder.append("<td align=\"center\">").append(queryMap.get("A")).append("</td>");
            builder.append("</tr>");
        }
        builder.append("</table>");
        return builder.toString();
    }
    public boolean check_area(double x, double y, double r){
        if (x<0) return y<0? x+y>r/-2:Math.hypot(x,y)<r/2;
          return y<0 && (x<r/2&&y>-1*r);
    }
}
